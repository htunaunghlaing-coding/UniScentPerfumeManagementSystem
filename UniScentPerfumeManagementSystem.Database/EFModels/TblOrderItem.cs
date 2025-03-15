using System;
using System.Collections.Generic;

namespace UniScentPerfumeManagementSystem.Database.EfModels;

public partial class TblOrderItem
{
    public int Id { get; set; }

    public int OrderId { get; set; }

    public int PerfumeId { get; set; }

    public int Quantity { get; set; }

    public decimal UnitPrice { get; set; }

    public DateTime? CreatedAt { get; set; }

    public virtual TblOrder Order { get; set; } = null!;

    public virtual TblPerfume Perfume { get; set; } = null!;
}
