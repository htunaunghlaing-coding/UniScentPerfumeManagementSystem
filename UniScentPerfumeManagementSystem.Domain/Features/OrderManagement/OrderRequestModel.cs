using UniScentPerfumeManagementSystem.Domain.Features.OrderManagement.Enums;

namespace UniScentPerfumeManagementSystem.Domain.Features.OrderManagement;

public class OrderRequestModel
{
    public string UserId { get; set; }
    public List<OrderItemRequestModel> Items { get; set; } = new();
    public decimal TotalAmount { get; set; }
    public PaymentMethod PaymentMethod { get; set; } 
    public BillingAddressModel BillingAddress { get; set; } = new();
    public decimal TipsPercentage { get; set; }
}
