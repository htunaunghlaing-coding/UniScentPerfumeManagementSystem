using System;
using System.Collections.Generic;

namespace UniScentPerfumeManagementSystem.Database.EfModels;

public partial class TblUser
{
    public int Id { get; set; }

    public string UserId { get; set; } = null!;

    public string UserName { get; set; } = null!;

    public string Email { get; set; } = null!;

    public string PhoneNo { get; set; } = null!;

    public string Password { get; set; } = null!;

    public string RoleCode { get; set; } = null!;

    public DateTime CreatedDate { get; set; }

    public DateTime? UpdatedDate { get; set; }

    public virtual ICollection<TblOrder> TblOrders { get; set; } = new List<TblOrder>();
}
