create database greenguizmos;
use greenguizmos;

CREATE TABLE Products(
   product_id INT,
   product_name VARCHAR(50),
   product_price DECIMAL(15,2),
   product_description TEXT,
   PRIMARY KEY(product_id)
);
CREATE TABLE Categories(
   category_name VARCHAR(50),
   PRIMARY KEY(category_name)
);
CREATE TABLE Belongs_to(
   product_id INT,
   category_name VARCHAR(50),
   PRIMARY KEY(product_id, category_name),
   FOREIGN KEY(product_id) REFERENCES Products(product_id),
   FOREIGN KEY(category_name) REFERENCES Categories(category_name)
);

CREATE TABLE users (
  user_id INT PRIMARY KEY AUTO_INCREMENT,
  username VARCHAR(255) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  email VARCHAR(255) UNIQUE NOT NULL,
  role ENUM('admin', 'user', 'guest') DEFAULT 'guest'
);


INSERT INTO Categories (category_name)
VALUES 
('Laptops'),('Desktops'),('Workstations'),('Mini PCs / Thin Clients'),('All-in-One PCs'),('Processors (CPUs)'),('RAM (Memory Modules)'),('Storage Devices'),('SSDs'),
('HDDs'),('NVMe Drives'),('Graphic Cards (GPUs)'),('Motherboards'),('Power Supplies'),('Cooling Fans / Heatsinks'),('LED / LCD Monitors'),('Touchscreen Monitors'),
('Monitor Stands / Mounts / Arms'),('Docking Stations'),('Keyboards (wired/wireless)'),('Mice (wired/wireless)'),('Headsets & Headphones'),('Webcams'),('Speakers'),
('External Drives (HDDs, SSDs)'),('USB Hubs / Extenders'),('Laser Printers'),('Inkjet Printers'),('Multifunction Printers (MFPs)'),('Scanners'),('Label Printers'),
('Toner / Ink (refurbished or compatible)'),('Tablets'),('Mobile Phones'),('Laptop Bags / Cases'),('Portable Monitors'),('Portable Chargers / Power Banks'),
('Computing Equipment'),('Components & Upgrades'),('Monitors & Display Equipment'),('Peripherals & Accessories'),('Printing & Scanning'),('Mobile & Remote Work Gear');

