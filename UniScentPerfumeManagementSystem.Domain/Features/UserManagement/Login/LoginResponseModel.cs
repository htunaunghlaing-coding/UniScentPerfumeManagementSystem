namespace UniScentPerfumeManagementSystem.Domain.Features.UserManagement.Login;

public class LoginResponseModel
{
    public string UserId { get; set; }
    public string? UserName { get; set; }
    public string? Phone { get; set; }
    public string? Role { get; set; }
    public BaseSubResponseModel Response { get; set; }
}
