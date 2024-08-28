CREATE DATABASE Baitap5;
USE Baitap5;


CREATE TABLE account (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    status BIT
);

CREATE TABLE bill (
    id INT PRIMARY KEY AUTO_INCREMENT,
    bill_type BIT,
    account_id INT,
    created DATETIME,
    auth_date DATETIME,
    FOREIGN KEY (account_id) REFERENCES account(id)
);

CREATE TABLE product (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    created DATE,
    price DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL,
    status BIT
);

CREATE TABLE bill_details (
    id INT PRIMARY KEY AUTO_INCREMENT,
    bill_id INT,
    product_id INT,
    quantity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (bill_id) REFERENCES bill(id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

INSERT INTO account(username, password, address, status) VALUES
('Hùng', 123456, 'Nghệ An', TRUE),
('Cường', 654321, 'Hà Nội', TRUE),
('Bách', 135790, 'Đà Nẵng', TRUE);

INSERT INTO bill(bill_type, account_id, created, auth_date) VALUES
(0, 1, STR_TO_DATE('11/02/2022', '%d/%m/%Y'), STR_TO_DATE('12/03/2022', '%d/%m/%Y')),
(0, 1, STR_TO_DATE('05/10/2023', '%d/%m/%Y'), STR_TO_DATE('10/10/2023', '%d/%m/%Y')),
(1, 2, STR_TO_DATE('15/05/2024', '%d/%m/%Y'), STR_TO_DATE('20/05/2024', '%d/%m/%Y')),
(1, 3, STR_TO_DATE('01/02/2022', '%d/%m/%Y'), STR_TO_DATE('10/02/2022', '%d/%m/%Y'));

INSERT INTO product(name, created, price, stock, status) VALUES
("Quần dài", STR_TO_DATE('12/03/2022', '%d/%m/%Y'), 1200, 5, TRUE),
("Áo dài", STR_TO_DATE('15/03/2023', '%d/%m/%Y'), 1500, 8, TRUE),
("Mũ cối", STR_TO_DATE('08/03/1999', '%d/%m/%Y'), 1600, 10, TRUE);

INSERT INTO bill_details(bill_id, product_id, quantity, price) VALUES
(1, 1, 3, 1200),
(2, 2, 4, 1500),
(3, 1, 1, 1200),
(4, 2, 4, 1500),
(4, 3, 7, 1600);

-- Display all accounts sorted by username in descending order
SELECT * FROM account
ORDER BY username DESC;

-- Display all bills from 11/02/2023 to 15/05/2023
SELECT * FROM bill
WHERE created BETWEEN STR_TO_DATE('11/02/2023', '%d/%m/%Y') AND STR_TO_DATE('15/05/2023', '%d/%m/%Y');

-- Display all bill_details sorted by bill_id
SELECT * FROM bill_details
ORDER BY bill_id;

-- Display all products sorted by name in descending order
SELECT * FROM product
ORDER BY name DESC;

-- Display all products with stock greater than 10
SELECT * FROM product
WHERE stock > 10;

-- Display all active products (status = true)
SELECT * FROM product
WHERE status = TRUE;
