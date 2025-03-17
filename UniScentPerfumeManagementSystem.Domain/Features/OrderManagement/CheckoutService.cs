using UniScentPerfumeManagementSystem.Database.EfModels;
using UniScentPerfumeManagementSystem.Shared;
using System.Threading.Tasks;

namespace UniScentPerfumeManagementSystem.Domain.Features.OrderManagement;

public class CheckoutService
{
    private readonly AppDbContext _db;

    public CheckoutService(AppDbContext db)
    {
        _db = db;
    }

    public async Task<Result<OrderResponseModel>> ProcessOrderAsync(OrderRequestModel request)
    {
        if (request.Items == null || !request.Items.Any())
        {
            return Result<OrderResponseModel>.FailureResult("Order must contain at least one item.");
        }

        if (string.IsNullOrEmpty(request.UserId))
        {
            return Result<OrderResponseModel>.FailureResult("UserId cannot be null or empty.");
        }

        try
        {
            var order = new TblOrder
            {
                UserId = request.UserId,
                TotalAmount = request.TotalAmount,
                PaymentMethod = request.PaymentMethod.ToString(),
                OrderDate = DateTime.UtcNow,
                Status = "Success",
                CreatedAt = DateTime.UtcNow,
                TblOrderItems = new List<TblOrderItem>(),
                TblOrderAddresses = new List<TblOrderAddress>()
            };

            foreach (var item in request.Items)
            {
                order.TblOrderItems.Add(new TblOrderItem
                {
                    PerfumeId = item.PerfumeId,
                    Quantity = item.Quantity,
                    UnitPrice = item.UnitPrice
                });
            }

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

            await _db.TblOrders.AddAsync(order);
            await _db.SaveChangesAsync();

            return Result<OrderResponseModel>.SuccessResult(new OrderResponseModel
            {
                OrderId = order.Id,
                UserId = order.UserId,
                TotalAmount = order.TotalAmount,
                PaymentMethod = request.PaymentMethod,
                Status = order.Status,
                Message = "Order placed successfully."
            }, "Order processed successfully.");
        }
        catch (Exception ex)
        {
            return Result<OrderResponseModel>.FailureResult($"Error placing order: {ex.Message}");
        }
    }
}