using UniScentPerfumeManagementSystem.Domain.Features.OrderManagement.Enums;

namespace UniScentPerfumeManagementSystem.Domain.Features.OrderManagement;

public class OrderRequestModel
{
    public int UserId { get; set; }
    public List<OrderItemRequestModel> Items { get; set; } = new();
    public decimal TotalAmount { get; set; }
    public PaymentMethod PaymentMethod { get; set; } // Use the enum type
    public BillingAddressModel BillingAddress { get; set; } = new();
    public decimal TipsPercentage { get; set; }
}
