using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp2
{
    internal class Program
    {
        class Product
        {
            public int ProductId { get; set; }
            public string Name { get; set; }
            public double UnitPrice { get; set; }
            public int Quantity { get; set; }
            public string Category { get; set; }
        }

        static void showOutput(List<Product> products)
        {
            Console.Clear();
            foreach(Product item in products)
            {
                Console.WriteLine("~~~~~~~~~~~~~~~~~~~~~~~");
                Console.WriteLine("ID: " + item.ProductId);
                Console.WriteLine("Name: " + item.Name);
                Console.WriteLine("Unit Price: " + item.UnitPrice);
                Console.WriteLine("Quantity: " + item.Quantity);
                Console.WriteLine("Category: " + item.Category);
            }

        }
        static void Main(string[] args)
        {
            List<Product> products = new List<Product>();
            takeInput(products);

            showOutput(products);
            Console.ReadLine();
        }

        static void takeInput(List<Product> products)
        {
            //List<Product> products = new List<Product>();

            for (int i = 0; i < 2; i++)
            {
                Product product = new Product();
                Console.WriteLine("Enter Product " + (i + 1) + " ID: ");
                product.ProductId = int.Parse(Console.ReadLine());
                Console.WriteLine("Enter Product " + (i + 1) + " Name: ");
                product.Name = Console.ReadLine();
                Console.WriteLine("Enter Product " + (i + 1) + " Unit Price: ");
                product.UnitPrice = double.Parse(Console.ReadLine());
                Console.WriteLine("Enter Product " + (i + 1) + " Quantity: ");
                product.Quantity = int.Parse(Console.ReadLine());
                Console.WriteLine("Enter Product " + (i + 1) + " Category: ");
                product.Category = Console.ReadLine();

                products.Add(product);
            }

            //return products;
        } 
        }
    
}
