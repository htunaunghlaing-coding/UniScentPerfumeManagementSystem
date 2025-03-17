using UniScentPerfumeManagementSystem.Database.EfModels;
using System.Threading.Tasks;

namespace UniScentPerfumeManagementSystem.Domain.Features.OrderManagement;

public class CheckoutService
{
    private readonly AppDbContext _db;

    public CheckoutService(AppDbContext db)
    {
        _db = db;
    }

    // Process the order and save it with "Success" status
    public async Task<OrderResponseModel?> ProcessOrderAsync(OrderRequestModel request)
    {
        // Validate the request
        if (request.Items == null || !request.Items.Any())
        {
            Console.WriteLine("Order must contain at least one item.");
            return null;
        }

        if (string.IsNullOrEmpty(request.UserId))
        {
            Console.WriteLine("UserId cannot be null or empty.");
            return null;
        }

        try
        {
            // Create the order object
            var order = new TblOrder
            {
                UserId = request.UserId,
                TotalAmount = request.TotalAmount,
                PaymentMethod = request.PaymentMethod.ToString(),
                OrderDate = DateTime.UtcNow,
                Status = "Success", // Set status to "Success" immediately
                CreatedAt = DateTime.UtcNow,
                TblOrderItems = new List<TblOrderItem>(), // Initialize collection
                TblOrderAddresses = new List<TblOrderAddress>() // Initialize collection
            };

            // Add order items
            foreach (var item in request.Items)
            {
                order.TblOrderItems.Add(new TblOrderItem
                {
                    PerfumeId = item.PerfumeId,
                    Quantity = item.Quantity,
                    UnitPrice = item.UnitPrice
                });
            }

            // Add billing address
            order.TblOrderAddresses.Add(new TblOrderAddress
            {
                Country = request.BillingAddress.Country,
                FullName = request.BillingAddress.FullName,
                AddressLine1 = request.BillingAddress.AddressLine1,
                AddressLine2 = request.BillingAddress.AddressLine2,
                City = request.BillingAddress.City,
                State = request.BillingAddress.State,
                PostalCode = request.BillingAddress.PostalCode,
                PhoneNo = request.BillingAddress.PhoneNo,
                CreatedAt = DateTime.UtcNow
            });

            // Save the order to the database
            await _db.TblOrders.AddAsync(order);
            await _db.SaveChangesAsync(); // This should cascade changes to related entities

            // Populate the response model
            return new OrderResponseModel
            {
                OrderId = order.Id,
                UserId = order.UserId,
                TotalAmount = order.TotalAmount,
                PaymentMethod = request.PaymentMethod,
                Status = order.Status, // "Success"
                Message = "Order placed successfully."
            };
        }
        catch (Exception ex)
        {
            // Log the exception (optional)
            Console.WriteLine($"Error placing order: {ex.Message}");
            return null;
        }
    }
}