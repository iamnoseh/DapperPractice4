namespace Domain.TaskModels;

public class ProductWithCategories
{
    public int ProductId { get; set; }
    public string? ProductName { get; set; }
    public decimal Price { get; set; }
    public string? CategoryName { get; set; }
}