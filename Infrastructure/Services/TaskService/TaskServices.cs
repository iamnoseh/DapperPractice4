using Dapper;
using Domain.TaskModels;
using Infrastructure.DataContext;
using Npgsql;

namespace Infrastructure.Services.TaskService;

public class TaskServices
{
    readonly DapperContext _context;

    public TaskServices()
    {
        _context = new DapperContext();
    }
    
    //Metod baroi nishon dodani UserID,UserName,Firstname,Lastname,Marketname
    public void GetUsersWithMarkets()
    {
        try
        {
            string cmd = $@"
        SELECT u.Id AS UserId, u.Username, u.FirstName, u.LastName, m.MarketName
        FROM Users u
        LEFT JOIN Markets m ON u.Id = m.UserId;";
            List<UserWithMarket> getUsersWithMarkets = new List<UserWithMarket>();
            getUsersWithMarkets = _context.Connection().Query<UserWithMarket>(cmd).ToList();
            foreach (var g in getUsersWithMarkets)
            {
                Console.WriteLine($"UserID: {g.UserId} Username: {g.Username} || Firstname: {g.FirstName} || Lastname: {g.LastName} MarketName: {g.MarketName}");   
            }
        }
        catch (NpgsqlException e)
        {
            Console.WriteLine(e);
            throw;
        }
    }

//Metod baroi nishon dodani Product va kategoriyaash
    public void GetProductsWithCategories()
    {
        try
        {
            string cmd = @"
        SELECT p.Id AS ProductId, p.Name AS ProductName, p.Price, c.Name AS CategoryName
        FROM Products p
        JOIN Categories c ON p.CategoryId = c.Id;";
            List<ProductWithCategories> productsWithCategories = new List<ProductWithCategories>();
            productsWithCategories = _context.Connection().Query<ProductWithCategories>(cmd).ToList();
            foreach (var p in productsWithCategories)
            {
                Console.WriteLine($"ProductID: {p.ProductId} || Productname: {p.ProductName}  || CategoryName: {p.CategoryName} || Price: {p.Price}");
            }

        }
        catch (NpgsqlException e)
        {
            Console.WriteLine(e);
            throw;
        }
    }
    
    
    
    //metod baroi hisobi mablagi sarfkardai har yak user
    public void GetTotalSpentByUsers()
    {
        try
        {
            string cmd = @"
        SELECT u.Id AS UserId, u.Username, SUM(p.Price) AS TotalSpent
        FROM Users u
        JOIN Markets m ON u.Id = m.UserId
        JOIN Products p ON m.Id = p.MarketId
        GROUP BY u.Id, u.Username;";
            List<SpandByUser> spandByUsers = new List<SpandByUser>();
            spandByUsers = _context.Connection().Query<SpandByUser>(cmd).ToList();
            foreach (var s in spandByUsers)
            {
                Console.WriteLine($"UserId: {s.UserId} || UserName: {s.UserName} || Spand: {s.Spand}");
            }
        }
        catch (NpgsqlException e)
        {
            Console.WriteLine(e);
            throw;
        }
    }
    
}