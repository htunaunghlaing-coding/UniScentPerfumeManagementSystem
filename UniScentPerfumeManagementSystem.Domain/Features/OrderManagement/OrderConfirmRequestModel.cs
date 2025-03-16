using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace UniScentPerfumeManagementSystem.Domain.Features.OrderManagement;

public class OrderConfirmRequestModel : BaseRequestModel
{
    public int OrderId { get; set; }
}
