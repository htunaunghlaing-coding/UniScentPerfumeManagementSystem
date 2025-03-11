using UniScentPerfumeManagementSystem.Shared.Enums;

namespace UniScentPerfumeManagementSystem.Domain.Features.UserManagement.Register;

public class RegisterService
{
    private readonly AppDbContext _db;

    public RegisterService(AppDbContext db)
    {
        _db = db;
    }

    public async Task<LoginResponseModel> Register(RegisterRequestModel reqModel)
    {
        var model = new LoginResponseModel();
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
                    model.Response = SubResponseModel.GetResponseMsg("Your UserName is already exist.", false);
                    return model;
                }
                if (user.PhoneNo == reqModel.PhoneNo)
                {
                    model.Response = SubResponseModel.GetResponseMsg("Your PhoneNo is already exist.", false);
                    return model;
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

            model.Response = SubResponseModel.GetResponseMsg("Registration Success! Thanks for registering!", true);
        }
        catch (Exception ex)
        {
            model.Response = SubResponseModel.GetResponseMsg(ex.ToString(), false);
        }

        return model;
    }
}