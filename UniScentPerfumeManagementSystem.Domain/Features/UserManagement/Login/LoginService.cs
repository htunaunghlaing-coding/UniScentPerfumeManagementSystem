using UniScentPerfumeManagementSystem.Database.EfModels;
using UniScentPerfumeManagementSystem.Shared;

namespace UniScentPerfumeManagementSystem.Domain.Features.UserManagement.Login;

public class LoginService
{
    private readonly AppDbContext _db;

    public LoginService(AppDbContext db)
    {
        _db = db;
    }

    public async Task<Result<LoginResponseModel>> Login(LoginRequestModel requestModel)
    {
        try
        {
            string hashpw = requestModel.Password.ToSHA256HexHashString(requestModel.UserName);

            var user = await _db.TblUsers.AsNoTracking().FirstOrDefaultAsync(x =>
                x.UserName == requestModel.UserName &&
                x.Password == hashpw);

            if (user == null)
            {
                return Result<LoginResponseModel>.FailureResult("Invalid username or password.");
            }

            var responseModel = new LoginResponseModel
            {
                UserName = user.UserName,
                Phone = user.PhoneNo,
                UserId = user.UserId,
                Role = user.RoleCode
            };

            return Result<LoginResponseModel>.SuccessResult(responseModel, "Warming Welcome. Enjoy ordering your perfumes!");
        }
        catch (Exception ex)
        {
            return Result<LoginResponseModel>.FailureResult(ex.Message);
        }
    }
}