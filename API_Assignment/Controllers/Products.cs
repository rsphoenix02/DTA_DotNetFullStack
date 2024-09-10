using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using WebApplication4.Model;

namespace WebApplication4.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class Products : ControllerBase
    {
        ProductsDbContext _context;

        public Products(ProductsDbContext context)
        {
            _context = context;
        }

        [HttpGet]
        public IActionResult GetAllProducts()
        {
            return Ok(_context.Products.ToList());
        }

        [HttpGet("{id}")]
        public IActionResult GetProduct(int id)
        {
            Product obj = _context.Products.Find(id);

            if (obj == null)
            {
                return BadRequest("Product with ID: " + id + " does not exist.");
            }
            else return Ok(obj);
        }

        [HttpPost]
        public IActionResult AddProduct(Product obj)
        {
            _context.Products.Add(obj);
            _context.SaveChanges();
            return Ok("New product added successfully!");
        }

        [HttpPut]
        public IActionResult EditProduct(Product obj)
        {
            _context.Products.Update(obj);
            _context.SaveChanges();
            return Ok("Product details updated successfully!");
        }

        [HttpDelete]
        public IActionResult DeleteProduct(int id)
        {
               Product obj = _context.Products.Find(id);

            if (obj == null) return BadRequest("Product with ID: " + id + "not found.");

            _context.Products.Remove(obj);
            _context.SaveChanges();
            return Ok("Product deleted successfully.");
        }

    }   
}