INSERT INTO Products (product_id, product_name, product_price, product_description)
VALUES 
(1, 'Dell Latitude', 1200.00, 'High-performance business laptop'),
(2, 'HP EliteBook', 1100.00, 'Durable and efficient business laptop'),
(3, 'Lenovo ThinkPad', 1300.00, 'Reliable laptop for professionals'),
(4, 'Dell OptiPlex', 900.00, 'Compact desktop for office use'),
(5, 'HP ProDesk', 850.00, 'Powerful and efficient desktop'),
(6, 'Lenovo ThinkCentre', 1000.00, 'Business-class desktop'),
(7, 'Dell Precision', 2500.00, 'High-end workstation for professionals'),
(8, 'HP Z Workstations', 2600.00, 'Professional-grade workstation'),
(9, 'Intel NUC', 750.00, 'Mini PC compact et performant'),
(10, 'HP Thin Client', 650.00, 'Solution compacte pour le travail en réseau'),
(11, 'Apple iMac', 2000.00, 'Ordinateur tout-en-un haut de gamme'),
(12, 'Dell Inspiron AIO', 1200.00, 'PC tout-en-un avec écran intégré'),
(13, 'Intel Core i7', 350.00, 'Processeur haute performance pour PC de bureau'),
(14, 'AMD Ryzen 7', 320.00, 'Processeur multi-cœurs pour gaming et productivité'),
(15, 'Corsair Vengeance LPX 16GB', 85.00, 'Mémoire DDR4 haute vitesse'),
(16, 'Kingston HyperX Fury 8GB', 45.00, 'Module RAM performant'),
(17, 'Samsung 870 EVO SSD 1TB', 110.00, 'Disque SSD rapide et fiable'),
(18, 'Seagate Barracuda HDD 2TB', 60.00, 'Disque dur pour le stockage de données'),
(19, 'Western Digital WD Black NVMe SSD 1TB', 140.00, 'SSD ultra-rapide avec performances exceptionnelles'),
(20, 'Crucial P3 Plus 500GB', 65.00, 'SSD abordable et performant'),
(21, 'Toshiba P300 1TB HDD', 45.00, 'Disque dur performant pour stockage de données'),
(22, 'WD Blue 2TB HDD', 70.00, 'Disque dur fiable pour usage quotidien'),
(23, 'Samsung 980 Pro 1TB NVMe', 150.00, 'SSD NVMe ultra-rapide pour gamers et professionnels'),
(24, 'Kingston KC3000 512GB NVMe', 100.00, 'SSD NVMe haute performance et fiable'),
(25, 'NVIDIA GeForce RTX 3060', 400.00, 'Carte graphique de milieu de gamme pour le gaming'),
(26, 'AMD Radeon RX 6700 XT', 450.00, 'Carte graphique puissante pour les créatifs et gamers'),
(27, 'ASUS ROG Strix B550-F', 180.00, 'Carte mère haute performance pour AMD Ryzen'),
(28, 'MSI MPG Z590', 200.00, 'Carte mère compatible avec processeurs Intel'),
(29, 'Corsair RM750x', 120.00, 'Bloc d\'alimentation 750W avec certification 80+ Gold'),
(30, 'EVGA 600 W1', 50.00, 'Bloc d\'alimentation économique et fiable'),
(31, 'Noctua NH-D15', 90.00, 'Ventirad silencieux et performant pour processeurs'),
(32, 'Cooler Master Hyper 212', 40.00, 'Refroidisseur efficace et abordable'),
(33, 'Dell UltraSharp U2723QE', 500.00, 'Moniteur LCD 4K avec haute fidélité des couleurs'),
(34, 'ASUS VG248QG', 250.00, 'Écran LED 144Hz conçu pour le gaming'),
(35, 'Microsoft Surface Studio Screen', 800.00, 'Écran tactile premium pour la productivité'),
(36, 'Dell P2418HT', 350.00, 'Écran tactile ergonomique pour usage professionnel'),
(37, 'VIVO Dual Monitor Desk Mount', 90.00, 'Support réglable pour deux moniteurs'),
(38, 'Ergotron LX Desk Arm', 150.00, 'Bras articulé robuste pour moniteurs'),
(39, 'CalDigit TS4 Thunderbolt Dock', 400.00, 'Station d\'accueil haut de gamme avec multiples ports'),
(40, 'Anker PowerExpand Docking Station', 150.00, 'Station compacte et multifonctions'),
(41, 'Logitech MX Keys', 100.00, 'Clavier sans fil ergonomique et rétroéclairé'),
(42, 'Razer BlackWidow V3', 140.00, 'Clavier mécanique conçu pour les gamers'),
(43, 'Logitech MX Master 3', 90.00, 'Souris sans fil avec précision avancée'),
(44, 'Razer DeathAdder V2', 70.00, 'Souris filaire rapide et ergonomique'),
(45, 'Sony WH-1000XM4', 350.00, 'Casque sans fil avec réduction de bruit'),
(46, 'HyperX Cloud II', 100.00, 'Casque gamer confortable avec micro'),
(47, 'Logitech C920 HD Pro', 80.00, 'Webcam Full HD 1080p'),
(48, 'Razer Kiyo', 100.00, 'Webcam avec anneau lumineux intégré'),
(49, 'Bose Companion 2 Series III', 150.00, 'Haut-parleurs de bureau de haute qualité'),
(50, 'Logitech Z407', 100.00, 'Enceintes Bluetooth avec basses puissantes'),
(51, 'Seagate Expansion 2TB', 70.00, 'Disque dur externe portable'),
(52, 'SanDisk Extreme SSD 1TB', 120.00, 'SSD externe avec vitesse ultra-rapide'),
(53, 'Anker 4-Port USB Hub', 20.00, 'Hub USB compact et efficace'),
(54, 'Sabrent USB 3.0 Hub', 30.00, 'Hub avec 7 ports et vitesse rapide'),
(55, 'Brother HL-L2350DW', 150.00, 'Imprimante laser rapide et compacte'),
(56, 'HP LaserJet Pro M404dw', 300.00, 'Imprimante laser haut de gamme pour bureaux'),
(57, 'Canon PIXMA TS6220', 120.00, 'Imprimante jet d\'encre multifonctions'),
(58, 'Epson EcoTank ET-2720', 200.00, 'Imprimante jet d\'encre économique'),
(59, 'HP OfficeJet Pro 9015', 250.00, 'Imprimante multifonction pour bureaux'),
(60, 'Brother MFC-J995DW', 180.00, 'Imprimante tout-en-un économique'),
(61, 'Epson Perfection V600', 300.00, 'Scanner photo haute qualité'),
(62, 'Canon CanoScan LiDE 300', 100.00, 'Scanner compact et rapide'),
(63, 'Brother QL-800', 120.00, 'Imprimante d\'étiquettes professionnelle'),
(64, 'DYMO LabelWriter 450', 150.00, 'Imprimante pour étiquettes rapide et efficace'),
(65, 'HP 61 Ink Cartridge (Black)', 25.00, 'Cartouche d\'encre compatible pour imprimantes HP'),
(66, 'Brother TN660 Toner Cartridge', 50.00, 'Toner reconditionné pour imprimantes laser Brother'),
(67, 'Apple iPad Pro', 1000.00, 'Tablette haut de gamme avec écran Retina'),
(68, 'Samsung Galaxy Tab S8', 850.00, 'Tablette Android performante et polyvalente'),
(69, 'iPhone 13 (refurbished)', 700.00, 'Smartphone reconditionné avec écran Retina'),
(70, 'Samsung Galaxy S21 (refurbished)', 600.00, 'Smartphone Android reconditionné'),
(71, 'Samsonite Tectonic Lifestyle Backpack', 120.00, 'Sac à dos robuste pour ordinateurs portables'),
(72, 'Thule Subterra Sleeve', 50.00, 'Étui protecteur pour ordinateur portable'),
(73, 'ASUS ZenScreen MB16AC', 250.00, 'Écran portable léger et polyvalent'),
(74, 'Lenovo ThinkVision M14', 220.00, 'Moniteur portable pour une productivité accrue'),
(75, 'Anker PowerCore 26800mAh', 80.00, 'Batterie externe haute capacité'),
(76, 'RAVPower 20000mAh', 60.00, 'Chargeur portable rapide et compact');

