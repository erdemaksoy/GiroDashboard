using GiroDashboard.API.Configurations.ColumnWrite;
using GiroDashboard.API.Extensions;
using GiroDashboard.Persistence;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.HttpLogging;
using Microsoft.IdentityModel.Tokens;
using Serilog;
using Serilog.Context;
using Serilog.Core;
using Serilog.Sinks.MSSqlServer;
using Serilog.Sinks.MSSqlServer.Sinks.MSSqlServer.Options;
using System.Text;

var builder = WebApplication.CreateBuilder(args);
var issuer = builder.Configuration["JWT:Issuer"];
var audience = builder.Configuration["JWT:Audience"];
var singingKey = builder.Configuration["JWT:SigninKey"];
builder.Services.AddHttpLogging(options =>
{
    options.LoggingFields = HttpLoggingFields.All;
});

Logger log = new LoggerConfiguration()
    .WriteTo.Console()
    .WriteTo.File("logs/log.txt")
    .WriteTo.MSSqlServer(
    builder.Configuration["ConnectionStrings:SQL"],
    sinkOptions: new MSSqlServerSinkOptions
    {
        TableName = "TblMBLogs",
        AutoCreateSqlTable = false,
    })
    //  columnOptions: UsernameColumnWrite.GetColumnOptions())
    .CreateLogger();


// Add services to the container.
builder.Host.UseSerilog(log);

builder.Services.AddControllers();
builder.Services.AddPersistenceServices(); // This line is new
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();
builder.Services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme).AddJwtBearer(
    options =>
    {
        options.TokenValidationParameters = new Microsoft.IdentityModel.Tokens.TokenValidationParameters
        {
            ValidateIssuer = true,
            ValidateAudience = true,
            ValidateLifetime = true,
            ValidateIssuerSigningKey = true,
            ValidIssuer = issuer,
            ValidAudience = audience,
            IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(singingKey)),
        };
    }
    );
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddAuthorization(options =>
{
    options.AddPolicy("Yönetici", policy => policy.RequireRole("1"));
    options.AddPolicy("Depo", policy => policy.RequireRole("6"));
    options.AddPolicy("Plasiyer", policy => policy.RequireRole("7"));
    options.AddPolicy("Muhasebe", policy => policy.RequireRole("8"));
    options.AddPolicy("Süpervizör", policy => policy.RequireRole("9"));
});
builder.Services.AddCors(options =>
{
    options.AddPolicy("AllowAll",
        builder =>
        {
            builder.AllowAnyOrigin()
                   .AllowAnyMethod()
                   .AllowAnyHeader();
        });
});

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

//exception handler
app.ConfigureExceptionHandler(app.Services.GetRequiredService<ILogger<Program>>());

app.UseStaticFiles();

//Serilog
app.UseSerilogRequestLogging();
app.UseHttpLogging();

app.UseHttpsRedirection();

app.UseAuthentication();

app.UseAuthorization();
//app.Use(async (context, next) =>
//{
//    var userName = context.User.Identity.IsAuthenticated != null || true ? context.User.Identity.Name : null;
//    LogContext.PushProperty("UserName", userName);
//    await next();
//}
//);
app.UseCors("AllowAll");
app.MapControllers();

app.Run();
