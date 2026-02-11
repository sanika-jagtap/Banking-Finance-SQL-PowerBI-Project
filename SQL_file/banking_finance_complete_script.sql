-- ========================================
-- BANKING & FINANCE PROJECT SQL SCRIPT
-- Author: Sanika Jagtap
-- ========================================

-- 1. CREATE DATABASE

CREATE DATABASE Project1;
USE Project1;

-- ========================================
-- 2. CREATE TABLES
-- ========================================

CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(50),
    gender VARCHAR(10),
    city VARCHAR(30),
    date_of_birth DATE,
    join_date DATE
);
CREATE TABLE Branches (
    branch_id INT AUTO_INCREMENT PRIMARY KEY,
    branch_name VARCHAR(50),
    city VARCHAR(30)
);
CREATE TABLE Accounts (
    account_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    branch_id INT,
    account_type VARCHAR(20),
    balance DECIMAL(12,2),
    open_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (branch_id) REFERENCES Branches(branch_id)
);
CREATE TABLE Transactions (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    account_id INT,
    transaction_date DATE,
    transaction_type VARCHAR(10),
    amount DECIMAL(10,2),
    FOREIGN KEY (account_id) REFERENCES Accounts(account_id)
);
CREATE TABLE Loans (
    loan_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    loan_type VARCHAR(30),
    loan_amount DECIMAL(12,2),
    interest_rate DECIMAL(4,2),
    loan_status VARCHAR(20),
    start_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- ========================================
-- 3. INSERT DATA
-- ========================================

INSERT INTO Branches (branch_name, city) VALUES
('Mumbai Main','Mumbai'),('Andheri East','Mumbai'),('Borivali West','Mumbai'),
('Pune Central','Pune'),('Hinjewadi','Pune'),('Kothrud','Pune'),
('Delhi North','Delhi'),('Delhi South','Delhi'),('Dwarka','Delhi'),
('Bangalore MG Road','Bangalore'),('Whitefield','Bangalore'),
('Electronic City','Bangalore'),
('Chennai Central','Chennai'),('Anna Nagar','Chennai'),
('Tambaram','Chennai'),
('Hyderabad Main','Hyderabad'),('Gachibowli','Hyderabad'),
('Madhapur','Hyderabad'),
('Kolkata North','Kolkata'),('Salt Lake','Kolkata'),
('Howrah','Kolkata'),
('Ahmedabad Central','Ahmedabad'),('Navrangpura','Ahmedabad'),
('Maninagar','Ahmedabad'),
('Jaipur Main','Jaipur'),('Malviya Nagar','Jaipur'),
('Udaipur Road','Jaipur'),
('Indore Central','Indore'),('Vijay Nagar','Indore'),
('Palasia','Indore'),
('Nagpur Main','Nagpur'),('Civil Lines','Nagpur'),
('Wardha Road','Nagpur'),
('Surat Central','Surat'),('Adajan','Surat');

INSERT INTO Customers (customer_name, gender, city, date_of_birth, join_date) VALUES
('Amit Sharma','Male','Mumbai','1990-05-12','2021-01-15'),
('Neha Verma','Female','Pune','1995-08-22','2022-06-10'),
('Rahul Singh','Male','Delhi','1988-11-03','2020-09-25'),
('Priya Mehta','Female','Mumbai','1992-02-18','2023-03-12'),
('Rohan Patil','Male','Pune','1991-07-14','2021-05-20'),
('Sneha Kulkarni','Female','Pune','1996-01-30','2022-11-05'),
('Vikas Gupta','Male','Delhi','1985-03-10','2019-08-12'),
('Anjali Kapoor','Female','Delhi','1994-09-08','2023-01-22'),
('Suresh Reddy','Male','Hyderabad','1987-12-19','2020-04-17'),
('Kiran Rao','Female','Hyderabad','1993-06-25','2022-02-14'),
('Manoj Iyer','Male','Chennai','1989-10-05','2021-07-11'),
('Divya Nair','Female','Chennai','1995-04-16','2023-05-18'),
('Arjun Das','Male','Kolkata','1986-01-09','2019-11-29'),
('Pooja Sen','Female','Kolkata','1992-08-21','2021-12-10'),
('Rakesh Jain','Male','Ahmedabad','1984-06-30','2018-09-15'),
('Nidhi Shah','Female','Ahmedabad','1996-03-04','2022-10-02'),
('Aakash Verma','Male','Jaipur','1991-02-14','2021-08-07'),
('Meena Joshi','Female','Jaipur','1994-11-11','2023-04-01'),
('Sunil Malhotra','Male','Indore','1987-05-18','2020-01-20'),
('Kavita Malviya','Female','Indore','1995-09-09','2022-07-27'),
('Rohit Kulkarni','Male','Nagpur','1990-12-01','2021-06-30'),
('Shweta Deshpande','Female','Nagpur','1993-03-15','2023-02-18'),
('Vijay Patel','Male','Surat','1988-10-20','2020-10-10'),
('Nisha Patel','Female','Surat','1996-01-17','2022-09-09'),
('Deepak Mishra','Male','Delhi','1985-04-07','2019-03-22'),
('Ritu Arora','Female','Delhi','1992-07-26','2021-12-30'),
('Harish Kumar','Male','Bangalore','1989-06-06','2020-08-18'),
('Sonal Jain','Female','Bangalore','1995-05-25','2023-06-02'),
('Ankit Bansal','Male','Bangalore','1991-11-12','2022-01-14'),
('Pallavi Desai','Female','Mumbai','1994-02-05','2023-07-19'),
('Nitin Chawla','Male','Mumbai','1986-09-29','2019-12-01'),
('Reema Saxena','Female','Pune','1993-08-08','2022-04-11'),
('Kunal Shah','Male','Ahmedabad','1988-03-23','2020-06-06'),
('Bhavana Rao','Female','Hyderabad','1996-12-12','2023-05-09'),
('Sanjay Kulkarni','Male','Pune','1985-01-19','2019-02-25');

INSERT INTO Accounts (customer_id, branch_id, account_type, balance, open_date) VALUES
(1,1,'Savings',250000,'2021-01-15'),
(2,4,'Savings',120000,'2022-06-10'),
(3,7,'Current',500000,'2020-09-25'),
(4,1,'Savings',90000,'2023-03-12'),
(5,4,'Savings',180000,'2021-05-20'),
(6,5,'Savings',95000,'2022-11-05'),
(7,8,'Current',650000,'2019-08-12'),
(8,9,'Savings',110000,'2023-01-22'),
(9,16,'Savings',210000,'2020-04-17'),
(10,17,'Savings',130000,'2022-02-14'),
(11,13,'Current',420000,'2021-07-11'),
(12,14,'Savings',85000,'2023-05-18'),
(13,19,'Savings',300000,'2019-11-29'),
(14,20,'Savings',175000,'2021-12-10'),
(15,22,'Current',700000,'2018-09-15'),
(16,23,'Savings',145000,'2022-10-02'),
(17,25,'Savings',98000,'2021-08-07'),
(18,26,'Savings',76000,'2023-04-01'),
(19,28,'Current',520000,'2020-01-20'),
(20,29,'Savings',125000,'2022-07-27'),
(21,31,'Savings',160000,'2021-06-30'),
(22,32,'Savings',92000,'2023-02-18'),
(23,34,'Current',480000,'2020-10-10'),
(24,35,'Savings',115000,'2022-09-09'),
(25,7,'Savings',340000,'2019-03-22'),
(26,8,'Savings',99000,'2021-12-30'),
(27,10,'Current',610000,'2020-08-18'),
(28,11,'Savings',87000,'2023-06-02'),
(29,12,'Savings',132000,'2022-01-14'),
(30,2,'Savings',205000,'2023-07-19'),
(31,3,'Current',550000,'2019-12-01'),
(32,6,'Savings',140000,'2022-04-11'),
(33,24,'Savings',165000,'2020-06-06'),
(34,18,'Savings',98000,'2023-05-09'),
(35,4,'Current',600000,'2019-02-25');

INSERT INTO Transactions (account_id, transaction_date, transaction_type, amount) VALUES
(1,'2024-01-10','Credit',50000),
(1,'2024-01-15','Debit',20000),
(2,'2024-02-05','Debit',10000),
(3,'2024-02-20','Credit',150000),
(4,'2024-03-01','Debit',5000),
(5,'2024-01-12','Credit',30000),
(6,'2024-02-18','Debit',8000),
(7,'2024-01-22','Credit',120000),
(8,'2024-03-05','Debit',15000),
(9,'2024-01-30','Credit',40000),
(10,'2024-02-14','Debit',12000),
(11,'2024-01-08','Credit',90000),
(12,'2024-03-18','Debit',7000),
(13,'2024-02-25','Credit',60000),
(14,'2024-01-11','Debit',10000),
(15,'2024-01-20','Credit',200000),
(16,'2024-03-02','Debit',9000),
(17,'2024-02-07','Credit',15000),
(18,'2024-03-12','Debit',6000),
(19,'2024-01-28','Credit',110000),
(20,'2024-02-15','Debit',13000),
(21,'2024-01-17','Credit',22000),
(22,'2024-03-21','Debit',5000),
(23,'2024-02-02','Credit',100000),
(24,'2024-01-25','Debit',12000),
(25,'2024-03-10','Credit',70000),
(26,'2024-02-09','Debit',8000),
(27,'2024-01-19','Credit',95000),
(28,'2024-03-05','Debit',6000),
(29,'2024-02-11','Credit',18000),
(30,'2024-01-29','Debit',9000),
(31,'2024-02-22','Credit',125000),
(32,'2024-03-15','Debit',7000),
(33,'2024-01-14','Credit',45000),
(34,'2024-02-27','Debit',6000),
(35,'2024-03-20','Credit',130000);

INSERT INTO Loans (customer_id, loan_type, loan_amount, interest_rate, loan_status, start_date) VALUES
(1,'Home Loan',3000000,8.5,'Active','2022-01-01'),
(2,'Education Loan',600000,7.2,'Active','2021-07-15'),
(3,'Car Loan',800000,9.2,'Closed','2021-06-15'),
(4,'Personal Loan',300000,11.5,'Active','2023-04-01'),
(5,'Home Loan',2500000,8.7,'Active','2020-03-10'),
(6,'Education Loan',500000,7.0,'Closed','2019-08-20'),
(7,'Business Loan',1200000,10.0,'Active','2021-11-11'),
(8,'Personal Loan',200000,12.0,'Active','2023-02-05'),
(9,'Car Loan',750000,9.0,'Active','2022-06-14'),
(10,'Home Loan',2800000,8.4,'Active','2021-09-01'),
(11,'Personal Loan',400000,11.8,'Closed','2020-01-15'),
(12,'Education Loan',650000,7.1,'Active','2023-06-01'),
(13,'Home Loan',3500000,8.3,'Active','2019-10-10'),
(14,'Car Loan',900000,9.1,'Closed','2021-04-22'),
(15,'Business Loan',2000000,10.5,'Active','2018-05-18'),
(16,'Personal Loan',250000,11.2,'Active','2022-11-11'),
(17,'Education Loan',450000,7.3,'Closed','2020-07-07'),
(18,'Car Loan',680000,9.4,'Active','2023-05-20'),
(19,'Home Loan',2700000,8.6,'Active','2020-02-14'),
(20,'Personal Loan',320000,11.9,'Active','2022-08-09'),
(21,'Car Loan',820000,9.0,'Closed','2021-06-30'),
(22,'Education Loan',550000,7.2,'Active','2023-03-18'),
(23,'Business Loan',1500000,10.1,'Active','2020-10-25'),
(24,'Personal Loan',180000,12.3,'Active','2022-10-01'),
(25,'Home Loan',3100000,8.4,'Active','2019-04-05'),
(26,'Car Loan',720000,9.5,'Closed','2021-12-12'),
(27,'Business Loan',1700000,10.2,'Active','2020-09-01'),
(28,'Personal Loan',220000,12.0,'Active','2023-06-15'),
(29,'Education Loan',480000,7.4,'Active','2022-02-20'),
(30,'Home Loan',2600000,8.6,'Active','2023-07-01'),
(31,'Car Loan',860000,9.3,'Closed','2020-01-01'),
(32,'Personal Loan',290000,11.6,'Active','2022-05-11'),
(33,'Home Loan',2400000,8.7,'Active','2020-06-06'),
(34,'Education Loan',520000,7.1,'Active','2023-05-09'),
(35,'Business Loan',1800000,10.4,'Active','2019-03-15');

-- ========================================
--  ANALYSIS QUERIES
-- ========================================

-- ANALYSIS 1: Customer Behavior Analysis
-- 1.Customer distribution by city (Purpose: Identify major customer markets)
SELECT city, COUNT(*) AS total_customers
FROM Customers
GROUP BY city
ORDER BY total_customers DESC;

-- 2.Gender-wise customer analysis
SELECT gender, COUNT(*) AS total_customers
FROM Customers
GROUP BY gender;

-- 3.Customer tenure (loyalty analysis)
SELECT
  CASE
    WHEN TIMESTAMPDIFF(YEAR, join_date, CURDATE()) >= 4 THEN 'Long Term'
    WHEN TIMESTAMPDIFF(YEAR, join_date, CURDATE()) BETWEEN 2 AND 3 THEN 'Mid Term'
    ELSE 'New'
  END AS customer_type,
  COUNT(*) AS total_customers
FROM Customers
GROUP BY customer_type;

-- 4.long term customer names with number of year.
SELECT
  customer_name,
  TIMESTAMPDIFF(YEAR, join_date, CURDATE()) AS number_of_years
FROM Customers
ORDER BY number_of_years DESC, join_date ASC
LIMIT 5;

-- ANALYSIS 2: Account & Balance Analysis
-- 1.Average balance by account type
SELECT account_type, AVG(balance) AS avg_balance
FROM Accounts
GROUP BY account_type;

-- 2.High-value customers (VIP customers)
SELECT c.customer_name, a.balance
FROM Accounts a
JOIN Customers c ON a.customer_id = c.customer_id
WHERE a.balance > 300000
ORDER BY a.balance DESC;

-- 3. low balance risk account
SELECT c.customer_name, a.balance
FROM Accounts a
JOIN Customers c ON a.customer_id = c.customer_id
WHERE a.balance < 50000;

-- ANALYSIS 3: Transaction Behavior Analysis
-- 1. Credit vs Debit transaction analysis
SELECT transaction_type, COUNT(*) AS total_transactions,
SUM(amount) AS total_amount
FROM Transactions
GROUP BY transaction_type;

SELECT COUNT(*) FROM Transactions;

-- 2.High transaction value accounts
SELECT account_id, SUM(amount) AS total_transaction_amount
FROM Transactions
GROUP BY account_id
HAVING total_transaction_amount > 100000;

-- Transaction frequency per account
SELECT account_id, COUNT(*) AS transaction_count
FROM Transactions
GROUP BY account_id
ORDER BY transaction_count DESC;

-- ANALYSIS 4: Loan Risk & Profitability Analysis
-- Loan distribution by type
SELECT loan_type, COUNT(*) AS total_loans, SUM(loan_amount) AS total_amount
FROM Loans
GROUP BY loan_type;

-- Active vs closed loans
SELECT loan_status, COUNT(*) AS total_loans
FROM Loans
GROUP BY loan_status;

-- High-risk customers (multiple loans)
SELECT customer_id, COUNT(*) AS total_loans
FROM Loans
GROUP BY customer_id
HAVING total_loans > 1;

-- Interest income estimation
SELECT loan_type,
SUM(loan_amount * interest_rate / 100) AS estimated_interest_income
FROM Loans
WHERE loan_status = 'Active'
GROUP BY loan_type;

-- ANALYSIS 5: Branch Performance Analysis
-- Total deposits per branch
SELECT b.branch_name, SUM(a.balance) AS total_deposits
FROM Accounts a
JOIN Branches b ON a.branch_id = b.branch_id
GROUP BY b.branch_name
ORDER BY total_deposits DESC;

-- Branch-wise customer count
SELECT b.branch_name, COUNT(DISTINCT a.customer_id) AS total_customers
FROM Accounts a
JOIN Branches b ON a.branch_id = b.branch_id
GROUP BY b.branch_name;




