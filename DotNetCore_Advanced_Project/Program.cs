using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using System.Text;
using WebApplication4.Model;
using WebApplication4.Repositories;
using WebApplication4.Services;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();



// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

builder.Services.AddDbContext<ProductsDbContext>(options => options.UseSqlServer(builder.Configuration.GetConnectionString("ProductsDbContext")));

builder.Services.AddTransient<IProductRepository, ProductRepository>();
builder.Services.AddTransient<IProductService, ProductService>();

builder.Services.AddAuthentication(options =>

{

    options.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;

    options.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;

    options.DefaultScheme = JwtBearerDefaults.AuthenticationScheme;

}).AddJwtBearer(options =>

{

    options.SaveToken = true;

    options.RequireHttpsMetadata = false;

    options.TokenValidationParameters = new TokenValidationParameters()

    {

        ValidateIssuer = true,

        ValidateAudience = true,

        ValidAudience = "myUsers",

        ValidIssuer = "mySystem",

        IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes("this is jwt token required secret key used to generate jwt token required for authentiation"))

    };

});


var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
