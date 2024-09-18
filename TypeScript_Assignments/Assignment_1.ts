/*
1.   Create typescript program to process product details using object oriented programming.
	•	Class should contains public  variables:  ProductId, ProductName, UnitPrice, Qty.
	•	Constructor should allow productId as parameter
	•	Methods:
			a.  getTotal()
			b.  showDetails()
*/

class Product {
    public ProductId: number;
    public ProductName: string;
    public UnitPrice: number;
    public Qty: number;

    constructor(ProductId: number){
        this.ProductId = ProductId;
    }

    getTotal(){
        console.log("Total price: " + this.UnitPrice*this.Qty);
    }

    showDetails(){
        console.log(`~~~~~~~~~~~~Fetching details for ${this.ProductId}~~~~~~~~~~~~`);
        console.log(`Product ID: ${this.ProductId}`);
        console.log(`Product Name: ${this.ProductName}`);
        console.log(`Unit Price: ${this.UnitPrice}`);
        console.log(`Quantity: ${this.Qty}`);
    }
}

let product1 = new Product(1001);
product1.ProductName = "Angular";
product1.UnitPrice = 1080;
product1.Qty = 5;

product1.showDetails();
product1.getTotal();