INSERT INTO Belongs_to (product_id, category_name)
VALUES 
(1, 'Laptops'),(2, 'Laptops'),(3, 'Laptops'),(4, 'Desktops'),(5, 'Desktops'),(6, 'Desktops'),(7, 'Workstations'),(8, 'Workstations'),
(9, 'Mini PCs / Thin Clients'),(10, 'Mini PCs / Thin Clients'),(11, 'All-in-One PCs'),(12, 'All-in-One PCs'),(13, 'Processors (CPUs)'),(14, 'Processors (CPUs)'),
(15, 'RAM (Memory Modules)'),(16, 'RAM (Memory Modules)'),(17, 'Storage Devices'),(18, 'Storage Devices'),(19, 'SSDs'),(20, 'SSDs'),(21, 'HDDs'),(22, 'HDDs'),
(23, 'NVMe Drives'),(24, 'NVMe Drives'),(25, 'Graphic Cards (GPUs)'),(26, 'Graphic Cards (GPUs)'),(27, 'Motherboards'),(28, 'Motherboards'),
(29, 'Power Supplies'),(30, 'Power Supplies'),(31, 'Cooling Fans / Heatsinks'),(32, 'Cooling Fans / Heatsinks'),(33, 'LED / LCD Monitors'),(34, 'LED / LCD Monitors'),
(35, 'Touchscreen Monitors'),(36, 'Touchscreen Monitors'),(37, 'Monitor Stands / Mounts / Arms'),(38, 'Monitor Stands / Mounts / Arms'),
(39, 'Docking Stations'),(40, 'Docking Stations'),(41, 'Keyboards (wired/wireless)'),(42, 'Keyboards (wired/wireless)'),
(43, 'Mice (wired/wireless)'),(44, 'Mice (wired/wireless)'),(45, 'Headsets & Headphones'),(46, 'Headsets & Headphones'),(47, 'Webcams'),(48, 'Webcams'),
(49, 'Speakers'),(50, 'Speakers'),(51, 'External Drives (HDDs, SSDs)'),(52, 'External Drives (HDDs, SSDs)'),(53, 'USB Hubs / Extenders'),(54, 'USB Hubs / Extenders'),
(55, 'Laser Printers'),(56, 'Laser Printers'),(57, 'Inkjet Printers'),(58, 'Inkjet Printers'),(59, 'Multifunction Printers (MFPs)'),(60, 'Multifunction Printers (MFPs)'),
(61, 'Scanners'),(62, 'Scanners'),(63, 'Label Printers'),(64, 'Label Printers'),(65, 'Toner / Ink (refurbished or compatible)'),(66, 'Toner / Ink (refurbished or compatible)'),
(67, 'Tablets'),(68, 'Tablets'),(69, 'Mobile Phones'),(70, 'Mobile Phones'),(71, 'Laptop Bags / Cases'),(72, 'Laptop Bags / Cases'),
(73, 'Portable Monitors'),(74, 'Portable Monitors'),(75, 'Portable Chargers / Power Banks'),(76, 'Portable Chargers / Power Banks');
-- Association des produits aux catégories dans la table Belongs_to
INSERT INTO Belongs_to (product_id, category_name)
VALUES
(1, 'Computing Equipment'),(2, 'Computing Equipment'),(3, 'Computing Equipment'),(4, 'Computing Equipment'),(5, 'Computing Equipment'),(6, 'Computing Equipment'),(7, 'Computing Equipment'),
(8, 'Computing Equipment'),(9, 'Computing Equipment'),(10, 'Computing Equipment'),(11, 'Computing Equipment'),(12, 'Computing Equipment'),(13, 'Components & Upgrades'),
(14, 'Components & Upgrades'),(15, 'Components & Upgrades'),(16, 'Components & Upgrades'),(17, 'Components & Upgrades'),(18, 'Components & Upgrades'),(19, 'Components & Upgrades'),
(20, 'Components & Upgrades'),(21, 'Components & Upgrades'),(22, 'Components & Upgrades'),(23, 'Components & Upgrades'),(24, 'Components & Upgrades'),(25, 'Components & Upgrades'),
(26, 'Components & Upgrades'),(27, 'Components & Upgrades'),(28, 'Components & Upgrades'),(29, 'Components & Upgrades'),(30, 'Components & Upgrades'),(31, 'Components & Upgrades'),
(32, 'Components & Upgrades'),(33, 'Monitors & Display Equipment'),(34, 'Monitors & Display Equipment'),(35, 'Monitors & Display Equipment'),(36, 'Monitors & Display Equipment'),
(37, 'Monitors & Display Equipment'),(38, 'Monitors & Display Equipment'),(39, 'Peripherals & Accessories'),(40, 'Peripherals & Accessories'),(41, 'Peripherals & Accessories'),
(42, 'Peripherals & Accessories'),(43, 'Peripherals & Accessories'),(44, 'Peripherals & Accessories'),(45, 'Peripherals & Accessories'),(46, 'Peripherals & Accessories'),
(47, 'Peripherals & Accessories'),(48, 'Peripherals & Accessories'),(49, 'Peripherals & Accessories'),(50, 'Peripherals & Accessories'),(51, 'Printing & Scanning'),(52, 'Printing & Scanning'),
(53, 'Printing & Scanning'),(54, 'Printing & Scanning'),(55, 'Printing & Scanning'),(56, 'Printing & Scanning'),(57, 'Printing & Scanning'),(58, 'Printing & Scanning'),
(59, 'Printing & Scanning'),(60, 'Printing & Scanning'),(61, 'Printing & Scanning'),(62, 'Printing & Scanning'),(63, 'Printing & Scanning'),(64, 'Printing & Scanning'),
(65, 'Printing & Scanning'),(66, 'Printing & Scanning'),(67, 'Mobile & Remote Work Gear'),(68, 'Mobile & Remote Work Gear'),(69, 'Mobile & Remote Work Gear'),
(70, 'Mobile & Remote Work Gear'),(71, 'Mobile & Remote Work Gear'),(72, 'Mobile & Remote Work Gear'),(73, 'Mobile & Remote Work Gear'),(74, 'Mobile & Remote Work Gear'),
(75, 'Mobile & Remote Work Gear'),(76, 'Mobile & Remote Work Gear');
