using UniScentPerfumeManagementSystem.Database.EfModels;
using UniScentPerfumeManagementSystem.Domain.Features.OrderManagement.Enums;

namespace UniScentPerfumeManagementSystem.Domain.Features.OrderManagement.Services
{
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
                // Validate the CurrentUserId against the order
                var order = await _db.TblOrders
                    .Include(o => o.TblOrderItems)
                    .Include(o => o.TblOrderAddresses)
                    .FirstOrDefaultAsync(o => o.Id == request.OrderId && o.UserId.ToString() == request.CurrentUserId);

                if (order == null)
                {
                    throw new Exception("Order not found or unauthorized access.");
                }

                // Populate the response model
                response.PaymentMethod = Enum.Parse<PaymentMethod>(order.PaymentMethod);
                response.BillingAddress = order.TblOrderAddresses.Select(a => new BillingAddressModel
                {
                    FullName = a.FullName,
                    AddressLine1 = a.AddressLine1,
                    City = a.City,
                    State = a.State,
                    PostalCode = a.PostalCode,
                    PhoneNo = a.PhoneNo
                }).FirstOrDefault() ?? new BillingAddressModel();

                response.Subtotal = order.TotalAmount;
                response.TipsPercentage = order.TblPaymentDetails.FirstOrDefault()?.TipsPercentage ?? 0;
                response.TipsAmount = response.Subtotal * (response.TipsPercentage / 100);
                response.TotalAmount = response.Subtotal + response.TipsAmount;

                response.Items = order.TblOrderItems.Select(item => new OrderItemResponseModel
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
}