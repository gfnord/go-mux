CREATE DATABASE go-mux-db;

USE go-mux-db;

CREATE TABLE products
(
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    price DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    PRIMARY KEY (id)
);
