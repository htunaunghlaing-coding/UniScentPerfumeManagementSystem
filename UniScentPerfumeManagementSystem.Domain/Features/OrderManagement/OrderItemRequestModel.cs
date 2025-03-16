namespace UniScentPerfumeManagementSystem.Domain.Features.OrderManagement;

public class OrderItemRequestModel : BaseRequestModel
{
    public int PerfumeId { get; set; }
    public int Quantity { get; set; }
    public decimal UnitPrice { get; set; }
}
