using UniScentPerfumeManagementSystem.Database.EfModels;
using UniScentPerfumeManagementSystem.Domain.Features.OrderManagement.Enums;

namespace UniScentPerfumeManagementSystem.Domain.Features.OrderManagement.Services;

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
            var order = new TblOrder
            {
                UserId = request.UserId,
                TotalAmount = request.TotalAmount,
                PaymentMethod = request.PaymentMethod.ToString(), // Convert enum to string
                OrderDate = DateTime.UtcNow,
                Status = "Pending",
                CreatedAt = DateTime.UtcNow
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

            response.OrderId = order.Id;
            response.UserId = order.UserId;
            response.TotalAmount = order.TotalAmount;
            response.PaymentMethod = request.PaymentMethod;
            response.Status = order.Status;
            response.OrderDate = order.OrderDate;
            response.Items = order.TblOrderItems.Select(item => new OrderItemResponseModel
            {
                PerfumeId = item.PerfumeId,
                Name = item.Perfume.Name,
                Quantity = item.Quantity,
                UnitPrice = item.UnitPrice,
                SizeMl = item.Perfume.SizeMl,
                PictureUrl = item.Perfume.PictureUrl
            }).ToList();
            response.Message = "Order placed successfully.";
        }
        catch (Exception ex)
        {
            response.Message = $"Error placing order: {ex.Message}";
        }
        return response;
    }
}