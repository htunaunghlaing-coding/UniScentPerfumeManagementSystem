using UniScentPerfumeManagementSystem.Domain.Features.CartManagement;
using UniScentPerfumeManagementSystem.Domain.Features.PerfumeManagement;

namespace UniScentPerfumeManagementSystem.Services
{
    public class CartService
    {
        private List<CartItem> _cartItems = new();

        public void AddToCart(PerfumeDataModel perfume)
        {
            var existingItem = _cartItems.FirstOrDefault(item => item.Perfume.Id == perfume.Id);
            if (existingItem != null)
            {
                existingItem.Quantity++;
            }
            else
            {
                _cartItems.Add(new CartItem { Perfume = perfume, Quantity = 1 });
            }
        }

        public void RemoveFromCart(int perfumeId)
        {
            var itemToRemove = _cartItems.FirstOrDefault(item => item.Perfume.Id == perfumeId);
            if (itemToRemove != null)
            {
                _cartItems.Remove(itemToRemove);
            }
        }

        public void UpdateQuantity(int perfumeId, int change)
        {
            var item = _cartItems.FirstOrDefault(item => item.Perfume.Id == perfumeId);
            if (item != null)
            {
                item.Quantity += change;

                // Ensure quantity doesn't go below 1
                if (item.Quantity < 1)
                {
                    item.Quantity = 1;
                }
            }
        }

        public List<CartItem> GetCartItems()
        {
            return _cartItems;
        }

        public decimal GetTotalPrice()
        {
            return _cartItems.Sum(item => item.Perfume.Price * item.Quantity);
        }
    }
}