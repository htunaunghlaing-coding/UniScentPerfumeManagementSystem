namespace UniScentPerfumeManagementSystem.Domain.Features.CartManagement;

public class CartService
{
    private List<CartItemModel> _cartItems = new();

    public Result<CartResponseModel> AddToCart(PerfumeDataModel perfume)
    {
        try
        {
            var existingItem = _cartItems.FirstOrDefault(item => item.Perfume.Id == perfume.Id);
            if (existingItem != null)
            {
                existingItem.Quantity++;
                return Result<CartResponseModel>.SuccessResult(GetCartResponse(), "Quantity updated successfully.");
            }
            else
            {
                _cartItems.Add(new CartItemModel { Perfume = perfume, Quantity = 1 });
                return Result<CartResponseModel>.SuccessResult(GetCartResponse(), "Perfume added to cart successfully.");
            }
        }
        catch (Exception ex)
        {
            return Result<CartResponseModel>.FailureResult($"Error adding perfume to cart: {ex.Message}");
        }
    }

    public async Task<Result<CartResponseModel>> RemoveFromCart(int perfumeId)
    {
        try
        {
            var itemToRemove = _cartItems.FirstOrDefault(item => item.Perfume.Id == perfumeId);
            if (itemToRemove != null)
            {
                _cartItems.Remove(itemToRemove);
                return Result<CartResponseModel>.SuccessResult(GetCartResponse(), "Perfume removed from cart successfully.");
            }
            else
            {
                return Result<CartResponseModel>.FailureResult("Perfume not found in cart.");
            }
        }
        catch (Exception ex)
        {
            return Result<CartResponseModel>.FailureResult($"Error removing perfume from cart: {ex.Message}");
        }
    }

    public async Task<Result<CartResponseModel>> UpdateQuantity(int perfumeId, int change)
    {
        try
        {
            var item = _cartItems.FirstOrDefault(item => item.Perfume.Id == perfumeId);
            if (item != null)
            {
                item.Quantity += change;

                if (item.Quantity < 1)
                {
                    item.Quantity = 1;
                }

                return Result<CartResponseModel>.SuccessResult(GetCartResponse(), "Quantity updated successfully.");
            }
            else
            {
                return Result<CartResponseModel>.FailureResult("Perfume not found in cart.");
            }
        }
        catch (Exception ex)
        {
            return Result<CartResponseModel>.FailureResult($"Error updating quantity: {ex.Message}");
        }
    }

    public Task<Result<CartResponseModel>> GetCartItems()
    {
        try
        {
            return Task.FromResult(Result<CartResponseModel>.SuccessResult(GetCartResponse(), "Cart items retrieved successfully."));
        }
        catch (Exception ex)
        {
            return Task.FromResult(Result<CartResponseModel>.FailureResult($"Error retrieving cart items: {ex.Message}"));
        }
    }

    private CartResponseModel GetCartResponse()
    {
        return new CartResponseModel
        {
            CartItems = _cartItems,
            TotalPrice = GetTotalPrice()
        };
    }

    private decimal GetTotalPrice()
    {
        return _cartItems.Sum(item => item.Perfume.Price * item.Quantity);
    }
}

public class CartResponseModel
{
    public List<CartItemModel> CartItems { get; set; } = new();
    public decimal TotalPrice { get; set; }
    public BaseSubResponseModel Response { get; set; }
}