namespace UniScentPerfumeManagementSystem.Services
{
    public class CartService
    {
        private List<CartItem> _cartItems = new();

        public CartResponseModel AddToCart(PerfumeDataModel perfume)
        {
            var response = new CartResponseModel();
            try
            {
                var existingItem = _cartItems.FirstOrDefault(item => item.Perfume.Id == perfume.Id);
                if (existingItem != null)
                {
                    existingItem.Quantity++;
                    response.Response = SubResponseModel.GetResponseMsg("Quantity updated successfully.", true);
                }
                else
                {
                    _cartItems.Add(new CartItem { Perfume = perfume, Quantity = 1 });
                    response.Response = SubResponseModel.GetResponseMsg("Perfume added to cart successfully.", true);
                }

                response.CartItems = _cartItems;
                response.TotalPrice = GetTotalPrice();
            }
            catch (Exception ex)
            {
                response.Response = SubResponseModel.GetResponseMsg($"Error adding perfume to cart: {ex.Message}", false);
            }
            return response;
        }

        public CartResponseModel RemoveFromCart(int perfumeId)
        {
            var response = new CartResponseModel();
            try
            {
                var itemToRemove = _cartItems.FirstOrDefault(item => item.Perfume.Id == perfumeId);
                if (itemToRemove != null)
                {
                    _cartItems.Remove(itemToRemove);
                    response.Response = SubResponseModel.GetResponseMsg("Perfume removed from cart successfully.", true);
                }
                else
                {
                    response.Response = SubResponseModel.GetResponseMsg("Perfume not found in cart.", false);
                }

                response.CartItems = _cartItems;
                response.TotalPrice = GetTotalPrice();
            }
            catch (Exception ex)
            {
                response.Response = SubResponseModel.GetResponseMsg($"Error removing perfume from cart: {ex.Message}", false);
            }
            return response;
        }

        public CartResponseModel UpdateQuantity(int perfumeId, int change)
        {
            var response = new CartResponseModel();
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

                    response.Response = SubResponseModel.GetResponseMsg("Quantity updated successfully.", true);
                }
                else
                {
                    response.Response = SubResponseModel.GetResponseMsg("Perfume not found in cart.", false);
                }

                response.CartItems = _cartItems;
                response.TotalPrice = GetTotalPrice();
            }
            catch (Exception ex)
            {
                response.Response = SubResponseModel.GetResponseMsg($"Error updating quantity: {ex.Message}", false);
            }
            return response;
        }

        public CartResponseModel GetCartItems()
        {
            var response = new CartResponseModel();
            try
            {
                response.CartItems = _cartItems;
                response.TotalPrice = GetTotalPrice();
                response.Response = SubResponseModel.GetResponseMsg("Cart items retrieved successfully.", true);
            }
            catch (Exception ex)
            {
                response.Response = SubResponseModel.GetResponseMsg($"Error retrieving cart items: {ex.Message}", false);
            }
            return response;
        }

        private decimal GetTotalPrice()
        {
            return _cartItems.Sum(item => item.Perfume.Price * item.Quantity);
        }
    }

    public class CartResponseModel
    {
        public List<CartItem> CartItems { get; set; } = new();
        public decimal TotalPrice { get; set; }
        public BaseSubResponseModel Response { get; set; }
    }
}