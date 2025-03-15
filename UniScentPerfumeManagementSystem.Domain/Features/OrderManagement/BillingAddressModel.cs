﻿namespace UniScentPerfumeManagementSystem.Domain.Features.OrderManagement;

public class BillingAddressModel
{
    public string Country { get; set; } = string.Empty;
    public string FullName { get; set; } = string.Empty;
    public string AddressLine1 { get; set; } = string.Empty;
    public string? AddressLine2 { get; set; }
    public string City { get; set; } = string.Empty;
    public string State { get; set; } = string.Empty;
    public string PostalCode { get; set; } = string.Empty;
    public string PhoneNo { get; set; } = string.Empty;
}
