namespace UniScentPerfumeManagementSystem.Domain.Features.UserManagement.Login;

public class LoginService
{
    private readonly AppDbContext _db;

    public LoginService(AppDbContext db)
    {
        _db = db;
    }

    public async Task<LoginResponseModel> Login(LoginRequestModel requestModel)
    {
        var model = new LoginResponseModel();

        try
        {
            string hashpw = requestModel.Password.ToSHA256HexHashString(requestModel.UserName);

            var user = await _db.TblUsers.AsNoTracking().FirstOrDefaultAsync(x =>
                x.UserName == requestModel.UserName &&
                x.Password == hashpw);
            if (user == null)
            {
                model.Response = SubResponseModel.GetResponseMsg("Invalid username or password.", false);
                return model;
            }
            model.UserName = user.UserName;
            model.Phone = user.PhoneNo;
            model.UserId = user.UserId;
            model.Role = user.RoleCode;
            model.Response = SubResponseModel.GetResponseMsg("Warming Welcome.Enjoy managing your perfumes!", true);
        }
        catch (Exception ex)
        {
            model.Response = SubResponseModel.GetResponseMsg(ex.ToString(), false);
        }

        return model;
    }
}
