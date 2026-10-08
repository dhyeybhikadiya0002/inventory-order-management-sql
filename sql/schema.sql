-- PostgreSQL | Inventory & Order Management Database
-- Portfolio adaptation of a relational database coursework project.
-- Uses synthetic demonstration data only.

-- Creating table for CUSTOMER 
CREATE TABLE Customer (
    Customer_Id SERIAL PRIMARY KEY,
    Customer_Name VARCHAR(100) NOT NULL,
    Shipping_Address TEXT,
    Mailing_Address TEXT
);

-- Creating table for PRODUCT 
CREATE TABLE Product (
    Product_Code SERIAL PRIMARY KEY,
    Description TEXT NOT NULL,
    Price NUMERIC(10, 2) NOT NULL CHECK (Price >= 0)
);

-- Creating table for INVENTORY 
CREATE TABLE Inventory (
    Product_Code INT PRIMARY KEY,
    Quantity_On_Hand INT NOT NULL CHECK (Quantity_On_Hand >= 0),
    Quantity_Backordered INT DEFAULT 0 CHECK (Quantity_Backordered >= 0),
    Inventory_Date DATE,
	--Creating constraint for foreign key Product_code
    CONSTRAINT fk_inventory_product FOREIGN KEY (Product_Code)
        REFERENCES Product(Product_Code)
        ON DELETE CASCADE
);

-- Creating table for ORDERS 
CREATE TABLE Orders (
    Order_Number SERIAL PRIMARY KEY,
    Customer_Id INT NOT NULL,
    Order_Date DATE NOT NULL,
	--Creating Constraint for foreign key Customer_Id
    CONSTRAINT fk_order_customer FOREIGN KEY (Customer_Id)
        REFERENCES Customer(Customer_Id)
        ON DELETE CASCADE
);

-- Creating table for ORDER_DETAILS 
CREATE TABLE Order_Details (
    Order_Number INT,
    Product_Code INT,
    Quantity INT NOT NULL CHECK (Quantity > 0),
    Backordered BOOLEAN DEFAULT FALSE,
    Filled BOOLEAN DEFAULT FALSE,
    Price NUMERIC(10, 2) NOT NULL CHECK (Price >= 0),
  
    PRIMARY KEY (Order_Number, Product_Code),
	--Constraint for foreign key Order_Number
    CONSTRAINT fk_orderdetails_order FOREIGN KEY (Order_Number)
        REFERENCES Orders(Order_Number)
        ON DELETE CASCADE,
	--Constraint for foreign key Product_Code
    CONSTRAINT fk_orderdetails_product FOREIGN KEY (Product_Code)
        REFERENCES Product(Product_Code)
        ON DELETE CASCADE
);

-- Creating table for EXPLOSION 
CREATE TABLE Explosion (
    Product_Code INT,
    Part_Number INT,
    Description TEXT,
    Part_Description TEXT,
    Quantity_Required INT NOT NULL CHECK (Quantity_Required > 0),
    PRIMARY KEY (Product_Code, Part_Number),
	--Creating constraint for foreign key Product_Code
    CONSTRAINT fk_explosion_product FOREIGN KEY (Product_Code)
        REFERENCES Product(Product_Code)
        ON DELETE CASCADE
);
