drop database if exists greenguizmos ;
create database greenguizmos;
use greenguizmos;

CREATE TABLE Products (
   product_id INT AUTO_INCREMENT,
   product_name VARCHAR(50),
   product_price DECIMAL(15,2),
   product_description TEXT,
   img_url text,
   PRIMARY KEY (product_id)
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
  registration_date DATE NOT NULL,
  role ENUM('admin', 'user', 'guest') DEFAULT 'guest'
);

CREATE TABLE Cart (
   cart_id INT PRIMARY KEY AUTO_INCREMENT,
   user_id INT,
   product_id INT,
   quantity INT,
   added_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
   status ENUM('active', 'completed', 'cancelled') DEFAULT 'active',
   FOREIGN KEY(user_id) REFERENCES users(user_id),
   FOREIGN KEY(product_id) REFERENCES Products(product_id)
);

INSERT INTO Categories (category_name)
VALUES 
('Laptops'),('Desktops'),('Workstations'),('Mini PCs / Thin Clients'),('All-in-One PCs'),('Processors (CPUs)'),('RAM (Memory Modules)'),('Storage Devices'),('SSDs'),
('HDDs'),('NVMe Drives'),('Graphic Cards (GPUs)'),('Motherboards'),('Power Supplies'),('Cooling Fans / Heatsinks'),('LED / LCD Monitors'),('Touchscreen Monitors'),
('Monitor Stands / Mounts / Arms'),('Docking Stations'),('Keyboards (wired/wireless)'),('Mice (wired/wireless)'),('Headsets & Headphones'),('Webcams'),('Speakers'),
('External Drives (HDDs, SSDs)'),('USB Hubs / Extenders'),('Laser Printers'),('Inkjet Printers'),('Multifunction Printers (MFPs)'),('Scanners'),('Label Printers'),
('Toner / Ink (refurbished or compatible)'),('Tablets'),('Mobile Phones'),('Laptop Bags / Cases'),('Portable Monitors'),('Portable Chargers / Power Banks'),
('Computing Equipment'),('Components & Upgrades'),('Monitors & Display Equipment'),('Peripherals & Accessories'),('Printing & Scanning'),('Mobile & Remote Work Gear');

