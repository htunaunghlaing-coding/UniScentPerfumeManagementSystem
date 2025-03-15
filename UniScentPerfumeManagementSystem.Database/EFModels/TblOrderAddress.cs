using System;
using System.Collections.Generic;

namespace UniScentPerfumeManagementSystem.Database.EfModels;

public partial class TblOrderAddress
{
    public int Id { get; set; }

    public int OrderId { get; set; }

    public string Country { get; set; } = null!;

    public string FullName { get; set; } = null!;

    public string AddressLine1 { get; set; } = null!;

    public string? AddressLine2 { get; set; }

    public string City { get; set; } = null!;

    public string State { get; set; } = null!;

    public string PostalCode { get; set; } = null!;

    public string PhoneNo { get; set; } = null!;

    public DateTime CreatedAt { get; set; }

    public DateTime? UpdatedAt { get; set; }

    public virtual TblOrder Order { get; set; } = null!;
}
