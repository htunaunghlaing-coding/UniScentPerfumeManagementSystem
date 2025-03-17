using UniScentPerfumeManagementSystem.Domain.Features.OrderManagement.Enums;
using UniScentPerfumeManagementSystem.Domain.Features.OrderManagement;

public class OrderConfirmService
{
    private readonly AppDbContext _db;

    public OrderConfirmService(AppDbContext db)
    {
        _db = db;
    }

    public async Task<OrderDetailsModel> GetOrderDetailsAsync(OrderConfirmRequestModel request)
    {
        var response = new OrderDetailsModel();
        try
        {
            // Step 1: Retrieve the TblOrders record
            var order = await _db.TblOrders
                .FirstOrDefaultAsync(o => o.Id == request.OrderId && o.UserId == request.CurrentUserId);

            if (order == null)
            {
                throw new Exception("Order not found or unauthorized access.");
            }

            // Step 2: Retrieve the TblOrderAddresses record
            var orderAddress = await _db.TblOrderAddresses
                .FirstOrDefaultAsync(a => a.OrderId == order.Id);

            if (orderAddress == null)
            {
                throw new Exception("No matching address found for the given OrderId.");
            }

            // Step 3: Retrieve the TblOrderItems records
            var orderItems = await _db.TblOrderItems
                .Where(i => i.OrderId == order.Id)
                .ToListAsync();

            if (!orderItems.Any())
            {
                throw new Exception("No matching items found for the given OrderId.");
            }

            // Populate the response model
            response.PaymentMethod = Enum.Parse<PaymentMethod>(order.PaymentMethod);
            response.BillingAddress = new BillingAddressModel
            {
                FullName = orderAddress.FullName,
                AddressLine1 = orderAddress.AddressLine1,
                City = orderAddress.City,
                State = orderAddress.State,
                PostalCode = orderAddress.PostalCode,
                PhoneNo = orderAddress.PhoneNo
            };

            response.Subtotal = order.TotalAmount;
            response.TipsPercentage = order.TblPaymentDetails.FirstOrDefault()?.TipsPercentage ?? 0;
            response.TipsAmount = response.Subtotal * (response.TipsPercentage / 100);
            response.TotalAmount = response.Subtotal + response.TipsAmount;

            response.Items = orderItems.Select(item => new OrderItemResponseModel
            {
                PerfumeId = item.PerfumeId,
                Name = item.Perfume.Name,
                SizeMl = item.Perfume.SizeMl,
                Quantity = item.Quantity,
                UnitPrice = item.UnitPrice,
                PictureUrl = item.Perfume.PictureUrl
            }).ToList();
        }
        catch (Exception ex)
        {
            throw new Exception($"Error retrieving order details: {ex.Message}");
        }
        return response;
    }
}