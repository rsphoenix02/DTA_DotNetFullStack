/*
2.  Create typescript program to process customer details using object oriented programming.
        •	Class Name :	Customer
        •	Class should allow the following parameters in constructor
        let c1:Customer = new Customer();
        let c2:Customer = new Customer(10256);
        let c3:Customer = new Customer(10256, “Scott”);
        let c4:Customer = new Customer(10256, “Scott”, “Hyd”);

        •	Declare required number of variables in the class. 
        •	Method :  ShowDetails() to display all the values in single Line.
                        Eg:	Customer Details  ::   Id : 10256, Name : Scott, City : Hyd
*/

class Customer {
    public Id: number;
    public Name: string;
    public City: string;

    constructor(Id:number = 0, Name:string = "", City:string = ""){
        this.Id = Id;
        this.Name = Name;
        this.City = City;
    }

    ShowDetails(){
        console.log(`Customer Details :: Id : ${this.Id}, Name : ${this.Name}, City : ${this.City}`);
    }
}

let customer1 = new Customer(1024, "John", "Dallas");
let customer2 = new Customer(2341, "Stacey", "Philadelphia");
let customer3 = new Customer(4572, "Stewart", "New York");

customer1.ShowDetails();
customer2.ShowDetails();
customer3.ShowDetails();

