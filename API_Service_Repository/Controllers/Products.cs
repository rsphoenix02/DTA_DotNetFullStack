using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using WebApplication4.Model;
using WebApplication4.Services;

namespace WebApplication4.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class Products : ControllerBase
    {
        IProductService _context;

        public Products(IProductService context)
        {
            _context = context;
        }

        [HttpGet]
        public IActionResult GetAllProducts()
        {
            return Ok(_context.GetAllProducts());
        }

        [HttpGet("{id}")]
        public IActionResult GetProduct(int id)
        {
            return Ok(_context.GetProductById(id));
        }

        [HttpPost]
        public IActionResult AddProduct(Product obj)
        {
            try
            {
                _context.AddProduct(obj);
                return StatusCode(StatusCodes.Status201Created, "Product added successfully!");
            }
            catch (ArgumentNullException ex)
            {
                return BadRequest(ex.Message);
            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, ex.Message);
            }
        }

        [HttpPut]
        public IActionResult EditProduct(Product obj)
        {
            try
            {
                _context.UpdateProduct(obj);
                return StatusCode(StatusCodes.Status200OK, "Product updated successfully!");
            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, ex.Message);
            }
        }

        [HttpDelete]
        public IActionResult DeleteProduct(int id)
        {
            try
            {
                _context.DeleteProduct(id);
                return StatusCode(StatusCodes.Status200OK, "Product deleted successfully");
            }
            catch (ArgumentNullException ex)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, ex.Message);
            }
        }
    }   
}
