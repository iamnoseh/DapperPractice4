
CREATE TABLE Users (
                       Id SERIAL PRIMARY KEY,
                       Username VARCHAR(100) NOT NULL,
                       FirstName VARCHAR(100),
                       LastName VARCHAR(100),
                       Phone VARCHAR(15) NOT NULL,
                       Address VARCHAR(255),
                       Email VARCHAR(100) NOT NULL,
                       BirthDate TIMESTAMP
);



CREATE TABLE Markets (
                         Id SERIAL PRIMARY KEY,
                         MarketName VARCHAR(100) NOT NULL,
                         Address VARCHAR(255) NOT NULL,
                         Description VARCHAR(255),
                         StartDate TIMESTAMP,
                         UserId INT NOT NULL,
                         CONSTRAINT fk_user FOREIGN KEY (UserId) REFERENCES Users(Id)
);


CREATE TABLE Categories (
                            Id SERIAL PRIMARY KEY,
                            Name VARCHAR(100) NOT NULL
);


CREATE TABLE Products (
                          Id SERIAL PRIMARY KEY,
                          Name VARCHAR(100) NOT NULL,
                          Price DECIMAL(10, 2),
                          MarketId INT NOT NULL,
                          CategoryId INT NOT NULL,
                          CONSTRAINT fk_market FOREIGN KEY (MarketId) REFERENCES Markets(Id),
                          CONSTRAINT fk_category FOREIGN KEY (CategoryId) REFERENCES Categories(Id)
);



INSERT INTO Users (Username, FirstName, LastName, Phone, Address, Email, BirthDate) VALUES
                                                                                        ('user1', 'John', 'Doe', '1234567890', '123 Main St', 'john@example.com', '1985-01-01'),
                                                                                        ('user2', 'Jane', 'Smith', '0987654321', '456 Elm St', 'jane@example.com', '1990-05-15'),
                                                                                        ('user3', 'Alex', 'Johnson', '5551234567', '789 Oak St', 'alex@example.com', '1982-03-22'),
                                                                                        ('user4', 'Emily', 'Davis', '6667891234', '321 Pine St', 'emily@example.com', '1995-07-30'),
                                                                                        ('user5', 'Chris', 'Brown', '7774567890', '654 Maple St', 'chris@example.com', '1988-10-10'),
                                                                                        ('user6', 'Anna', 'Taylor', '8881239876', '987 Birch St', 'anna@example.com', '1992-12-25'),
                                                                                        ('user7', 'Michael', 'Wilson', '9994563210', '159 Cedar St', 'michael@example.com', '1983-08-08'),
                                                                                        ('user8', 'Sarah', 'Moore', '1112223334', '753 Walnut St', 'sarah@example.com', '1991-02-14'),
                                                                                        ('user9', 'David', 'White', '2223334445', '852 Poplar St', 'david@example.com', '1986-11-11'),
                                                                                        ('user10', 'Laura', 'Martin', '3334445556', '951 Spruce St', 'laura@example.com', '1993-06-06');



INSERT INTO Markets (MarketName, Address, Description, StartDate, UserId) VALUES
                                                                              ('Market 1', '123 Market St', 'Fresh products', '2020-01-01', 1),
                                                                              ('Market 2', '456 Market Ave', 'Organic goods', '2021-03-15', 2),
                                                                              ('Market 3', '789 Market Blvd', 'Local crafts', '2022-05-10', 3),
                                                                              ('Market 4', '321 Market Rd', 'Electronics', '2023-02-20', 4),
                                                                              ('Market 5', '654 Market Ln', 'Fashion and clothes', '2019-11-30', 5),
                                                                              ('Market 6', '987 Market Dr', 'Furniture', '2021-08-25', 6),
                                                                              ('Market 7', '159 Market Ct', 'Books and stationery', '2020-06-15', 7),
                                                                              ('Market 8', '753 Market Sq', 'Jewelry and accessories', '2018-09-10', 8),
                                                                              ('Market 9', '852 Market Pl', 'Automotive parts', '2023-01-05', 9),
                                                                              ('Market 10', '951 Market Wy', 'Toys and games', '2022-12-01', 10);



INSERT INTO Categories (Name) VALUES
                                  ('Electronics'),
                                  ('Clothing'),
                                  ('Furniture'),
                                  ('Books'),
                                  ('Toys'),
                                  ('Groceries'),
                                  ('Jewelry'),
                                  ('Automotive'),
                                  ('Crafts'),
                                  ('Sports');



INSERT INTO Products (Name, Price, MarketId, CategoryId) VALUES
                                                             ('Laptop', 1000.00, 1, 1),
                                                             ('T-shirt', 20.00, 2, 2),
                                                             ('Sofa', 500.00, 3, 3),
                                                             ('Novel', 15.00, 4, 4),
                                                             ('Board Game', 30.00, 5, 5),
                                                             ('Apples', 2.50, 6, 6),
                                                             ('Necklace', 150.00, 7, 7),
                                                             ('Car Tire', 100.00, 8, 8),
                                                             ('Handmade Vase', 45.00, 9, 9),
                                                             ('Football', 25.00, 10, 10);



