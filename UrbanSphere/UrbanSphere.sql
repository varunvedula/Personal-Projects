CREATE DATABASE IF NOT EXISTS UrbanSphere;
USE UrbanSphere;

# CREATING TABLES (DDL)

# Regions Table
CREATE TABLE regions (
    region_id INT PRIMARY KEY,
    region_name VARCHAR(50),
    city VARCHAR(50)
);

# Customers Table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(100),
    signup_date DATE,
    segment VARCHAR(20),
    region_id INT,
    FOREIGN KEY (region_id) REFERENCES regions(region_id)
);

# Products Table
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    brand VARCHAR(50),
    price DECIMAL(10, 2)
);

# Orders Table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    order_date DATE,
    quantity INT,
    order_status VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

# Payments Table
CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    order_id INT,
    payment_method VARCHAR(50),
    discount DECIMAL(10, 2),
    final_amount DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

# Returns Table
CREATE TABLE returns (
    return_id INT PRIMARY KEY,
    order_id INT,
    return_date DATE,
    return_reason VARCHAR(100),
    refund_status VARCHAR(20),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

SHOW TABLES;

# DML 

INSERT INTO regions (region_id, region_name, city) VALUES
(1, 'East Coast', ' New York '),
(2, 'West Coast', 'Los Angeles'),
(3, 'Midwest', 'Chicago'),
(4, 'South', ' Dallas '),
(5, 'Pacific Northwest', 'Seattle');

INSERT INTO customers (customer_id, customer_name, email, signup_date, segment, region_id) VALUES
(101, 'Clayton Yates', 'maria78@example.net', '2024-08-30', 'Gold', 2),
(102, 'Kristi Hays', 'melanie65@example.net', '2023-10-18', 'Silver', 3),
(103, 'Aaron Lewis', 'kimberlyvazquez@example.org', '2023-09-27', 'Platinum', 4),
(104, 'Ms. Monica Taylor', 'huntersean@example.net', '2023-08-07', 'Silver', 1),
(105, 'William Kim', 'david59@example.com', '2024-06-30', 'Platinum', 5),
(106, 'Dr. Douglas Glover', 'morrisdavid@example.net', '2023-11-23', 'Silver', 1),
(107, 'Bethany Bowen', 'amyjohnson@example.net', '2023-12-08', 'Gold', 3),
(108, 'Nicholas Mcpherson', 'katiemartin@example.net', '2023-08-19', 'Gold', 2),
(109, 'Robert Whitehead', 'teresabass@example.net', '2024-06-18', NULL, 2),
(110, 'Jillian Morse', 'joseph29@example.com', '2024-03-11', 'Silver', 5),
(111, 'Timothy Logan', 'nathan35@example.org', '2023-11-14', 'Platinum', 2),
(112, 'Zachary Riley', 'morrischristopher@example.net', '2024-06-28', 'Gold', 1),
(113, 'Samuel Leonard', 'danielross@example.com', '2023-09-14', NULL, 2),
(114, 'Lauren Price', 'wsmith@example.org', '2023-07-31', 'Silver', 4),
(115, 'Douglas Robinson', 'keith49@example.org', '2023-11-30', 'Gold', 5),
(116, 'Dr. Charles Hunt', 'peterssusan@example.com', '2024-03-22', 'Platinum', 3),
(117, 'Denise Dickerson', 'smthall@example.net', '2023-08-04', 'Silver', 4),
(118, 'Nathan Hill', 'robert44@example.com', '2023-11-08', 'Gold', 5),
(119, 'Brian Todd', 'susan06@example.com', '2024-01-13', 'Gold', 3),
(120, 'Brenda Beck', 'robertwilliams@example.com', '2024-05-16', NULL, 1),
(121, 'Theresa Johnson', 'lorenzosmith@example.net', '2024-03-10', 'Silver', 2),
(122, 'Jose Hall', 'thomasparker@example.org', '2024-01-07', 'Platinum', 3),
(123, 'Amber Henderson', 'rossnicholas@example.com', '2023-12-13', 'Silver', 4),
(124, 'Michael Martin', 'carol97@example.com', '2024-04-21', NULL, 2),
(125, 'Tammy Meyer', 'ericmccormick@example.net', '2023-10-31', 'Gold', 1),
(126, 'Margaret Rogers', 'richardjohnson@example.com', '2023-08-30', 'Silver', 3),
(127, 'Deborah Brewer', 'james24@example.net', '2024-02-18', 'Platinum', 5),
(128, 'Samuel Schultz', 'joseph47@example.com', '2024-06-12', 'Gold', 2),
(129, 'Andrew Newton', 'garrettdebbie@example.org', '2023-09-05', NULL, 1),
(130, 'Jared Miles', 'hannah42@example.com', '2024-01-02', 'Silver', 3),
(131, 'Brianna Lewis', 'joelwatson@example.com', '2024-05-09', 'Gold', 2),
(132, 'Annette Graham', 'james75@example.net', '2023-11-04', NULL, 4),
(133, 'Jeremiah Sanders', 'paulmoore@example.com', '2024-06-21', 'Platinum', 3),
(134, 'Denise Sandoval', 'alexandersmith@example.net', '2024-02-06', 'Silver', 5),
(135, 'Carlos Munoz', 'russellgregory@example.org', '2023-12-23', 'Gold', 4);

INSERT INTO products (product_id, product_name, category, brand, price) VALUES (201, 'Purpose Set', 'Electronics', 'ZenTech', 91.57);
INSERT INTO products (product_id, product_name, category, brand, price) VALUES (202, 'Brother Max', 'Fashion', 'UrbanStyle', 91.01);
INSERT INTO products (product_id, product_name, category, brand, price) VALUES (203, 'Ago Set', 'Fitness', 'ZenTech', 74.95);
INSERT INTO products (product_id, product_name, category, brand, price) VALUES (204, 'Site Pro', 'Electronics', 'ZenTech', 34.05);
INSERT INTO products (product_id, product_name, category, brand, price) VALUES (205, 'Face Plus', 'Fitness', 'ZenTech', 71.74);
INSERT INTO products (product_id, product_name, category, brand, price) VALUES (206, 'Election Set', 'Fitness', 'GlowUp', 34.25);
INSERT INTO products (product_id, product_name, category, brand, price) VALUES (207, 'Dog Plus', 'Home', 'SpeedTek', 105.62);
INSERT INTO products (product_id, product_name, category, brand, price) VALUES (208, 'Chair Max', 'Beauty', 'AromaCo', 40.57);
INSERT INTO products (product_id, product_name, category, brand, price) VALUES (209, 'Since Max', 'Home', 'ZenTech', 20.2);
INSERT INTO products (product_id, product_name, category, brand, price) VALUES (210, 'Blue Pro', 'Home', 'SpeedTek', 47.84);
INSERT INTO products (product_id, product_name, category, brand, price) VALUES (211, 'Require Lite', 'Electronics', 'SoundPro', 60.54);
INSERT INTO products (product_id, product_name, category, brand, price) VALUES (212, 'Sit Pro', 'Beauty', 'ZenTech', 70.72);
INSERT INTO products (product_id, product_name, category, brand, price) VALUES (213, 'Wait Set', 'Fitness', 'SpeedTek', 49.78);
INSERT INTO products (product_id, product_name, category, brand, price) VALUES (214, 'Offer Max', 'Electronics', 'ZenTech', 82.74);
INSERT INTO products (product_id, product_name, category, brand, price) VALUES (215, 'Begin Lite', 'Electronics', 'SpeedTek', 35.61);
INSERT INTO products (product_id, product_name, category, brand, price) VALUES (216, 'Performance Pro', 'Beauty', 'AromaCo', 59.88);
INSERT INTO products (product_id, product_name, category, brand, price) VALUES (217, 'Knowledge Lite', 'Fashion', 'AromaCo', 49.08);
INSERT INTO products (product_id, product_name, category, brand, price) VALUES (218, 'Almost Set', 'Home', 'SoundPro', 113.03);
INSERT INTO products (product_id, product_name, category, brand, price) VALUES (219, 'All Set', 'Electronics', 'FlexiGear', 79.85);
INSERT INTO products (product_id, product_name, category, brand, price) VALUES (220, 'Better Plus', 'Fashion', 'UrbanStyle', 60.85);
INSERT INTO products (product_id, product_name, category, brand, price) VALUES (221, 'Discover Lite', 'Fitness', 'UrbanStyle', 85.31);
INSERT INTO products (product_id, product_name, category, brand, price) VALUES (222, 'Early Pro', 'Fashion', 'SpeedTek', 13.53);
INSERT INTO products (product_id, product_name, category, brand, price) VALUES (223, 'Mouth Lite', 'Beauty', 'AromaCo', 17.28);
INSERT INTO products (product_id, product_name, category, brand, price) VALUES (224, 'Play Plus', 'Home', 'UrbanStyle', 82.1);
INSERT INTO products (product_id, product_name, category, brand, price) VALUES (225, 'Agreement XL', 'Beauty', 'UrbanStyle', 39.14);
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (301, 116, 224, '2024-09-26', 3, ' delivered');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (302, 128, 219, '2025-02-12', 2, 'Shipped');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (303, 109, 217, '2025-05-20', 1, 'Delivered');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (304, 108, 205, '2024-06-12', 3, 'Delivered ');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (305, 105, 213, '2025-01-25', 3, 'Delivered ');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (306, 134, 209, '2024-01-12', 3, 'Delivered');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (307, 135, 225, '2024-09-30', 3, 'Cancelled');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (308, 108, 210, '2025-03-21', 1, 'Delivered ');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (309, 101, 224, '2024-09-26', 3, 'Shipped');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (310, 133, 204, '2024-11-01', 3, ' delivered');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (311, 113, 205, '2025-01-17', 1, ' delivered');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (312, 134, 201, '2024-11-27', 2, 'Delivered');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (313, 108, 212, '2024-11-10', 1, 'Delivered');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (314, 116, 219, '2024-03-21', 1, 'Delivered ');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (315, 105, 225, '2024-05-08', 1, 'Delivered ');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (316, 111, 209, '2025-06-24', 3, 'Delivered ');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (317, 114, 218, '2024-07-24', 3, 'Cancelled');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (318, 126, 222, '2025-01-17', 2, ' delivered');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (319, 129, 204, '2024-09-10', 1, 'Delivered');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (320, 122, 201, '2024-08-23', 3, 'Shipped');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (321, 101, 203, '2024-03-01', 1, 'Delivered');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (322, 103, 211, '2024-03-13', 3, 'Shipped');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (323, 118, 222, '2025-05-12', 1, ' delivered');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (324, 109, 224, '2025-04-29', 1, 'Delivered ');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (325, 127, 207, '2024-04-06', 1, 'Delivered ');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (326, 123, 214, '2025-02-24', 2, 'Delivered');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (327, 107, 202, '2025-02-16', 3, 'Cancelled');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (328, 107, 208, '2024-07-15', 1, ' delivered');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (329, 129, 205, '2025-03-08', 1, 'Cancelled');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (330, 130, 208, '2024-03-18', 2, ' delivered');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (331, 107, 202, '2024-01-16', 1, 'Shipped');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (332, 111, 214, '2025-05-12', 2, 'Shipped');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (333, 126, 202, '2024-06-17', 2, 'Delivered');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (334, 125, 209, '2025-04-10', 2, 'Delivered ');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (335, 132, 205, '2024-07-13', 2, 'Shipped');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (336, 104, 219, '2024-03-03', 3, 'Cancelled');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (337, 104, 202, '2025-05-03', 3, ' delivered');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (338, 111, 202, '2025-06-04', 1, 'Shipped');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (339, 105, 220, '2024-03-10', 3, 'Shipped');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (340, 126, 204, '2024-09-09', 3, ' delivered');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (341, 103, 220, '2024-03-24', 2, ' delivered');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (342, 134, 211, '2024-09-24', 1, 'Cancelled');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (343, 116, 209, '2025-02-09', 1, 'Cancelled');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (344, 130, 211, '2024-03-15', 1, 'Delivered ');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (345, 107, 203, '2024-08-06', 3, 'Cancelled');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (346, 109, 212, '2024-03-11', 1, 'Cancelled');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (347, 119, 206, '2025-03-24', 3, 'Cancelled');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (348, 134, 201, '2024-11-02', 3, 'Delivered');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (349, 109, 209, '2024-04-28', 1, ' delivered');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (350, 110, 209, '2024-10-15', 3, 'Shipped');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (351, 122, 207, '2024-09-27', 3, 'Delivered ');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (352, 117, 202, '2024-04-04', 3, 'Delivered ');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (353, 118, 202, '2024-01-04', 2, 'Shipped');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (354, 117, 206, '2025-03-28', 3, 'Delivered ');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (355, 101, 204, '2024-03-18', 3, 'Shipped');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (356, 135, 202, '2025-01-13', 3, ' delivered');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (357, 110, 214, '2024-05-10', 1, 'Cancelled');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (358, 124, 202, '2025-01-01', 1, 'Shipped');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (359, 107, 212, '2025-02-20', 3, 'Shipped');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (360, 116, 206, '2024-06-30', 2, 'Delivered');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (361, 112, 224, '2024-12-06', 2, 'Shipped');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (362, 118, 206, '2024-04-20', 2, 'Delivered');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (363, 131, 208, '2024-07-23', 2, 'Cancelled');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (364, 120, 208, '2024-08-16', 1, 'Shipped');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (365, 126, 211, '2024-10-12', 1, 'Cancelled');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (366, 123, 221, '2025-06-05', 2, ' delivered');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (367, 122, 201, '2024-04-28', 2, 'Shipped');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (368, 117, 202, '2024-04-21', 3, 'Delivered ');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (369, 123, 224, '2024-11-17', 2, ' delivered');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (370, 133, 204, '2025-01-29', 3, 'Shipped');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (371, 117, 202, '2025-03-22', 1, ' delivered');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (372, 135, 222, '2024-07-20', 2, 'Delivered ');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (373, 105, 222, '2024-12-04', 3, 'Cancelled');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (374, 108, 224, '2024-11-03', 3, 'Cancelled');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (375, 127, 211, '2025-02-16', 3, 'Cancelled');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (376, 109, 207, '2025-03-06', 3, 'Delivered ');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (377, 112, 220, '2024-11-04', 2, ' delivered');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (378, 101, 210, '2024-10-20', 1, 'Delivered ');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (379, 121, 215, '2025-03-28', 2, 'Shipped');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (380, 133, 216, '2024-06-22', 3, 'Delivered');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (381, 119, 217, '2024-12-09', 1, 'Shipped');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (382, 120, 208, '2024-07-22', 1, 'Delivered');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (383, 103, 208, '2025-05-01', 3, 'Delivered');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (384, 130, 214, '2024-07-18', 3, 'Delivered ');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (385, 132, 213, '2024-09-06', 1, 'Delivered');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (386, 107, 225, '2025-03-11', 1, 'Shipped');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (387, 134, 215, '2024-02-21', 3, 'Shipped');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (388, 108, 215, '2024-05-16', 2, ' delivered');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (389, 121, 225, '2025-03-29', 3, ' delivered');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (390, 128, 218, '2025-04-01', 1, 'Delivered ');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (391, 129, 209, '2024-09-10', 3, 'Cancelled');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (392, 134, 216, '2024-09-01', 2, 'Delivered ');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (393, 105, 223, '2024-10-19', 1, 'Cancelled');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (394, 122, 211, '2024-03-23', 1, 'Shipped');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (395, 115, 213, '2024-06-05', 3, 'Shipped');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (396, 105, 214, '2025-02-21', 2, ' delivered');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (397, 130, 214, '2024-03-04', 1, 'Delivered ');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (398, 125, 225, '2024-01-21', 3, 'Delivered ');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (399, 131, 201, '2024-12-26', 2, 'Delivered ');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (400, 127, 218, '2024-08-13', 2, 'Shipped');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (401, 118, 214, '2025-05-12', 1, 'Delivered ');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (402, 122, 222, '2025-02-18', 3, 'Shipped');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (403, 130, 205, '2024-01-28', 2, ' delivered');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (404, 102, 203, '2025-03-14', 1, 'Delivered ');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (405, 112, 202, '2024-09-23', 2, 'Cancelled');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (406, 114, 215, '2024-11-30', 2, 'Delivered ');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (407, 118, 225, '2025-03-07', 2, 'Delivered');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (408, 131, 201, '2024-02-23', 2, 'Shipped');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (409, 105, 225, '2024-02-11', 1, 'Shipped');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (410, 113, 201, '2024-06-05', 1, 'Shipped');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (411, 131, 222, '2024-04-27', 3, 'Shipped');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (412, 130, 223, '2024-09-19', 2, 'Shipped');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (413, 108, 225, '2024-06-16', 2, 'Delivered');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (414, 102, 210, '2025-01-19', 2, 'Shipped');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (415, 105, 219, '2024-09-05', 1, 'Cancelled');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (416, 108, 219, '2024-02-12', 2, ' delivered');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (417, 128, 222, '2025-01-14', 1, ' delivered');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (418, 122, 201, '2025-03-06', 2, 'Delivered');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (419, 128, 212, '2025-04-15', 3, 'Shipped');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (420, 128, 206, '2025-06-18', 3, 'Cancelled');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (421, 135, 225, '2025-05-10', 2, 'Delivered ');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (422, 118, 211, '2024-09-08', 1, 'Cancelled');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (423, 129, 208, '2025-04-20', 3, ' delivered');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (424, 125, 211, '2024-01-30', 2, 'Cancelled');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (425, 112, 216, '2024-08-05', 2, 'Cancelled');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (426, 122, 209, '2024-10-09', 3, 'Delivered');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (427, 134, 207, '2024-03-28', 1, 'Delivered ');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (428, 132, 218, '2024-09-03', 3, 'Delivered ');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (429, 132, 215, '2024-01-18', 1, 'Cancelled');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (430, 115, 213, '2024-09-06', 2, ' delivered');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (431, 124, 216, '2024-12-18', 2, ' delivered');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (432, 122, 212, '2025-04-09', 2, 'Cancelled');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (433, 117, 208, '2024-05-03', 3, 'Shipped');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (434, 121, 204, '2024-07-08', 1, 'Shipped');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (435, 131, 209, '2025-06-21', 3, 'Cancelled');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (436, 107, 207, '2024-10-30', 1, 'Cancelled');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (437, 112, 210, '2024-01-15', 3, ' delivered');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (438, 109, 209, '2024-02-16', 1, ' delivered');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (439, 119, 223, '2024-05-09', 3, 'Delivered ');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (440, 107, 201, '2024-10-18', 2, 'Delivered ');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (441, 129, 211, '2024-07-07', 1, 'Cancelled');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (442, 131, 204, '2024-03-07', 2, 'Delivered ');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (443, 105, 219, '2024-02-24', 1, 'Shipped');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (444, 120, 203, '2024-09-11', 1, ' delivered');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (445, 127, 220, '2024-08-19', 3, 'Delivered ');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (446, 129, 215, '2024-10-31', 3, 'Delivered ');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (447, 120, 219, '2024-03-02', 3, 'Delivered');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (448, 114, 221, '2024-08-04', 2, 'Delivered');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (449, 111, 208, '2024-06-26', 3, 'Delivered');
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, order_status) VALUES (450, 111, 201, '2025-02-22', 2, ' delivered');
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (501, 301, 'Gift Card', NULL, NULL);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (502, 302, 'Gift Card', 10.54, 124.427);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (503, 303, 'PayPal', 11.82, 163.763);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (504, 304, 'PayPal', 8.17, 168.956);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (505, 305, 'Gift Card', 1.07, 58.162);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (506, 306, 'Gift Card', 12.36, 231.874);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (507, 307, 'COD', 10.33, 180.939);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (508, 308, 'Gift Card', 7.41, 38.502);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (509, 309, 'Credit Card', 11.02, 158.854);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (510, 310, 'Credit Card', NULL, NULL);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (511, 311, NULL, 0.31, 195.895);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (512, 312, 'Gift Card', 11.45, 60.294);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (513, 313, NULL, 13.74, 61.743);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (514, 314, NULL, 12.21, 242.883);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (515, 315, 'COD', 5.0, 174.131);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (516, 316, 'PayPal', 10.41, 86.29);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (517, 317, 'COD', 8.25, 124.61);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (518, 318, 'Gift Card', 1.74, 197.686);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (519, 319, NULL, 0.02, 219.955);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (520, 320, 'COD', 2.81, 103.209);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (521, 321, 'COD', 11.4, 66.818);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (522, 322, NULL, 4.32, 222.595);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (523, 323, 'COD', 14.6, 160.04);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (524, 324, 'PayPal', 4.66, 23.145);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (525, 325, 'COD', NULL, NULL);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (526, 326, 'Credit Card', 1.76, 211.393);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (527, 327, 'COD', 4.38, 182.245);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (528, 328, 'COD', 14.7, 76.058);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (529, 329, NULL, 2.86, 157.857);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (530, 330, 'PayPal', 4.14, 201.701);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (531, 331, 'COD', 11.82, 81.45);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (532, 332, 'Credit Card', 4.48, 154.996);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (533, 333, 'COD', 6.7, 131.399);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (534, 334, 'Gift Card', 8.15, 124.729);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (535, 335, 'Gift Card', 14.71, 74.925);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (536, 336, 'COD', 11.63, 30.039);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (537, 337, 'COD', 12.17, 108.798);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (538, 338, 'PayPal', 0.56, 135.527);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (539, 339, NULL, 1.51, 214.359);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (540, 340, 'Credit Card', 6.85, 186.162);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (541, 341, 'COD', 14.55, 37.21);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (542, 342, 'Gift Card', 10.39, 169.462);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (543, 343, 'Gift Card', 12.89, 107.402);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (544, 344, 'Gift Card', 13.31, 132.228);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (545, 345, NULL, NULL, NULL);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (546, 346, 'Credit Card', 10.27, 86.097);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (547, 347, 'PayPal', 6.51, 42.642);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (548, 348, 'Credit Card', 10.41, 227.788);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (549, 349, 'Credit Card', 0.84, 102.447);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (550, 350, 'COD', 7.97, 150.163);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (551, 351, 'PayPal', 1.18, 220.293);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (552, 352, NULL, 7.47, 154.126);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (553, 353, 'PayPal', 3.81, 78.725);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (554, 354, 'Credit Card', 6.98, 86.155);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (555, 355, NULL, 6.63, 99.48);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (556, 356, NULL, 14.43, 178.772);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (557, 357, 'COD', 2.99, 108.479);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (558, 358, 'COD', 5.72, 102.561);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (559, 359, 'Gift Card', 4.43, 244.927);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (560, 360, 'COD', 8.49, 177.734);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (561, 361, 'Credit Card', 11.18, 211.553);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (562, 362, 'Gift Card', 3.45, 204.444);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (563, 363, 'PayPal', 9.31, 175.886);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (564, 364, 'PayPal', 13.55, 168.658);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (565, 365, 'Gift Card', 0.5, 103.918);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (566, 366, 'PayPal', NULL, NULL);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (567, 367, 'Gift Card', 6.23, 66.183);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (568, 368, NULL, 5.49, 135.413);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (569, 369, 'Gift Card', 3.85, 209.679);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (570, 370, 'COD', 4.43, 220.191);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (571, 371, 'Credit Card', 1.13, 193.455);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (572, 372, 'PayPal', 10.86, 245.387);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (573, 373, NULL, 11.86, 23.201);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (574, 374, NULL, 5.53, 192.273);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (575, 375, 'Gift Card', 12.34, 236.267);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (576, 376, 'Credit Card', 7.07, 162.496);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (577, 377, NULL, 9.15, 168.96);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (578, 378, 'COD', 4.53, 113.908);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (579, 379, 'PayPal', NULL, NULL);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (580, 380, 'Credit Card', 7.39, 42.354);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (581, 381, NULL, 6.8, 174.212);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (582, 382, NULL, 11.13, 55.54);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (583, 383, 'COD', 12.51, 161.6);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (584, 384, 'Gift Card', NULL, NULL);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (585, 385, 'Gift Card', 6.67, 74.306);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (586, 386, 'Gift Card', NULL, NULL);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (587, 387, 'Gift Card', 14.67, 102.495);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (588, 388, 'COD', 14.52, 238.272);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (589, 389, 'COD', NULL, NULL);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (590, 390, 'PayPal', 8.96, 24.912);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (591, 391, 'Gift Card', 1.89, 149.853);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (592, 392, 'Credit Card', 8.31, 154.868);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (593, 393, 'PayPal', 2.21, 227.122);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (594, 394, 'Credit Card', 14.76, 247.131);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (595, 395, NULL, 2.62, 172.043);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (596, 396, 'Credit Card', 5.37, 201.339);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (597, 397, NULL, 2.61, 32.052);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (598, 398, 'COD', 11.18, 129.537);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (599, 399, 'Gift Card', 1.64, 135.883);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (600, 400, NULL, NULL, NULL);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (601, 401, NULL, 9.65, 27.165);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (602, 402, 'COD', 6.39, 44.831);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (603, 403, 'COD', NULL, NULL);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (604, 404, 'Credit Card', 2.23, 49.024);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (605, 405, NULL, 8.23, 94.793);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (606, 406, NULL, 6.81, 159.248);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (607, 407, 'Credit Card', 1.72, 170.584);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (608, 408, NULL, 3.23, 123.858);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (609, 409, 'PayPal', 12.41, 111.708);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (610, 410, 'Credit Card', 4.69, 78.625);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (611, 411, 'PayPal', 7.11, 40.982);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (612, 412, 'Credit Card', NULL, NULL);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (613, 413, 'Credit Card', 5.59, 49.927);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (614, 414, 'Credit Card', 8.42, 95.819);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (615, 415, 'Credit Card', 13.1, 236.46);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (616, 416, 'COD', 10.82, 242.732);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (617, 417, NULL, 1.55, 136.705);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (618, 418, 'PayPal', 3.36, 44.89);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (619, 419, NULL, 11.44, 152.043);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (620, 420, 'COD', 14.62, 208.238);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (621, 421, NULL, 8.35, 160.069);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (622, 422, 'Gift Card', NULL, NULL);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (623, 423, 'Gift Card', 4.63, 98.16);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (624, 424, 'Credit Card', 2.15, 171.189);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (625, 425, 'Credit Card', 9.5, 27.051);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (626, 426, NULL, 6.3, 98.406);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (627, 427, 'Gift Card', 4.87, 236.524);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (628, 428, NULL, NULL, NULL);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (629, 429, 'Credit Card', 11.32, 31.445);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (630, 430, 'Credit Card', 9.93, 131.702);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (631, 431, 'COD', 3.23, 137.84);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (632, 432, 'Gift Card', 4.25, 176.052);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (633, 433, 'COD', 4.63, 70.719);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (634, 434, NULL, NULL, NULL);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (635, 435, 'PayPal', 3.17, 51.564);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (636, 436, 'Gift Card', 1.8, 134.399);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (637, 437, 'COD', 5.7, 181.844);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (638, 438, NULL, 10.02, 101.458);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (639, 439, 'COD', 0.63, 24.311);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (640, 440, 'Credit Card', 8.64, 151.882);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (641, 441, 'COD', 6.08, 242.226);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (642, 442, 'PayPal', 9.27, 211.366);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (643, 443, 'Gift Card', NULL, NULL);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (644, 444, 'Credit Card', 8.83, 140.511);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (645, 445, 'COD', 11.19, 70.962);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (646, 446, 'PayPal', NULL, NULL);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (647, 447, 'Credit Card', 2.91, 198.532);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (648, 448, 'Gift Card', 12.28, 207.459);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (649, 449, 'PayPal', 3.84, 59.905);
INSERT INTO payments (payment_id, order_id, payment_method, discount, final_amount) VALUES (650, 450, 'PayPal', 9.83, 60.744);
INSERT INTO returns (return_id, order_id, return_date, return_reason, refund_status) VALUES (701, 427, '2024-02-13', 'Wrong item', 'Pending');
INSERT INTO returns (return_id, order_id, return_date, return_reason, refund_status) VALUES (702, 419, '2024-11-26', 'Late delivery', NULL);
INSERT INTO returns (return_id, order_id, return_date, return_reason, refund_status) VALUES (703, 445, '2025-05-29', 'Did not like', 'Refunded');
INSERT INTO returns (return_id, order_id, return_date, return_reason, refund_status) VALUES (704, 415, '2025-04-07', 'Defective', 'Rejected');
INSERT INTO returns (return_id, order_id, return_date, return_reason, refund_status) VALUES (705, 448, '2024-03-28', 'Late delivery', 'Pending');
INSERT INTO returns (return_id, order_id, return_date, return_reason, refund_status) VALUES (706, 383, '2024-02-11', 'Did not like', NULL);
INSERT INTO returns (return_id, order_id, return_date, return_reason, refund_status) VALUES (707, 381, '2025-03-26', 'Late delivery', 'Pending');
INSERT INTO returns (return_id, order_id, return_date, return_reason, refund_status) VALUES (708, 339, '2025-01-08', 'Too small', 'Rejected');
INSERT INTO returns (return_id, order_id, return_date, return_reason, refund_status) VALUES (709, 413, '2025-02-01', 'Wrong item', 'Rejected');
INSERT INTO returns (return_id, order_id, return_date, return_reason, refund_status) VALUES (710, 318, '2024-02-24', NULL, 'Rejected');
INSERT INTO returns (return_id, order_id, return_date, return_reason, refund_status) VALUES (711, 421, '2024-03-09', 'Too small', 'Refunded');
INSERT INTO returns (return_id, order_id, return_date, return_reason, refund_status) VALUES (712, 414, '2025-01-31', 'Too small', 'Rejected');
INSERT INTO returns (return_id, order_id, return_date, return_reason, refund_status) VALUES (713, 378, '2024-06-03', 'Too small', 'Refunded');
INSERT INTO returns (return_id, order_id, return_date, return_reason, refund_status) VALUES (714, 371, '2024-05-25', 'Too small', 'Rejected');
INSERT INTO returns (return_id, order_id, return_date, return_reason, refund_status) VALUES (715, 315, '2025-02-06', 'Did not like', 'Refunded');
INSERT INTO returns (return_id, order_id, return_date, return_reason, refund_status) VALUES (716, 391, '2024-11-14', 'Late delivery', NULL);
INSERT INTO returns (return_id, order_id, return_date, return_reason, refund_status) VALUES (717, 430, '2024-12-03', 'Did not like', 'Refunded');
INSERT INTO returns (return_id, order_id, return_date, return_reason, refund_status) VALUES (718, 319, '2025-03-10', 'Late delivery', 'Rejected');
INSERT INTO returns (return_id, order_id, return_date, return_reason, refund_status) VALUES (719, 380, '2024-01-20', 'Too small', 'Rejected');
INSERT INTO returns (return_id, order_id, return_date, return_reason, refund_status) VALUES (720, 449, '2024-07-04', 'Did not like', 'Rejected');
INSERT INTO returns (return_id, order_id, return_date, return_reason, refund_status) VALUES (721, 416, '2025-05-13', 'Did not like', 'Pending');
INSERT INTO returns (return_id, order_id, return_date, return_reason, refund_status) VALUES (722, 310, '2024-05-21', 'Did not like', 'Refunded');
INSERT INTO returns (return_id, order_id, return_date, return_reason, refund_status) VALUES (723, 436, '2024-10-30', 'Defective', 'Refunded');
INSERT INTO returns (return_id, order_id, return_date, return_reason, refund_status) VALUES (724, 348, '2024-12-11', 'Late delivery', 'Pending');
INSERT INTO returns (return_id, order_id, return_date, return_reason, refund_status) VALUES (725, 407, '2025-01-21', 'Did not like', 'Pending');
INSERT INTO returns (return_id, order_id, return_date, return_reason, refund_status) VALUES (726, 337, '2024-07-05', NULL, 'Pending');
INSERT INTO returns (return_id, order_id, return_date, return_reason, refund_status) VALUES (727, 429, '2025-03-25', 'Defective', NULL);
INSERT INTO returns (return_id, order_id, return_date, return_reason, refund_status) VALUES (728, 446, '2025-01-09', NULL, 'Pending');
INSERT INTO returns (return_id, order_id, return_date, return_reason, refund_status) VALUES (729, 411, '2025-03-31', 'Late delivery', 'Rejected');
INSERT INTO returns (return_id, order_id, return_date, return_reason, refund_status) VALUES (730, 410, '2025-04-05', 'Did not like', 'Pending');
INSERT INTO returns (return_id, order_id, return_date, return_reason, refund_status) VALUES (731, 312, '2024-11-13', 'Wrong item', 'Pending');
INSERT INTO returns (return_id, order_id, return_date, return_reason, refund_status) VALUES (732, 379, '2025-01-12', NULL, NULL);
INSERT INTO returns (return_id, order_id, return_date, return_reason, refund_status) VALUES (733, 377, '2025-04-18', 'Too small', NULL);
INSERT INTO returns (return_id, order_id, return_date, return_reason, refund_status) VALUES (734, 365, '2025-05-30', 'Late delivery', NULL);
INSERT INTO returns (return_id, order_id, return_date, return_reason, refund_status) VALUES (735, 350, '2024-06-15', 'Did not like', 'Pending');
INSERT INTO returns (return_id, order_id, return_date, return_reason, refund_status) VALUES (736, 360, '2024-09-14', 'Defective', NULL);
INSERT INTO returns (return_id, order_id, return_date, return_reason, refund_status) VALUES (737, 375, '2025-01-16', 'Late delivery', 'Refunded');
INSERT INTO returns (return_id, order_id, return_date, return_reason, refund_status) VALUES (738, 437, '2025-06-13', 'Defective', 'Rejected');
INSERT INTO returns (return_id, order_id, return_date, return_reason, refund_status) VALUES (739, 402, '2024-03-27', 'Did not like', 'Rejected');
INSERT INTO returns (return_id, order_id, return_date, return_reason, refund_status) VALUES (740, 395, '2025-04-06', 'Late delivery', 'Pending');

