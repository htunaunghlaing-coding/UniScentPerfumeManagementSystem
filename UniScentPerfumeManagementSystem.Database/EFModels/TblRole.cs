using System;
using System.Collections.Generic;

namespace UniScentPerfumeManagementSystem.Database.EFModels;

public partial class TblRole
{
    public int RoleId { get; set; }

    public string RoleCode { get; set; } = null!;

    public string RoleName { get; set; } = null!;

    public virtual ICollection<TblUser> TblUsers { get; set; } = new List<TblUser>();
}
