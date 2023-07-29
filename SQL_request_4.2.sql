CREATE DATABASE IF NOT EXISTS db;

USE db;

CREATE TABLE IF NOT EXISTS shops
(
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  address VARCHAR(100) NOT NULL
);
  
CREATE TABLE IF NOT EXISTS products
(
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,  
  price INT NOT NULL,
  count INT NOT NULL
);

CREATE TABLE IF NOT EXISTS clients 
(
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  phone VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS ord
(
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, 
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, 
  customer INT NOT NULL,
  seller INT NOT NULL,
  FOREIGN KEY (customer)  REFERENCES clients(`id`),
  FOREIGN KEY (seller)  REFERENCES shops(`id`)
);

CREATE TABLE IF NOT EXISTS order_product
(
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  order_id INT,
  product INT,
  product_price INT,
  FOREIGN KEY (order_id)  REFERENCES ord(`id`),
  FOREIGN KEY (product)  REFERENCES products(`id`)
);

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

INSERT INTO ord (customer, seller) VALUES (1, 5);
INSERT INTO ord (customer, seller) VALUES (2, 4);
INSERT INTO ord (customer, seller) VALUES (3, 3);
INSERT INTO ord (customer, seller) VALUES (4, 2);
INSERT INTO ord (customer, seller) VALUES (5, 1);

INSERT INTO order_product (order_id, product) VALUES (1, 4);
INSERT INTO order_product (order_id, product) VALUES (2, 4);
INSERT INTO order_product (order_id, product) VALUES (3, 3);
INSERT INTO order_product (order_id, product) VALUES (4, 4);
INSERT INTO order_product (order_id, product) VALUES (5, 4);