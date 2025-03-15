namespace UniScentPerfumeManagementSystem.Domain.Features.OrderManagement;

public class OrderItemResponseModel
{
    public int PerfumeId { get; set; }
    public string Name { get; set; } = string.Empty;
    public int Quantity { get; set; }
    public decimal UnitPrice { get; set; }
    public int SizeMl { get; set; }
    public string PictureUrl { get; set; } = string.Empty;
}