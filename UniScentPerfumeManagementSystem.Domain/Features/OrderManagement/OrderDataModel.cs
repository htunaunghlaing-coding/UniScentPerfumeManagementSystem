namespace UniScentPerfumeManagementSystem.Domain.Features.OrderManagement;

public class OrderDataModel
{
    public int Id { get; set; }
    public int UserId { get; set; }
    public DateTime OrderDate { get; set; } = DateTime.UtcNow;
    public decimal TotalAmount { get; set; }
    public string PaymentMethod { get; set; }
    public string Status { get; set; } = "Pending";
    public DateTime CreatedAt { get; set; } = DateTime.UtcNow;
    public DateTime? UpdatedAt { get; set; }

    public List<OrderItemDataModel> Items { get; set; } = new();
}
