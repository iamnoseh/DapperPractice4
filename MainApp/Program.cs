using Infrastructure.Services.TaskService;


TaskServices taskServices = new TaskServices();
taskServices.GetProductsWithCategories();
Console.WriteLine("_______________________________________");
taskServices.GetUsersWithMarkets();
Console.WriteLine("_______________________________________");
taskServices.GetProductsWithCategories();

