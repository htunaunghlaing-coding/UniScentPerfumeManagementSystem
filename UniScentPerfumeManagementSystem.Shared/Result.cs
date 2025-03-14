namespace UniScentPerfumeManagementSystem.Shared;

public class Result<T>
{
    public bool IsSuccess { get; set; }
    public bool IsError { get {  return false; } }
    public string Message { get; set; }
    public T Data { get; set; }

    public static Result<T> SuccessResult(T data, string message = "Operation is Successfully")
    {
        return new Result<T> { IsSuccess = true, Message = message, Data = data };
    }

    public static Result<T> SuccessResult(string message = "Operation is Successfully.")
    {
        return new Result<T> { IsSuccess = true, Message = message };
    }

    public static Result<T> FailureResult(string message)
    {
        return new Result<T> { IsSuccess = false, Message = message };  
    }

    public static Result<T> FailureResult(Exception exception)
    {
        return new Result<T> { IsSuccess = false, Message = exception.Message };
    }
}