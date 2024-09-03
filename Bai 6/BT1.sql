CREATE DATABASE Baitap1;
USE Baitap1;

-- Create tables
CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(255) NOT NULL,
    phone VARCHAR(11) NOT NULL UNIQUE,
    dateOfBirth DATE NOT NULL,
    status BIT
);

CREATE TABLE products (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    price DOUBLE,
    stock INT,
    status BIT
);

CREATE TABLE shopping_cart (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    product_id INT,
    quantity INT,
    amount DOUBLE,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

-- Thêm dữ liệu vào bảng users
INSERT INTO users (name, address, phone, dateOfBirth, status) VALUES 
('Nguyen Van A', '123 Đường ABC, Thành phố X', '0123456789', '1990-01-01', 1),
('Le Thi B', '456 Đường DEF, Thành phố Y', '0987654321', '1992-05-15', 1);

-- Thêm dữ liệu vào bảng products
INSERT INTO products (name, price, stock, status) VALUES 
('Sản phẩm A', 100.00, 50, 1),
('Sản phẩm B', 200.00, 30, 1);

-- Thêm dữ liệu vào bảng shopping_cart
INSERT INTO shopping_cart (user_id, product_id, quantity, amount) VALUES 
(1, 1, 2, 200.00),
(2, 2, 1, 200.00);

-- Kiểm tra dữ liệu trong các bảng
SELECT * FROM users;
SELECT * FROM products;
SELECT * FROM shopping_cart;


-- Tạo Trigger khi thay đổi giá của sản phẩm thì amount (tổng giá) cũng sẽ phải cập nhật lại
DELIMITER //

CREATE TRIGGER update_amount_on_price_change
AFTER UPDATE ON products
FOR EACH ROW
BEGIN
    UPDATE shopping_cart
    SET amount = quantity * NEW.price
    WHERE product_id = NEW.id;
END;

//

DELIMITER ;

-- Tạo Trigger khi xóa product thì những dữ liệu ở bảng shopping_cart có chứa product bị xóa thì cũng phải xóa theo
DELIMITER //

CREATE TRIGGER delete_shopping_cart_entries_on_product_delete
AFTER DELETE ON products
FOR EACH ROW
BEGIN
    DELETE FROM shopping_cart
    WHERE product_id = OLD.id;
END;

//

DELIMITER ;

-- Khi thêm một sản phẩm vào shopping_cart với số lượng n thì bên product cũng sẽ phải trừ đi số lượng n
DELIMITER //

CREATE TRIGGER update_stock_on_cart_add
AFTER INSERT ON shopping_cart
FOR EACH ROW
BEGIN
    UPDATE products
    SET stock = stock - NEW.quantity
    WHERE id = NEW.product_id;
END;

//

DELIMITER ;
