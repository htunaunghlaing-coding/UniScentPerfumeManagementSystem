namespace UniScentPerfumeManagementSystem.Domain.Features.OrderManagement;

public class OrderItemRequestModel
{
    public int PerfumeId { get; set; }
    public int Quantity { get; set; }
    public decimal UnitPrice { get; set; }
}
