namespace UniScentPerfumeManagementSystem.Domain.Features.UserManagement.Login;

public class LoginRequestModel
{
    [Required(ErrorMessage = "UserName is required.")]
    public string UserName { get; set; }

    [Required(ErrorMessage = "Password is required.")]
    public string Password { get; set; }

    [Required(ErrorMessage = "PhoneNo is required.")]
    public string? PhoneNo { get; set; }

    [Required(ErrorMessage = "Email is required.")]
    [EmailAddress(ErrorMessage = "Invalid email format.")]
    public string? Email { get; set; }

    [Required(ErrorMessage = "Confirm Password is required.")]
    [Compare(nameof(Password), ErrorMessage = "Password and Confirm Password must match.")]
    public string? ConfirmPassword { get; set; }
}
