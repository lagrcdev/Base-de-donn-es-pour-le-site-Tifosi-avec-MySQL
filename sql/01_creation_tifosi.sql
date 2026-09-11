-- creation de la base tifosi
-- projet bdd tifosi

CREATE DATABASE IF NOT EXISTS tifosi CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- utilisateur admin de la base
CREATE USER IF NOT EXISTS 'tifosi'@'localhost' IDENTIFIED BY 'tifosi';
CREATE USER IF NOT EXISTS 'tifosi'@'%' IDENTIFIED BY 'tifosi';
GRANT ALL PRIVILEGES ON tifosi.* TO 'tifosi'@'localhost';
GRANT ALL PRIVILEGES ON tifosi.* TO 'tifosi'@'%';
FLUSH PRIVILEGES;

USE tifosi;

-- table marque
CREATE TABLE marque (
  id_marque INT AUTO_INCREMENT PRIMARY KEY,
  nom_marque VARCHAR(45) NOT NULL
);

-- table ingredient
CREATE TABLE ingredient (
  id_ingredient INT AUTO_INCREMENT PRIMARY KEY,
  nom_ingredient VARCHAR(45) NOT NULL
);

-- table menu
CREATE TABLE menu (
  id_menu INT AUTO_INCREMENT PRIMARY KEY,
  nom_menu VARCHAR(45) NOT NULL,
  prix_menu FLOAT NOT NULL
);

-- table client
CREATE TABLE client (
  id_client INT AUTO_INCREMENT PRIMARY KEY,
  nom_client VARCHAR(45) NOT NULL,
  age INT NOT NULL,
  cp_client INT NOT NULL
);

-- une boisson appartient a une marque
CREATE TABLE boisson (
  id_boisson INT AUTO_INCREMENT PRIMARY KEY,
  nom_boisson VARCHAR(45) NOT NULL,
  id_marque INT NOT NULL,
  FOREIGN KEY (id_marque) REFERENCES marque(id_marque)
);

-- id_menu peut etre vide, on a pas de donnees de menu pour le TP
CREATE TABLE focaccia (
  id_focaccia INT AUTO_INCREMENT PRIMARY KEY,
  nom_focaccia VARCHAR(45) NOT NULL,
  prix_focaccia FLOAT NOT NULL,
  id_menu INT NULL,
  FOREIGN KEY (id_menu) REFERENCES menu(id_menu)
);

-- table de liaison entre focaccia et ingredient
CREATE TABLE focaccia_ingredient (
  id_focaccia INT NOT NULL,
  id_ingredient INT NOT NULL,
  PRIMARY KEY (id_focaccia, id_ingredient),
  FOREIGN KEY (id_focaccia) REFERENCES focaccia(id_focaccia),
  FOREIGN KEY (id_ingredient) REFERENCES ingredient(id_ingredient)
);

-- table de liaison entre menu et boisson
CREATE TABLE menu_boisson (
  id_menu INT NOT NULL,
  id_boisson INT NOT NULL,
  PRIMARY KEY (id_menu, id_boisson),
  FOREIGN KEY (id_menu) REFERENCES menu(id_menu),
  FOREIGN KEY (id_boisson) REFERENCES boisson(id_boisson)
);

-- un client achete une focaccia un jour donne
CREATE TABLE achete (
  id_achete INT AUTO_INCREMENT PRIMARY KEY,
  id_client INT NOT NULL,
  id_focaccia INT NOT NULL,
  jour DATE NOT NULL,
  FOREIGN KEY (id_client) REFERENCES client(id_client),
  FOREIGN KEY (id_focaccia) REFERENCES focaccia(id_focaccia)
);

-- un client paye un menu un jour donne
CREATE TABLE paye (
  id_paye INT AUTO_INCREMENT PRIMARY KEY,
  id_client INT NOT NULL,
  id_menu INT NOT NULL,
  jour DATE NOT NULL,
  FOREIGN KEY (id_client) REFERENCES client(id_client),
  FOREIGN KEY (id_menu) REFERENCES menu(id_menu)
);
