CREATE DATABASE IF NOT EXISTS db1;

USE db1;

CREATE TABLE IF NOT EXISTS shop 
(
  name VARCHAR(100) PRIMARY KEY,
  address VARCHAR(100) NOT NULL
);
  
CREATE TABLE IF NOT EXISTS products
(
  name VARCHAR(100) PRIMARY KEY,  
  price INT NOT NULL,
  count INT NOT NULL
);

CREATE TABLE IF NOT EXISTS ord
(
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, 
  created_at TIMESTAMP NOT NULL, 
  customer VARCHAR(100) NOT NULL,
  seller VARCHAR(100) NOT NULL
);

ALTER TABLE `ord` CHANGE `created_at` `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP;

CREATE TABLE IF NOT EXISTS order_product
(
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  order_id INT,
  product_name VARCHAR(100), 
  product_price INT
);

CREATE TABLE IF NOT EXISTS client 
(
  name VARCHAR(100) PRIMARY KEY,
  phone VARCHAR(100) NOT NULL
);

ALTER TABLE `ord` ADD FOREIGN KEY (`seller`) REFERENCES `shop`(`name`) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE `ord` ADD FOREIGN KEY (`customer`) REFERENCES `client`(`name`) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE `order_product` ADD FOREIGN KEY (`order_id`) REFERENCES `ord`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `order_product` ADD FOREIGN KEY (`product_name`) REFERENCES `products`(`name`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `order_product` ADD FOREIGN KEY (`product_price`) REFERENCES `products`(`price`) ON DELETE RESTRICT ON UPDATE RESTRICT;

INSERT INTO shop (name, address) VALUES ("Пятерочка", "Красногорский бульвар, 24");
INSERT INTO shop (name, address) VALUES ("О'Кей", "Москва, Кремль");
INSERT INTO shop (name, address) VALUES ("Перекресток", "Славянка, 34");
INSERT INTO shop (name, address) VALUES ("Дикси", "Мясницкая, 2");
INSERT INTO shop (name, address) VALUES ("Пивной 1", "Норильск, 23");

INSERT INTO products (name, price, count) VALUES ("Огурец", 32, 22);
INSERT INTO products (name, price, count) VALUES ("Помидор", 68, 67);
INSERT INTO products (name, price, count) VALUES ("Кабачок", 180, 13);
INSERT INTO products (name, price, count) VALUES ("Пиво", 400, 100);
INSERT INTO products (name, price, count) VALUES ("ПК", 139000, 2);

INSERT INTO client (name, phone) VALUES ("Андрей", "+79651398858");
INSERT INTO client (name, phone) VALUES ("Иван", "+79038889988");
INSERT INTO client (name, phone) VALUES ("Алена", "+79651393465");
INSERT INTO client (name, phone) VALUES ("Любовь", "+79651397612");
INSERT INTO client (name, phone) VALUES ("Сергей", "+79651399811");

INSERT INTO ord (customer, seller) VALUES ("Андрей", "Пивной 1");
INSERT INTO ord (customer, seller) VALUES ("Иван", "Дикси");
INSERT INTO ord (customer, seller) VALUES ("Алена", "Перекресток");
INSERT INTO ord (customer, seller) VALUES ("Любовь", "О'Кей");
INSERT INTO ord (customer, seller) VALUES ("Сергей", "Пятерочка");

INSERT INTO order_product (order_id, product_name, product_price) VALUES (1, "Пиво", 400);
INSERT INTO order_product (order_id, product_name, product_price) VALUES (2, "Пиво", 400);
INSERT INTO order_product (order_id, product_name, product_price) VALUES (3, "Кабачок", 180);
INSERT INTO order_product (order_id, product_name, product_price) VALUES (4, "Пиво", 400);
INSERT INTO order_product (order_id, product_name, product_price) VALUES (5, "Пиво", 400);