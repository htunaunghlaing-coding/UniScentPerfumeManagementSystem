using Serilog;
using UniScentPerfumeManagementSystem.Domain.Features.CartManagement;
using UniScentPerfumeManagementSystem.Domain.Features.OrderManagement;

Log.Logger = new LoggerConfiguration()
            .MinimumLevel.Debug()
            .WriteTo.Console()
            .WriteTo.File(
                path: @"D:\SelfStudyProject\UniScentPerfumeManagementSystem\Logs\PerfumeShopManagementSystem.txt",
                rollingInterval: RollingInterval.Hour,
                fileSizeLimitBytes: 10_000_000, 
                outputTemplate: "{Timestamp:yyyy-MM-dd HH:mm:ss} [{Level}] {Message}{NewLine}{Exception}")
            .CreateLogger();

try
{
    var builder = WebApplication.CreateBuilder(args);

    var connectionString = builder.Configuration.GetConnectionString("DbConnection");

    builder.Services.AddDbContext<AppDbContext>(opt =>
        opt.UseSqlServer(connectionString),
        ServiceLifetime.Transient,
        ServiceLifetime.Transient);

    builder.Services.AddServerSideBlazor(options =>
    {
        options.DetailedErrors = true;
    });

    builder.Services.AddSingleton<DapperService>(x => new DapperService(connectionString));

    builder.Services.AddRazorComponents()
        .AddInteractiveServerComponents();

    builder.Services.AddSerilog();
    builder.Services.AddMudServices();
    builder.Services.AddScoped<IInjectService, InjectService>();
    builder.Services.AddScoped<AuthenticationStateProvider, CustomAuthenticationStateProvider>();
    builder.Services.AddScoped<LoginService>();
    builder.Services.AddScoped<RegisterService>();
    builder.Services.AddScoped<PerfumeService>();
    builder.Services.AddScoped<CartService>();
    builder.Services.AddScoped<CheckoutService>();
    builder.Services.AddScoped<OrderConfirmService>();

    var app = builder.Build();

    app.UseHttpsRedirection();
    app.UseStaticFiles();
    app.UseAntiforgery();

    app.MapRazorComponents<App>()
        .AddInteractiveServerRenderMode();

    app.MapGet("/", () => Results.Redirect("/login"));

    app.Run();
}
catch (Exception ex)
{
    Log.Error(ex, "Something went wrong");
}
finally
{
    await Log.CloseAndFlushAsync();
}

