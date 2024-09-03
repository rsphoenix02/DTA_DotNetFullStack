using System;
using System.Collections.Generic;
using System.Linq;
using System.Security;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp1
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.ForegroundColor = ConsoleColor.White;
            Console.BackgroundColor = ConsoleColor.Green;

            string pname;
            int id, price, quantity;

            Console.WriteLine("Enter product ID: ");
            id = int.Parse(Console.ReadLine());

            Console.WriteLine("Enter product name: ");
            pname = Console.ReadLine();

            Console.WriteLine("Enter unit price: ");
            price = int.Parse(Console.ReadLine());

            Console.WriteLine("Enter quantity: ");
            quantity = int.Parse(Console.ReadLine());

            double totalAmount = price * quantity, discount = 0;
            double finalAmount = totalAmount;

            if(quantity > 50)
            {
                finalAmount = 0.7 * totalAmount;
                discount = 0.3 * totalAmount;
            } else if(quantity > 30)
            {
                finalAmount = 0.8 * totalAmount;
                discount = 0.2 * totalAmount;
            } else if(quantity > 10)
            {
                finalAmount = 0.9 * totalAmount;
                discount = 0.1 * totalAmount;
            }

            Console.WriteLine("~~~~~~~Final Details~~~~~~~");
            Console.WriteLine("Product ID: {0}\nProduct Name: {1}\nUnit Price: {2}\nQuantity: {3}\nTotal Amount: {4}\nDiscount Amount: {5}\nFinal Amount: {6}", id, pname, price, quantity, totalAmount, discount, finalAmount);

            Console.ReadLine();
        }
    }
}
