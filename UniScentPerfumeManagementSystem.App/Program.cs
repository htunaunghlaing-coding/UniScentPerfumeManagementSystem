using UniScentPerfumeManagementSystem.Domain.Features.CartManagement;
using UniScentPerfumeManagementSystem.Services;

var builder = WebApplication.CreateBuilder(args);

// Load configuration (e.g., connection strings)
var connectionString = builder.Configuration.GetConnectionString("DbConnection");

// Add services to the container
builder.Services.AddDbContext<AppDbContext>(opt =>
    opt.UseSqlServer(connectionString),
    ServiceLifetime.Transient,
    ServiceLifetime.Transient);

builder.Services.AddSingleton<DapperService>(x => new DapperService(connectionString));

builder.Services.AddRazorComponents()
    .AddInteractiveServerComponents();

builder.Services.AddMudServices();
builder.Services.AddScoped<IInjectService, InjectService>();
builder.Services.AddScoped<AuthenticationStateProvider, CustomAuthenticationStateProvider>();
builder.Services.AddScoped<LoginService>();
builder.Services.AddScoped<RegisterService>();
builder.Services.AddScoped<PerfumeService>();
builder.Services.AddScoped<CartService>();

var app = builder.Build();

// Configure the HTTP request pipeline
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Error", createScopeForErrors: true);
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts .
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();
app.UseAntiforgery();

app.MapRazorComponents<App>()
    .AddInteractiveServerRenderMode();

app.MapGet("/", () => Results.Redirect("/login"));

app.Run();