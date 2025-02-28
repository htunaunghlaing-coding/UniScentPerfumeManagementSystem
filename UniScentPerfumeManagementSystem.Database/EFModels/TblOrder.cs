using System;
using System.Collections.Generic;

namespace UniScentPerfumeManagementSystem.Database.EFModels;

public partial class TblOrder
{
    public int Id { get; set; }

    public int UserId { get; set; }

    public DateTime OrderDate { get; set; }

    public decimal TotalAmount { get; set; }

    public string PaymentMethod { get; set; } = null!;

    public string Status { get; set; } = null!;

    public DateTime CreatedAt { get; set; }

    public DateTime? UpdatedAt { get; set; }

    public virtual ICollection<TblOrderItem> TblOrderItems { get; set; } = new List<TblOrderItem>();

    public virtual TblUser User { get; set; } = null!;
}
