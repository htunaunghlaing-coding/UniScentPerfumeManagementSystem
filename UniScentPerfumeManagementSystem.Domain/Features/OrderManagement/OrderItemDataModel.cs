namespace UniScentPerfumeManagementSystem.Domain.Features.OrderManagement;

public class OrderItemDataModel
{
    public int Id { get; set; }
    public int OrderId { get; set; }
    public int PerfumeId { get; set; }
    public int Quantity { get; set; }
    public decimal UnitPrice { get; set; }
    public DateTime CreatedAt { get; set; } = DateTime.UtcNow;

    public OrderDataModel Order { get; set; }
}