INSERT INTO Products (product_id, product_name, product_price, product_description, img_url)
VALUES 
(1, 'Dell Latitude', 1200.00, 'High-performance business laptop','https://res.cloudinary.com/dvnylhnro/image/upload/v1745414395/dell-latitude-e5490-i5-8350u-1663567421_dfbeo7.jpg'),
(2, 'HP EliteBook', 1100.00, 'Durable and efficient business laptop','https://res.cloudinary.com/dvnylhnro/image/upload/v1745414552/hp_elitebook_745_g6_1_v2j5jz.jpg'),
(3, 'Lenovo ThinkPad', 1300.00, 'Reliable laptop for professionals','https://res.cloudinary.com/dvnylhnro/image/upload/v1745414603/d03kqdwmcdhm5jlrd503v93y0hv72n243294_id1nla.png'),
(4, 'Dell OptiPlex', 900.00, 'Compact desktop for office use','https://res.cloudinary.com/dvnylhnro/image/upload/v1745414664/images_fmttza.jpg'),
(5, 'HP ProDesk', 850.00, 'Powerful and efficient desktop','https://res.cloudinary.com/dvnylhnro/image/upload/v1745414684/hp-prodesk-400-g5-mini-celeron-g4930t_n0q23f.jpg'),
(6, 'Lenovo ThinkCentre', 1000.00, 'Business-class desktop','https://res.cloudinary.com/dvnylhnro/image/upload/v1745414694/enfin-libre-lenovo-thinkcentre-m700-linux_jsfpxa.jpg'),
(7, 'Dell Precision', 2500.00, 'High-end workstation for professionals','https://res.cloudinary.com/dvnylhnro/image/upload/v1745414704/dell-precision-5550-10850h-1650345920_avzpqn.jpg'),
(8, 'HP Z Workstations', 2600.00, 'Professional-grade workstation','https://res.cloudinary.com/dvnylhnro/image/upload/v1745414726/i-06-HP-Z6-min_ftm82y.png'),
(9, 'Intel NUC', 750.00, 'Mini PC compact et performant','https://res.cloudinary.com/dvnylhnro/image/upload/v1745414736/618MO3IuJ5L._AC_UF1000_1000_QL80__nupk2x.jpg'),
(10, 'HP Thin Client', 650.00, 'Solution compacte pour le travail en réseau','https://res.cloudinary.com/dvnylhnro/image/upload/v1745414744/1980658784_ML_o4xiss.jpg'),
(11, 'Apple iMac', 2000.00, 'Ordinateur tout-en-un haut de gamme','https://res.cloudinary.com/dvnylhnro/image/upload/v1745414750/images_d8wpea.jpg'),
(12, 'Dell Inspiron AIO', 1200.00, 'PC tout-en-un avec écran intégré','https://res.cloudinary.com/dvnylhnro/image/upload/v1745414761/images_hqeubk.jpg'),
(13, 'Intel Core i7', 350.00, 'Processeur haute performance pour PC de bureau','https://res.cloudinary.com/dvnylhnro/image/upload/v1745414788/1549-intel-core-i7-14700kf-34-56ghz-box_bdy7ax.jpg'),
(14, 'AMD Ryzen 7', 320.00, 'Processeur multi-cœurs pour gaming et productivité','https://res.cloudinary.com/dvnylhnro/image/upload/v1745414804/51smqWKarCL_fbi0u2.jpg'),
(15, 'Corsair Vengeance LPX 16GB', 85.00, 'Mémoire DDR4 haute vitesse','https://res.cloudinary.com/dvnylhnro/image/upload/v1745414817/b8de0df7-5db5-4b99-bc09-88ebd92ef693_cx2ula.jpg'),
(16, 'Kingston HyperX Fury 8GB', 45.00, 'Module RAM performant','https://res.cloudinary.com/dvnylhnro/image/upload/v1745414827/ram-8GB-DDR4-3200MHZ-CL16-DIMM-FURY-black_rlr2hv.jpg'),
(17, 'Samsung 870 EVO SSD 1TB', 110.00, 'Disque SSD rapide et fiable','https://res.cloudinary.com/dvnylhnro/image/upload/v1745414837/41GLhBB3OxL_jpgus0.jpg'),
(18, 'Seagate Barracuda HDD 2TB', 60.00, 'Disque dur pour le stockage de données','https://res.cloudinary.com/dvnylhnro/image/upload/v1745524156/71icCF9jHLS._AC_SX679__pwrlfv.jpg'),
(19, 'Western Digital WD Black NVMe SSD 1TB', 140.00, 'SSD ultra-rapide avec performances exceptionnelles','https://res.cloudinary.com/dvnylhnro/image/upload/v1745524258/71Sr1zjPhwL._AC_SX425__lhh7iq.jpg'),
(20, 'Crucial P3 Plus 500GB', 65.00, 'SSD abordable et performant','https://res.cloudinary.com/dvnylhnro/image/upload/v1745524316/51pMg25AthL.__AC_SX300_SY300_QL70_ML2__bw7oxc.jpg'),
(21, 'Toshiba P300 1TB HDD', 45.00, 'Disque dur performant pour stockage de données','https://res.cloudinary.com/dvnylhnro/image/upload/v1745524346/51PNnhi2l9L.__AC_SX300_SY300_QL70_ML2__fipgdq.jpg'),
(22, 'WD Blue 2TB HDD', 70.00, 'Disque dur fiable pour usage quotidien','https://res.cloudinary.com/dvnylhnro/image/upload/v1745524394/71pzrrdIS2L.__AC_SX300_SY300_QL70_ML2__qhemjj.jpg'),
(23, 'Samsung 980 Pro 1TB NVMe', 150.00, 'SSD NVMe ultra-rapide pour gamers et professionnels','https://res.cloudinary.com/dvnylhnro/image/upload/v1745524432/71ikzPLbeSL.__AC_SY300_SX300_QL70_ML2__hgwfms.jpg'),
(24, 'Kingston KC3000 512GB NVMe', 100.00, 'SSD NVMe haute performance et fiable','https://res.cloudinary.com/dvnylhnro/image/upload/v1745524492/41aHQ45H5rL._AC_SX425__ucbtih.jpg'),
(25, 'NVIDIA GeForce RTX 3060', 400.00, 'Carte graphique de milieu de gamme pour le gaming','https://res.cloudinary.com/dvnylhnro/image/upload/v1745524558/71tduSp8ooL._AC_SX679__j1c7mn.jpg'),
(26, 'AMD Radeon RX 6700 XT', 450.00, 'Carte graphique puissante pour les créatifs et gamers','https://res.cloudinary.com/dvnylhnro/image/upload/v1745524608/610Y8PIpPyL.__AC_SX300_SY300_QL70_ML2__xla93d.jpg'),
(27, 'ASUS ROG Strix B550-F', 180.00, 'Carte mère haute performance pour AMD Ryzen','https://res.cloudinary.com/dvnylhnro/image/upload/v1745524645/71i-AhjINuL.__AC_SX300_SY300_QL70_ML2__pney0r.jpg'),
(28, 'MSI MPG Z590', 200.00, 'Carte mère compatible avec processeurs Intel','https://res.cloudinary.com/dvnylhnro/image/upload/v1745524674/61Z1j_r1HIS._AC_SX300_SY300__lqyiuo.jpg'),
(29, 'Corsair RM750x', 120.00, 'Bloc d\'alimentation 750W avec certification 80+ Gold','https://res.cloudinary.com/dvnylhnro/image/upload/v1745524721/61tOgJ849GL.__AC_SY300_SX300_QL70_ML2__cvrv8d.jpg'),
(30, 'EVGA 700 W1', 50.00, 'Bloc d\'alimentation économique et fiable','https://res.cloudinary.com/dvnylhnro/image/upload/v1745524784/71qEtfr-nsL.__AC_SX300_SY300_QL70_ML2__vfcvvh.jpg'),
(31, 'Noctua NH-D15', 90.00, 'Ventirad silencieux et performant pour processeurs','https://res.cloudinary.com/dvnylhnro/image/upload/v1745524812/91t48GBv8TL.__AC_SY300_SX300_QL70_ML2__xsxdsa.jpg'),
(32, 'Cooler Master Hyper 212', 40.00, 'Refroidisseur efficace et abordable','https://res.cloudinary.com/dvnylhnro/image/upload/v1745524846/81roOgnoW0L.__AC_SX300_SY300_QL70_ML2__wayq0z.jpg'),
(33, 'Dell UltraSharp U2723QE', 500.00, 'Moniteur LCD 4K avec haute fidélité des couleurs','https://res.cloudinary.com/dvnylhnro/image/upload/v1745524881/61ijE-prqQL.__AC_SX300_SY300_QL70_ML2__kooarm.jpg'),
(34, 'ASUS VG248QG', 250.00, 'Écran LED 144Hz conçu pour le gaming','https://res.cloudinary.com/dvnylhnro/image/upload/v1745524910/7196wk8hqyL.__AC_SY300_SX300_QL70_ML2__mhxam3.jpg'),
(35, 'Microsoft Surface Studio Screen', 800.00, 'Écran tactile premium pour la productivité','https://res.cloudinary.com/dvnylhnro/image/upload/v1745525013/OS9hbkJu_nzphmn.jpg'),
(36, 'Dell P2418HT', 350.00, 'Écran tactile ergonomique pour usage professionnel','https://res.cloudinary.com/dvnylhnro/image/upload/v1745488242/shopping_uy2cub.webp'),
(37, 'VIVO Dual Monitor Desk Mount', 90.00, 'Support réglable pour deux moniteurs','https://res.cloudinary.com/dvnylhnro/image/upload/v1745488290/shopping_efmy9m.webp'),
(38, 'Ergotron LX Desk Arm', 150.00, 'Bras articulé robuste pour moniteurs','https://res.cloudinary.com/dvnylhnro/image/upload/v1745488335/shopping_k6o9mm.webp'),
(39, 'CalDigit TS4 Thunderbolt Dock', 400.00, 'Station d\'accueil haut de gamme avec multiples ports','https://res.cloudinary.com/dvnylhnro/image/upload/v1745488370/shopping_zamylv.webp'),
(40, 'Anker PowerExpand Docking Station', 150.00, 'Station compacte et multifonctions','https://res.cloudinary.com/dvnylhnro/image/upload/v1745488512/dfjcha8chji4jn6garsj.jpg'),
(41, 'Logitech MX Keys', 100.00, 'Clavier sans fil ergonomique et rétroéclairé','https://res.cloudinary.com/dvnylhnro/image/upload/v1745488547/shopping_j9jhyz.webp'),
(42, 'Razer BlackWidow V3', 140.00, 'Clavier mécanique conçu pour les gamers','https://res.cloudinary.com/dvnylhnro/image/upload/v1745488605/shopping_ko7kdq.webp'),
(43, 'Logitech MX Master 3', 90.00, 'Souris sans fil avec précision avancée','https://res.cloudinary.com/dvnylhnro/image/upload/v1745488633/shopping_ahy0b4.webp'),
(44, 'Razer DeathAdder V2', 70.00, 'Souris filaire rapide et ergonomique','https://res.cloudinary.com/dvnylhnro/image/upload/v1745488681/shopping_kluyle.webp'),
(45, 'Sony WH-1000XM4', 350.00, 'Casque sans fil avec réduction de bruit','https://res.cloudinary.com/dvnylhnro/image/upload/v1745488717/shopping_goylzl.webp'),
(46, 'HyperX Cloud II', 100.00, 'Casque gamer confortable avec micro','https://res.cloudinary.com/dvnylhnro/image/upload/v1745488743/shopping_d6awbi.webp'),
(47, 'Logitech C920 HD Pro', 80.00, 'Webcam Full HD 1080p','https://res.cloudinary.com/dvnylhnro/image/upload/v1745488771/shopping_mttkhy.webp'),
(48, 'Razer Kiyo', 100.00, 'Webcam avec anneau lumineux intégré','https://res.cloudinary.com/dvnylhnro/image/upload/v1745488804/shopping_oq1teg.webp'),
(49, 'Bose Companion 2 Series III', 150.00, 'Haut-parleurs de bureau de haute qualité','https://res.cloudinary.com/dvnylhnro/image/upload/v1745488841/shopping_tgxmcd.webp'),
(50, 'Logitech Z407', 100.00, 'Enceintes Bluetooth avec basses puissantes','https://res.cloudinary.com/dvnylhnro/image/upload/v1745488873/shopping_hzoaka.webp'),
(51, 'Seagate Expansion 2TB', 70.00, 'Disque dur externe portable','https://res.cloudinary.com/dvnylhnro/image/upload/v1745488898/shopping_lzyaw7.webp'),
(52, 'SanDisk Extreme SSD 1TB', 120.00, 'SSD externe avec vitesse ultra-rapide','https://res.cloudinary.com/dvnylhnro/image/upload/v1745488932/shopping_vjebte.webp'),
(53, 'Anker 4-Port USB Hub', 20.00, 'Hub USB compact et efficace','https://res.cloudinary.com/dvnylhnro/image/upload/v1745488954/shopping_gel2xq.webp'),
(54, 'Sabrent USB 3.0 Hub', 30.00, 'Hub avec 7 ports et vitesse rapide','https://res.cloudinary.com/dvnylhnro/image/upload/v1745494783/agd6xnghflxnshipwibq.jpg'),
(55, 'Brother HL-L2350DW', 150.00, 'Imprimante laser rapide et compacte','https://res.cloudinary.com/dvnylhnro/image/upload/v1745494826/ac5907bd779347209df911d0f2a8e07d_gxx9lu.png'),
(56, 'HP LaserJet Pro M404dw', 300.00, 'Imprimante laser haut de gamme pour bureaux','https://res.cloudinary.com/dvnylhnro/image/upload/v1745494860/71NjVqNcojL_f8cljj.jpg'),
(57, 'Canon PIXMA TS6220', 120.00, 'Imprimante jet d\'encre multifonctions','https://res.cloudinary.com/dvnylhnro/image/upload/v1745494885/wu8yl78vwfaafxgvxqpb.jpg'),
(58, 'Epson EcoTank ET-2720', 200.00, 'Imprimante jet d\'encre économique','https://res.cloudinary.com/dvnylhnro/image/upload/v1745494929/g8hpo2x37jfme54m8pmo.jpg'),
(59, 'HP OfficeJet Pro 9015', 250.00, 'Imprimante multifonction pour bureaux','https://res.cloudinary.com/dvnylhnro/image/upload/v1745494953/mupg4olrq5nlgvohanfc.jpg'),
(60, 'Brother MFC-J995DW', 180.00, 'Imprimante tout-en-un économique','https://res.cloudinary.com/dvnylhnro/image/upload/v1745495008/yjmdspipgkzrsqikq4jk.jpg'),
(61, 'Epson Perfection V600', 300.00, 'Scanner photo haute qualité','https://res.cloudinary.com/dvnylhnro/image/upload/v1745495035/fv3ovgnbheibk5ggnywf.jpg'),
(62, 'Canon CanoScan LiDE 300', 100.00, 'Scanner compact et rapide','https://res.cloudinary.com/dvnylhnro/image/upload/v1745495063/evfizwowgvt1l65thait.jpg'),
(63, 'Brother QL-800', 120.00, 'Imprimante d\'étiquettes professionnelle','https://res.cloudinary.com/dvnylhnro/image/upload/v1745495091/kksy5ywq0jq8rtlxhgdt.jpg'),
(64, 'DYMO LabelWriter 450', 150.00, 'Imprimante pour étiquettes rapide et efficace','https://res.cloudinary.com/dvnylhnro/image/upload/v1745495144/ppc2rtqx73rwzjgapdjs.jpg'),
(65, 'HP 61 Ink Cartridge (Black)', 25.00, 'Cartouche d\'encre compatible pour imprimantes HP','https://res.cloudinary.com/dvnylhnro/image/upload/v1745495166/ba3uostmwluffqkulcu4.jpg'),
(66, 'Brother TN660 Toner Cartridge', 50.00, 'Toner reconditionné pour imprimantes laser Brother','https://res.cloudinary.com/dvnylhnro/image/upload/v1745495192/cwvtpxjocgil7owqdtbg.jpg'),
(67, 'Apple iPad Pro', 1000.00, 'Tablette haut de gamme avec écran Retina','https://res.cloudinary.com/dvnylhnro/image/upload/v1745495241/oewudtwzfhyjztpoahjx.jpg'),
(68, 'Samsung Galaxy Tab S8', 850.00, 'Tablette Android performante et polyvalente','https://res.cloudinary.com/dvnylhnro/image/upload/v1745495264/z7zdtc4noy6czzcxtfia.jpg'),
(69, 'iPhone 13 (refurbished)', 700.00, 'Smartphone reconditionné avec écran Retina','https://res.cloudinary.com/dvnylhnro/image/upload/v1745495284/zlxwvzvzjthbbbuevbfg.jpg'),
(70, 'Samsung Galaxy S21 (refurbished)', 600.00, 'Smartphone Android reconditionné','https://res.cloudinary.com/dvnylhnro/image/upload/v1745495307/gljl4hq9rg9px9h6zy9x.jpg'),
(71, 'Samsonite Tectonic Lifestyle Backpack', 120.00, 'Sac à dos robuste pour ordinateurs portables','https://res.cloudinary.com/dvnylhnro/image/upload/v1745484575/s-l400_iu4duj.jpg'),
(72, 'Thule Subterra Sleeve', 50.00, 'Étui protecteur pour ordinateur portable','https://res.cloudinary.com/dvnylhnro/image/upload/v1745484624/1455161_hqnb4w.png'),
(73, 'ASUS ZenScreen MB16AC', 250.00, 'Écran portable léger et polyvalent','https://res.cloudinary.com/dvnylhnro/image/upload/v1745484669/ahTz2AP4zDVYrZH2_setting_xxx_0_90_end_800_dczdp7.png'),
(74, 'Lenovo ThinkVision M14', 220.00, 'Moniteur portable pour une productivité accrue','https://res.cloudinary.com/dvnylhnro/image/upload/v1745484717/opjtjw5onaywr5aect6k8thjofb872278749_nxz1sj.png'),
(75, 'Anker PowerCore 26800mAh', 80.00, 'Batterie externe haute capacité','https://res.cloudinary.com/dvnylhnro/image/upload/v1745484843/ACCUS2403090XD0QZF1_csqpyk.jpg'),
(76, 'RAVPower 20000mAh', 60.00, 'Chargeur portable rapide et compact','https://res.cloudinary.com/dvnylhnro/image/upload/v1745484883/s-l1200_hslm5m.jpg');
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
