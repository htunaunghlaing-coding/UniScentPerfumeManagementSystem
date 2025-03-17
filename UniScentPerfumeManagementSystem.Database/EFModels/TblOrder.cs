using System;
using System.Collections.Generic;

namespace UniScentPerfumeManagementSystem.Database.EfModels;

public partial class TblOrder
{
    public int Id { get; set; }

    public DateTime OrderDate { get; set; }

    public decimal TotalAmount { get; set; }

    public string PaymentMethod { get; set; } = null!;

    public string Status { get; set; } = null!;

    public DateTime CreatedAt { get; set; }

    public DateTime? UpdatedAt { get; set; }

    public string? UserId { get; set; }

    public virtual ICollection<TblOrderAddress> TblOrderAddresses { get; set; } = new List<TblOrderAddress>();

    public virtual ICollection<TblOrderItem> TblOrderItems { get; set; } = new List<TblOrderItem>();

    public virtual ICollection<TblPaymentDetail> TblPaymentDetails { get; set; } = new List<TblPaymentDetail>();

    public virtual TblUser? User { get; set; }
}
