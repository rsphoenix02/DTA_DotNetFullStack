using WebApplication4.Model;

namespace WebApplication4.Services
{
    public interface IProductService
    {
        List<Product> GetAllProducts();
        Product GetProductById(int id);
        void AddProduct(Product product);
        void UpdateProduct(Product product);
        void DeleteProduct(int id);

        List<Product> GetProductsByCategory(string category);

        List<Product> GetOutOfStock();
        List<Product> GetProductsInRange(int start, int end);
        List<String> GetCategories();
    }
}
