using UniScentPerfumeManagementSystem.Domain.Features.OrderManagement.Enums;

namespace UniScentPerfumeManagementSystem.Domain.Features.OrderManagement;

public class OrderResponseModel
{
    public int OrderId { get; set; }
    public int UserId { get; set; }
    public decimal TotalAmount { get; set; }
    public PaymentMethod PaymentMethod { get; set; }
    public string Status { get; set; } = string.Empty;
    public DateTime OrderDate { get; set; }
    public List<OrderItemResponseModel> Items { get; set; } = new();
    public string Message { get; set; } = string.Empty;
}
