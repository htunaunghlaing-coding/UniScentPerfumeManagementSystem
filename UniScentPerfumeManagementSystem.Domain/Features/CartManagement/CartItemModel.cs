namespace UniScentPerfumeManagementSystem.Domain.Features.CartManagement;

public class CartItemModel
{
    public PerfumeDataModel Perfume { get; set; }
    public int Quantity { get; set; } = 1;
}
