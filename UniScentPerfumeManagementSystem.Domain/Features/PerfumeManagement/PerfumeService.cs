namespace UniScentPerfumeManagementSystem.Domain.Features.PerfumeManagement;

public class PerfumeService
{
    private readonly AppDbContext _db;

    public PerfumeService(AppDbContext db)
    {
        _db = db;
    }

    public async Task<PerfumeResponseModel> GetPerfumeById(int perfumeId)
    {
        var model = new PerfumeResponseModel();
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
                model.Response = SubResponseModel.GetResponseMsg("No perfume found.", false);
                return model;
            }

            model = MapToResponse(perfume);
            model.Response = SubResponseModel.GetResponseMsg("Perfume retrieved successfully.", true);
        }
        catch (Exception ex)
        {
            model.Response = SubResponseModel.GetResponseMsg(ex.ToString(), false);
        }
        return model;
    }

    public async Task<PerfumeResponseModel> GetPerfumesByCategory(string category, PageSettingModel pageSetting)
    {
        var model = new PerfumeResponseModel();
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

            model.PageSetting = new PageSettingResponseModel
            {
                PageNo = pageSetting.PageNo,
                RowCount = pageSetting.PageSize,
                TotalRowCount = totalRowCount
            };

            model.PerfumeList = perfumes;
            model.Response = SubResponseModel.GetResponseMsg("Perfumes retrieved successfully.", true);
        }
        catch (Exception ex)
        {
            model.Response = SubResponseModel.GetResponseMsg(ex.ToString(), false);
        }
        return model;
    }

    public async Task<PerfumeResponseModel> GetPerfumesByCategory(string category)
    {
        var model = new PerfumeResponseModel();
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

            model.PerfumeList = perfumes;
            model.Response = SubResponseModel.GetResponseMsg("Perfumes retrieved successfully.", true);
        }
        catch (Exception ex)
        {
            model.Response = SubResponseModel.GetResponseMsg(ex.ToString(), false);
        }

        return model;
    }

    public async Task<PerfumeResponseModel> Create(PerfumeRequestModel requestModel)
    {
        var model = new PerfumeResponseModel();
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

            model.Response = SubResponseModel.GetResponseMsg("Perfume created successfully.", true);
        }
        catch (Exception ex)
        {
            model.Response = SubResponseModel.GetResponseMsg(ex.ToString(), false);
        }
        return model;
    }

    public async Task<PerfumeResponseModel> Update(PerfumeRequestModel requestModel)
    {
        var model = new PerfumeResponseModel();
        try
        {
            var perfume = await _db.TblPerfumes.AsNoTracking()
                .FirstOrDefaultAsync(p => p.Id == requestModel.Id);

            if (perfume == null)
            {
                model.Response = SubResponseModel.GetResponseMsg("No perfume found.", false);
                return model;
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

            model.Response = SubResponseModel.GetResponseMsg("Perfume updated successfully.", true);
        }
        catch (Exception ex)
        {
            model.Response = SubResponseModel.GetResponseMsg(ex.ToString(), false);
        }
        return model;
    }

    public async Task<PerfumeResponseModel> Delete(int perfumeId)
    {
        var model = new PerfumeResponseModel();
        try
        {
            var perfume = await _db.TblPerfumes.AsNoTracking()
                .FirstOrDefaultAsync(p => p.Id == perfumeId);

            if (perfume == null)
            {
                model.Response = SubResponseModel.GetResponseMsg("No perfume found.", false);
                return model;
            }

            _db.Remove(perfume);
            await _db.SaveChangesAsync();

            model.Response = SubResponseModel.GetResponseMsg("Perfume deleted successfully.", true);
        }
        catch (Exception ex)
        {
            model.Response = SubResponseModel.GetResponseMsg(ex.ToString(), false);
        }
        return model;
    }

    public async Task<PerfumeResponseModel> GetPerfumesByGender(string gender)
    {
        var model = new PerfumeResponseModel();
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

            model.PerfumeList = perfumes;
            model.Response = SubResponseModel.GetResponseMsg("Perfumes retrieved successfully.", true);
        }
        catch (Exception ex)
        {
            model.Response = SubResponseModel.GetResponseMsg(ex.ToString(), false);
        }

        return model;
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