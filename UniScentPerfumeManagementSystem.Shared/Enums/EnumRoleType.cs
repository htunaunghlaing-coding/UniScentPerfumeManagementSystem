using System.ComponentModel;

namespace UniScentPerfumeManagementSystem.Shared.Enums;

public enum EnumRoleType
{
    Default,
    [Description("C001")] Customer,
    [Description("A001")] Admin,
}
