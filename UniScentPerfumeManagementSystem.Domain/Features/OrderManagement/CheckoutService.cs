using UniScentPerfumeManagementSystem.Domain.Features.OrderManagement;

public class CheckoutService
{
    private readonly AppDbContext _db;

    public CheckoutService(AppDbContext db)
    {
        _db = db;
    }

    public async Task<OrderResponseModel> ProcessOrderAsync(OrderRequestModel request)
    {
        var response = new OrderResponseModel();

        try
        {
            if (request.Items == null || !request.Items.Any())
            {
                response.Message = "Order must contain at least one item.";
                return response;
            }

            var order = new TblOrder
            {
                UserId =  int.Parse(request.UserId.ToString()),
                TotalAmount = request.TotalAmount,
                PaymentMethod = request.PaymentMethod.ToString(),
                OrderDate = DateTime.UtcNow,
                Status = "Pending",
                CreatedAt = DateTime.UtcNow,
                TblOrderItems = new List<TblOrderItem>(),
                TblOrderAddresses = new List<TblOrderAddress>()
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
            await _db.SaveChangesAsync();

            // Populate the response model
            response.OrderId = order.Id;
            response.UserId = request.UserId; // Keep UserId as a string in the response
            response.TotalAmount = order.TotalAmount;
            response.PaymentMethod = request.PaymentMethod;
            response.Status = order.Status;
            response.OrderDate = order.OrderDate;
            response.Items = order.TblOrderItems.Select(item => new OrderItemResponseModel
            {
                PerfumeId = item.PerfumeId,
                Name = item.Perfume?.Name,
                Quantity = item.Quantity,
                UnitPrice = item.UnitPrice,
                SizeMl = item.Perfume?.SizeMl,
                PictureUrl = item.Perfume?.PictureUrl
            }).ToList();
            response.Message = "Order placed successfully.";
        }
        catch (Exception ex)
        {
            // Log the exception (use ILogger for production)
            Console.Error.WriteLine($"Error placing order: {ex.Message}. StackTrace: {ex.StackTrace}");

            // Return a generic error message to the client
            response.Message = "An unexpected error occurred while placing the order.";
        }

        return response;
    }
}