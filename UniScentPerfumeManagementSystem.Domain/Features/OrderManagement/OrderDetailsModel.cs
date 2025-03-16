using UniScentPerfumeManagementSystem.Domain.Features.OrderManagement.Enums;

namespace UniScentPerfumeManagementSystem.Domain.Features.OrderManagement;

public class OrderDetailsModel
{
    public PaymentMethod PaymentMethod { get; set; }
    public BillingAddressModel BillingAddress { get; set; } = new();
    public decimal TipsPercentage { get; set; }
    public decimal Subtotal { get; set; }
    public decimal TipsAmount { get; set; }
    public decimal TotalAmount { get; set; }
    public List<OrderItemResponseModel> Items { get; set; } = new();
}
