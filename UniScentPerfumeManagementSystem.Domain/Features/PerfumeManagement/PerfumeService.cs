using UniScentPerfumeManagementSystem.Database.EfModels;
using UniScentPerfumeManagementSystem.Shared;

namespace UniScentPerfumeManagementSystem.Domain.Features.PerfumeManagement;

public class PerfumeService
{
    private readonly AppDbContext _db;

    public PerfumeService(AppDbContext db)
    {
        _db = db;
    }

    public async Task<Result<PerfumeResponseModel>> GetPerfumeById(int perfumeId)
    {
        try
        {
            var perfume = await _db.TblPerfumes
                .Where(p => p.Id == perfumeId)
                .Select(p => new PerfumeDataModel
                {
                    Id = p.Id,
                    Name = p.Name,
                    CompanyName = p.CompanyName,
                    Price = p.Price,
                    Category = p.Category,
                    StockQuantity = p.StockQuantity,
                    SizeML = p.SizeMl,
                    PictureUrl = p.PictureUrl,
                    Longevity = p.Longevity,
                    KeyIngredients = p.KeyIngredients,
                    Notes = p.Notes,
                    Description = p.Description,
                    Status = p.Status,
                    CreatedAt = p.CreatedAt,
                    UpdatedAt = p.UpdatedAt,
                    Gender = p.Gender
                })
                .FirstOrDefaultAsync();

            if (perfume == null)
            {
                return Result<PerfumeResponseModel>.FailureResult("No perfume found.");
            }

            var model = MapToResponse(perfume);
            return Result<PerfumeResponseModel>.SuccessResult(model, "Perfume retrieved successfully.");
        }
        catch (Exception ex)
        {
            return Result<PerfumeResponseModel>.FailureResult(ex.Message);
        }
    }

    public async Task<Result<PerfumeResponseModel>> GetPerfumesByCategory(string category, PageSettingModel pageSetting)
    {
        try
        {
            var query = _db.TblPerfumes
                .Where(p => p.Category == category)
                .Select(p => new PerfumeDataModel
                {
                    Id = p.Id,
                    Name = p.Name,
                    CompanyName = p.CompanyName,
                    Price = p.Price,
                    Category = p.Category,
                    StockQuantity = p.StockQuantity,
                    SizeML = p.SizeMl,
                    PictureUrl = p.PictureUrl,
                    Longevity = p.Longevity,
                    KeyIngredients = p.KeyIngredients,
                    Notes = p.Notes,
                    Description = p.Description,
                    Status = p.Status,
                    CreatedAt = p.CreatedAt,
                    UpdatedAt = p.UpdatedAt,
                    Gender = p.Gender
                });

            var totalRowCount = await query.CountAsync();
            var perfumes = await query
                .Skip(pageSetting.SkipRowCount)
                .Take(pageSetting.PageSize)
                .ToListAsync();

            var model = new PerfumeResponseModel
            {
                PageSetting = new PageSettingResponseModel
                {
                    PageNo = pageSetting.PageNo,
                    RowCount = pageSetting.PageSize,
                    TotalRowCount = totalRowCount
                },
                PerfumeList = perfumes
            };

            return Result<PerfumeResponseModel>.SuccessResult(model, "Perfumes retrieved successfully.");
        }
        catch (Exception ex)
        {
            return Result<PerfumeResponseModel>.FailureResult(ex.Message);
        }
    }

    public async Task<Result<PerfumeResponseModel>> GetPerfumesByCategory(string category)
    {
        try
        {
            var perfumes = await _db.TblPerfumes
                .Where(p => p.Category == category)
                .Select(p => new PerfumeDataModel
                {
                    Id = p.Id,
                    Name = p.Name,
                    CompanyName = p.CompanyName,
                    Price = p.Price,
                    Category = p.Category,
                    StockQuantity = p.StockQuantity,
                    SizeML = p.SizeMl,
                    PictureUrl = p.PictureUrl,
                    Longevity = p.Longevity,
                    KeyIngredients = p.KeyIngredients,
                    Notes = p.Notes,
                    Description = p.Description,
                    Status = p.Status,
                    CreatedAt = p.CreatedAt,
                    UpdatedAt = p.UpdatedAt,
                    Gender = p.Gender,
                })
                .ToListAsync();

            var model = new PerfumeResponseModel
            {
                PerfumeList = perfumes
            };

            return Result<PerfumeResponseModel>.SuccessResult(model, "Perfumes retrieved successfully.");
        }
        catch (Exception ex)
        {
            return Result<PerfumeResponseModel>.FailureResult(ex.Message);
        }
    }

