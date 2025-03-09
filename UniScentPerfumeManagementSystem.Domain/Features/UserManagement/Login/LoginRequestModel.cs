namespace UniScentPerfumeManagementSystem.Domain.Features.UserManagement.Login;

public class LoginRequestModel
{
    [Required(ErrorMessage = "UserName is required.")]
    public string UserName { get; set; }

    [Required(ErrorMessage = "Password is required.")]
    public string Password { get; set; }
}