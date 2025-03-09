namespace UniScentPerfumeManagementSystem.Domain.Features.PerfumeManagement;

public class PerfumeResponseModel
{
    public int Id { get; set; }
    public string Name { get; set; }
    public string CompanyName { get; set; }
    public decimal Price { get; set; }
    public string Category { get; set; }
    public int StockQuantity { get; set; }
    public int SizeML { get; set; }
    public string PictureUrl { get; set; }
    public string Longevity { get; set; }
    public string KeyIngredients { get; set; }
    public string Notes { get; set; }
    public string Description { get; set; }
    public bool? Status { get; set; }
    public DateTime? CreatedAt { get; set; }
    public DateTime? UpdatedAt { get; set; }
    public string? Gender { get; set; }
    // For single perfume details
    public PerfumeDataModel Perfume { get; set; }
    // For a list of perfumes
    public List<PerfumeDataModel> PerfumeList { get; set; }
    public PageSettingResponseModel PageSetting { get; set; }
    public BaseSubResponseModel Response { get; set; }
}