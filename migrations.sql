CREATE DATABASE IF NOT EXISTS ecommerce;

USE ecommerce;

CREATE TABLE IF NOT EXISTS admins (
id INT AUTO_INCREMENT PRIMARY KEY,
email VARCHAR(255) NOT NULL,
password VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS `products` (
`id` int(10) NOT NULL AUTO_INCREMENT,
`name` varchar(250) NOT NULL,
`price` double(9,2) NOT NULL,
`description` varchar(300) NOT NULL,
`image` varchar(250) NOT NULL,
`quantity` int NOT NULL DEFAULT 0,
PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO admins (email, password)
SELECT * FROM (SELECT 'admin@admin.com', SHA2('admin123', 256)) AS tmp
WHERE NOT EXISTS (
    SELECT email FROM admins WHERE email = 'admin@admin.com'
) LIMIT 1;

INSERT INTO `products` (`name`, `price`, `description`, `image`, `quantity`) VALUES
('Tent', 99.99, 'Spacious and durable tent for outdoor adventures.', 'https://m.media-amazon.com/images/I/81DaQhY+yRL._AC_SX679_.jpg', 4),
('Sleeping Bag', 49.99, 'Comfortable and warm sleeping bag for a good night sleep.', 'https://m.media-amazon.com/images/I/81Bdu+QykCL._AC_UY218_.jpg', 5),
('Camp Stove', 39.99, 'Portable stove for cooking delicious meals while camping.', 'https://m.media-amazon.com/images/I/712ge5uUQCL._AC_UY218_.jpg', 4),
('Folding Chair', 29.99, 'Compact and lightweight chair for relaxing by the campfire.', 'https://m.media-amazon.com/images/I/71zoT4xLAEL._AC_UL320_.jpg', 4),
('Cooler', 79.99, 'Insulated cooler to keep food and drinks cold during outdoor trips.', 'https://m.media-amazon.com/images/I/71ZhvfATjrL._AC_UL320_.jpg', 4),
('Hiking Backpack', 89.99, 'Sturdy backpack with ample storage space for hiking and backpacking.', 'https://m.media-amazon.com/images/I/81siwI2UxEL._AC_UL320_.jpg', 4),
('Camp Lantern', 19.99, 'Portable lantern for brightening up your camping nights.', 'https://m.media-amazon.com/images/I/71Yp-wLIAdL._AC_UL320_.jpg', 4),
('Portable Grill', 59.99, 'Compact and efficient grill for enjoying tasty barbecues outdoors.', 'https://m.media-amazon.com/images/I/61ahabO14gL._AC_UY218_.jpg', 4),
('Camp Table', 49.99, 'Collapsible table for convenient dining and activities in the great outdoors.', 'https://m.media-amazon.com/images/I/71kFBfvq1VL._AC_UL320_.jpg', 4),
('Air Mattress', 69.99, 'Comfortable air mattress for a restful sleep while camping.', 'https://m.media-amazon.com/images/I/71WGsXRgQrL._AC_UY218_.jpg', 4);

CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name` varchar(30) NOT NULL,
  `surname` varchar(30) NOT NULL,
  `address` varchar(40) NOT NULL,
  `email` varchar(50) NOT NULL,
  `total` double(9,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS `ordered_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `order_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  FOREIGN KEY (`item_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
