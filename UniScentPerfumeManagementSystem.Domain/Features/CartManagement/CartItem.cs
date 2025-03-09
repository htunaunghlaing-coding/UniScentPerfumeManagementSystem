namespace UniScentPerfumeManagementSystem.Domain.Features.CartManagement;

public class CartItem
{
    public PerfumeDataModel Perfume { get; set; }
    public int Quantity { get; set; } = 1;
}
