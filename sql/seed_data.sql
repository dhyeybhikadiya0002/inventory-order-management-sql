-- PostgreSQL | Inventory & Order Management Database
-- Portfolio adaptation of a relational database coursework project.
-- Uses synthetic demonstration data only.

INSERT INTO Customer (Customer_Id, Customer_Name, Shipping_Address, Mailing_Address)
VALUES 
(1, 'Theresa Waters', '25351 Martin Luther King Jr Boulevard', '2919 Carlotta Flats'),
(2, 'Viola Little', '20851 Jessie Fields', '3556 Boyle Terrace'),
(3, 'Henry Schoen', '2139 Ephraim Stream', '53468 Valley Road'),
(4, 'Salvador Cronin', '868 W Jefferson Street', '911 Velda Vista'),
(5, 'Carlos Cummerata', '386 Tiara Radial', '71905 Schneider Flat'),
(6, 'Miriam Green MD', '361 Duke Street', '8639 Hahn Crossing'),
(7, 'Laurie Aufderhar II', '5877 Wilderman Underpass', '1279 McCullough Circles'),
(8, 'Mr. Nelson Weissnat', '366 Schiller Overpass', '8348 Emmanuelle Motorway'),
(9, 'Rachael Jacobi', '12172 Anderson Club', '59746 Kobe Radial'),
(10, 'Irving Kub', '28809 Percy Locks', '5119 Reichel Port'),
(11, 'Maria Raynor', '87493 Garden Close', '7208 N Poplar Street'),
(12, 'Shawn Heathcote', '675 Jabari Path', '2785 Hand Mill'),
(13, 'Shannon Zulauf V', '47129 Abdullah Street', '438 VonRueden Point'),
(14, 'Natalie Heller', '8032 Fore Street', '2947 Tower Road'),
(15, 'Lawrence Zboncak V', '282 Chapel Hill', '83667 Esta Lakes');


INSERT INTO Product (Product_Code, Description, Price)
VALUES 
(1, 'Laptop', 438.00),
(2, 'Smartphone', 879.99),
(3, 'Headphones', 955.75),
(4, 'Keyboard', 849.00),
(5, 'Mouse', 789.25),
(6, 'Monitor', 999.99),
(7, 'Smartwatch', 725.30),
(8, 'Tablet', 895.00),
(9, 'Speaker', 659.99),
(10, 'Printer', 399.95),
(11, 'Webcam', 649.50),
(12, 'External Hard Drive', 999.00),
(13, 'Charger', 554.25),
(14, 'Docking Station', 829.75),
(15, 'd8e1cc17-9ea5-478d-a4a1-6045136118a8', 745.45);

INSERT INTO Inventory (Product_Code, Quantity_On_Hand, Quantity_Backordered, Inventory_Date) VALUES
(1, 50, 10, '2025-04-01'),
(2, 100, 5, '2025-04-01'),
(3, 75, 0, '2025-04-01'),
(4, 120, 20, '2025-04-01'),
(5, 200, 50, '2025-04-01'),
(6, 30, 10, '2025-04-01'),
(7, 90, 15, '2025-04-01'),
(8, 110, 25, '2025-04-01'),
(9, 60, 5, '2025-04-01'),
(10, 140, 10, '2025-04-01'),
(11, 80, 0, '2025-04-01'),
(12, 100, 30, '2025-04-01'),
(13, 150, 10, '2025-04-01'),
(14, 200, 0, '2025-04-01'),
(15, 50, 20, '2025-04-01');

-- Insert data into Orders table
INSERT INTO Orders (Customer_Id, Order_Date) VALUES
(1, '2025-04-01'),
(2, '2025-04-01'),
(3, '2025-04-02'),
(4, '2025-04-02'),
(5, '2025-04-03'),
(6, '2025-04-03'),
(7, '2025-04-04'),
(8, '2025-04-04'),
(9, '2025-04-05'),
(10, '2025-04-05'),
(11, '2025-04-06'),
(12, '2025-04-06'),
(13, '2025-04-07'),
(14, '2025-04-07'),
(15, '2025-04-08');

-- Insert data into Order_Details table
INSERT INTO Order_Details (Order_Number, Product_Code, Quantity, Backordered, Filled, Price) VALUES
(1, 1, 2, FALSE, TRUE, 999.99),
(1, 3, 1, FALSE, TRUE, 79.99),
(2, 2, 3, FALSE, FALSE, 599.99),
(3, 5, 2, TRUE, FALSE, 29.99),
(3, 7, 1, TRUE, FALSE, 159.99),
(4, 8, 1, FALSE, TRUE, 399.99),
(5, 6, 2, TRUE, FALSE, 199.99),
(6, 4, 1, FALSE, TRUE, 49.99),
(7, 9, 2, FALSE, TRUE, 89.99),
(8, 10, 1, FALSE, FALSE, 149.99),
(9, 11, 1, TRUE, FALSE, 69.99),
(10, 12, 1, TRUE, TRUE, 89.99),
(11, 13, 1, FALSE, TRUE, 19.99),
(12, 14, 3, FALSE, TRUE, 9.99),
(13, 15, 2, TRUE, TRUE, 49.99);

-- Insert data into Explosion table
INSERT INTO Explosion (Product_Code, Part_Number, Description, Part_Description, Quantity_Required) VALUES
(1, 1, 'Laptop', 'Motherboard', 1),
(1, 2, 'Laptop', 'RAM', 2),
(2, 3, 'Smartphone', 'Display', 1),
(2, 4, 'Smartphone', 'Battery', 1),
(3, 5, 'Headphones', 'Speaker', 2),
(4, 6, 'Keyboard', 'Key Switch', 5),
(5, 7, 'Mouse', 'Sensor', 1),
(6, 8, 'Monitor', 'Display Panel', 1),
(7, 9, 'Smartwatch', 'Screen', 1),
(8, 10, 'Tablet', 'Screen', 1),
(9, 11, 'Speaker', 'Speaker Driver', 2),
(10, 12, 'Printer', 'Print Head', 1),
(11, 13, 'Webcam', 'Lens', 1),
(12, 14, 'External Hard Drive', 'Hard Drive Disk', 1),
(13, 15, 'Charger', 'Cable', 1);
