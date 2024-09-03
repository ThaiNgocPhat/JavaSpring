create database Baitap2;
use Baitap2;

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

-- Tạo Transaction khi thêm sản phẩm vào giỏ hàng thì kiểm tra xem stock của products có đủ số lượng không nếu không thì rollback

START TRANSACTION;
SET @user_id = 1;
SET @product_id = 1;
SET @quantity = 3;
SET @available_stock = (SELECT stock FROM products WHERE id = @product_id);
UPDATE products
SET stock = stock - @quantity
WHERE id = @product_id
AND stock >= @quantity;
-- Thêm sản phẩm vào giỏ hàng
INSERT INTO shopping_cart (user_id, product_id, quantity, amount)
VALUES (@user_id, @product_id, @quantity, (SELECT price FROM products WHERE id = @product_id) * @quantity);
COMMIT;




-- Tạo Transaction khi xóa sản phẩm trong giỏ hàng thì trả lại số lượng cho products
START TRANSACTION;
SET @cart_item_id = 1;
SELECT product_id, quantity INTO @product_id, @quantity FROM shopping_cart WHERE id = @cart_item_id;
DELETE FROM shopping_cart WHERE id = @cart_item_id;
UPDATE products SET stock = stock + @quantity WHERE id = @product_id;
COMMIT;


