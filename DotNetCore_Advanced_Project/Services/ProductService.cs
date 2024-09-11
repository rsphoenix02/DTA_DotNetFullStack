using WebApplication4.Repositories;
using WebApplication4.Model;

namespace WebApplication4.Services
{
    public class ProductService : IProductService
    {
        public IProductRepository _repository;

        public ProductService(IProductRepository repository)
        {
            _repository = repository;
        }

        public List<Product> GetAllProducts()
        {
            return _repository.GetAllProducts();
        }

        public Product GetProductById(int id)
        {
            return _repository.GetProductById(id);
        }

        public void AddProduct(Product product)
        {
            if (product == null)
            {
                throw new ArgumentNullException(nameof(product), "Product cannot be null");
            }
            _repository.AddProduct(product);
        }

        public void UpdateProduct(Product product)
        {
            _repository.UpdateProduct(product);
        }

        public void DeleteProduct(int id)
        {
            _repository.DeleteProduct(id);
        }

        public List<Product> GetProductsByCategory(string category)
        {
            return _repository.GetAllProducts().Where(x => x.Category == category).ToList();
        }

        public List<Product> GetOutOfStock()
        {
            return _repository.GetAllProducts().Where(x => x.Quantity == 0).ToList();
        }

        public List<Product> GetProductsInRange(int start, int end)
        {
            return _repository.GetAllProducts().Where(x => x.UnitPrice >= start && x.UnitPrice <= end).ToList();
        }

        public List<String> GetCategories()
        {
            return _repository.GetAllProducts().Select(x => x.Category).Distinct().ToList();
        }
    }
}
