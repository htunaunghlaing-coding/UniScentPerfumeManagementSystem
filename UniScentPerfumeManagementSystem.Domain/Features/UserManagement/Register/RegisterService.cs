using UniScentPerfumeManagementSystem.Database.EfModels;
using UniScentPerfumeManagementSystem.Shared;
using UniScentPerfumeManagementSystem.Shared.Enums;

namespace UniScentPerfumeManagementSystem.Domain.Features.UserManagement.Register;

public class RegisterService
{
    private readonly AppDbContext _db;

    public RegisterService(AppDbContext db)
    {
        _db = db;
    }

    public async Task<Result<LoginResponseModel>> Register(RegisterRequestModel reqModel)
    {
        try
        {
            #region Check Duplicate UserName and PhoneNo

            var user = await _db.TblUsers.AsNoTracking().FirstOrDefaultAsync(x =>
                    x.UserName.ToLower().Trim() == reqModel.UserName.ToLower().Trim() ||
                    x.PhoneNo == reqModel.PhoneNo);

            if (user is not null)
            {
                if (user.UserName.ToLower().Trim() == reqModel.UserName.ToLower().Trim())
                {
                    return Result<LoginResponseModel>.FailureResult("Your UserName is already exist.");
                }
                if (user.PhoneNo == reqModel.PhoneNo)
                {
                    return Result<LoginResponseModel>.FailureResult("Your PhoneNo is already exist.");
                }
            }

            #endregion

            string hashpw = reqModel.Password.ToSHA256HexHashString(reqModel.UserName);

            var item = new TblUser
            {
                UserId = Guid.NewGuid().ToString(),
                UserName = reqModel.UserName,
                PhoneNo = reqModel.PhoneNo,
                Email = reqModel.Email,
                Password = hashpw,
                CreatedDate = DateTime.Now,
                RoleCode = EnumRoleType.Customer.ToEnumDescription()
            };

            await _db.AddAsync(item);
            await _db.SaveChangesAsync();

            var responseModel = new LoginResponseModel
            {
                UserName = item.UserName,
                Phone = item.PhoneNo,
                UserId = item.UserId,
                Role = item.RoleCode
            };

            return Result<LoginResponseModel>.SuccessResult(responseModel, "Registration Success! Thanks for registering!");
        }
        catch (Exception ex)
        {
            return Result<LoginResponseModel>.FailureResult(ex.Message);
        }
    }
}