using WebApplication4.Model;

namespace WebApplication4.Repositories
{
    public class ProductRepository : IProductRepository
    {
        public ProductsDbContext _productContext;

        public ProductRepository(ProductsDbContext productContext)
        {
            _productContext = productContext;
        }

        public List<Product> GetAllProducts()
        {
            return (_productContext.Products.ToList());
        }

        public void AddProduct(Product product)
        {
            _productContext.Products.Add(product);
            _productContext.SaveChanges();
        }

        public void UpdateProduct(Product product)
        {
            _productContext.Products.Update(product);
            _productContext.SaveChanges();
        }

        public void DeleteProduct(int id)
        {
            Product product = _productContext.Products.Find(id);
            _productContext.Products.Remove(product);
            _productContext.SaveChanges();
        }

        public Product GetProductById(int id)
        {
            return _productContext.Products.Find(id);
        }
    }
}
