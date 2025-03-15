using System;
using System.Collections.Generic;

namespace UniScentPerfumeManagementSystem.Database.EfModels;

public partial class TblPaymentDetail
{
    public int Id { get; set; }

    public int OrderId { get; set; }

    public string PaymentMethod { get; set; } = null!;

    public decimal? TipsPercentage { get; set; }

    public decimal TotalAmountWithTips { get; set; }

    public DateTime CreatedAt { get; set; }

    public DateTime? UpdatedAt { get; set; }

    public virtual TblOrder Order { get; set; } = null!;
}
