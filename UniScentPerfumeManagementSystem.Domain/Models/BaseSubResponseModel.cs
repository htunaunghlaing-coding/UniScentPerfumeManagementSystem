namespace UniScentPerfumeManagementSystem.Domain.Models;

public class BaseSubResponseModel
{
    public string Message { get; set; }
    public bool IsSuccess { get; set; }
}

public static class SubResponseModel
{
    public static BaseSubResponseModel GetResponseMsg(string message, bool isSuccess)
    {
        return new BaseSubResponseModel()
        {
            Message = message,
            IsSuccess = isSuccess
        };
    }
}