    public async Task<Result<PerfumeResponseModel>> Create(PerfumeRequestModel requestModel)
    {
        try
        {
            var perfume = new TblPerfume
            {
                Name = requestModel.Name,
                CompanyName = requestModel.CompanyName,
                Price = requestModel.Price,
                Category = requestModel.Category,
                StockQuantity = requestModel.StockQuantity,
                SizeMl = requestModel.SizeML,
                PictureUrl = requestModel.PictureUrl,
                Longevity = requestModel.Longevity,
                KeyIngredients = requestModel.KeyIngredients,
                Notes = requestModel.Notes,
                Description = requestModel.Description,
                Status = requestModel.Status,
                CreatedAt = DateTime.Now,
                Gender = requestModel.Gender,
            };

            await _db.AddAsync(perfume);
            await _db.SaveAndDetachAsync();

            return Result<PerfumeResponseModel>.SuccessResult(null, "Perfume created successfully.");
        }
        catch (Exception ex)
        {
            return Result<PerfumeResponseModel>.FailureResult(ex.Message);
        }
    }

    public async Task<Result<PerfumeResponseModel>> Update(PerfumeRequestModel requestModel)
    {
        try
        {
            var perfume = await _db.TblPerfumes.AsNoTracking()
                .FirstOrDefaultAsync(p => p.Id == requestModel.Id);

            if (perfume == null)
            {
                return Result<PerfumeResponseModel>.FailureResult("No perfume found.");
            }

            perfume.Name = requestModel.Name;
            perfume.CompanyName = requestModel.CompanyName;
            perfume.Price = requestModel.Price;
            perfume.Category = requestModel.Category;
            perfume.StockQuantity = requestModel.StockQuantity;
            perfume.SizeMl = requestModel.SizeML;
            perfume.PictureUrl = requestModel.PictureUrl;
            perfume.Longevity = requestModel.Longevity;
            perfume.KeyIngredients = requestModel.KeyIngredients;
            perfume.Notes = requestModel.Notes;
            perfume.Description = requestModel.Description;
            perfume.Status = requestModel.Status;
            perfume.Gender = requestModel.Gender;
            perfume.UpdatedAt = DateTime.Now;

            _db.Entry(perfume).State = EntityState.Modified;
            await _db.SaveAndDetachAsync();

            return Result<PerfumeResponseModel>.SuccessResult(null, "Perfume updated successfully.");
        }
        catch (Exception ex)
        {
            return Result<PerfumeResponseModel>.FailureResult(ex.Message);
        }
    }

    public async Task<Result<PerfumeResponseModel>> Delete(int perfumeId)
    {
        try
        {
            var perfume = await _db.TblPerfumes.AsNoTracking()
                .FirstOrDefaultAsync(p => p.Id == perfumeId);

            if (perfume == null)
            {
                return Result<PerfumeResponseModel>.FailureResult("No perfume found.");
            }

            _db.Remove(perfume);
            await _db.SaveChangesAsync();

            return Result<PerfumeResponseModel>.SuccessResult(null, "Perfume deleted successfully.");
        }
        catch (Exception ex)
        {
            return Result<PerfumeResponseModel>.FailureResult(ex.Message);
        }
    }

    public async Task<Result<PerfumeResponseModel>> GetPerfumesByGender(string gender)
    {
        try
        {
            var perfumes = await _db.TblPerfumes
                .Where(p => p.Gender == gender)
                .Select(p => new PerfumeDataModel
                {
                    Id = p.Id,
                    Name = p.Name,
                    CompanyName = p.CompanyName,
                    Price = p.Price,
                    Category = p.Category,
                    StockQuantity = p.StockQuantity,
                    SizeML = p.SizeMl,
                    PictureUrl = p.PictureUrl,
                    Longevity = p.Longevity,
                    KeyIngredients = p.KeyIngredients,
                    Notes = p.Notes,
                    Description = p.Description,
                    Status = p.Status,
                    CreatedAt = p.CreatedAt,
                    UpdatedAt = p.UpdatedAt,
                    Gender = p.Gender,
                })
                .ToListAsync();

            var model = new PerfumeResponseModel
            {
                PerfumeList = perfumes
            };

            return Result<PerfumeResponseModel>.SuccessResult(model, "Perfumes retrieved successfully.");
        }
        catch (Exception ex)
        {
            return Result<PerfumeResponseModel>.FailureResult(ex.Message);
        }
    }

    private PerfumeResponseModel MapToResponse(PerfumeDataModel data)
    {
        return new PerfumeResponseModel
        {
            Id = data.Id,
            Name = data.Name,
            CompanyName = data.CompanyName,
            Price = data.Price,
            Category = data.Category,
            StockQuantity = data.StockQuantity,
            SizeML = data.SizeML,
            PictureUrl = data.PictureUrl,
            Longevity = data.Longevity,
            KeyIngredients = data.KeyIngredients,
            Notes = data.Notes,
            Description = data.Description,
            Status = data.Status,
            CreatedAt = data.CreatedAt,
            UpdatedAt = data.UpdatedAt,
            Gender = data.Gender,
            Perfume = data
        };
    }
}