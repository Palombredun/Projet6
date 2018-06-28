# Création de la BDD :
CREATE DATABASE OCPizza CHARACTER SET 'utf8';
USE OCPizza;


CREATE TABLE Boisson (
                id_boisson SMALLINT UNSIGNED NOT NULL,
                nom_boisson VARCHAR(40) NOT NULL,
                description TEXT,
                prix_unitaire DECIMAL(4,2) NOT NULL,
                taux_TVA_100 DECIMAL(4,2) NOT NULL,
                PRIMARY KEY (id_boisson)
)ENGINE=INNODB;

CREATE TABLE Adresse (
                id_adresse INT UNSIGNED NOT NULL,
                id_possesseur INT UNSIGNED NOT NULL,
                voie VARCHAR(100) NOT NULL,
                complement_construction VARCHAR(100),
                complement_localisation VARCHAR(100),
                code_postal CHAR(5) NOT NULL,
                localite VARCHAR(40) NOT NULL,
                PRIMARY KEY (id_adresse)
)ENGINE=INNODB;

CREATE TABLE Client (
                id_client INT UNSIGNED NOT NULL AUTO_INCREMENT,
                mot_de_passe VARCHAR(20) NOT NULL,
                nom VARCHAR(40) NOT NULL,
                prenom VARCHAR(40) NOT NULL,
                adresse_mail VARCHAR(60) NOT NULL,
                telephone CHAR(10) NOT NULL,
                id_adresse_client INT UNSIGNED NOT NULL,
                PRIMARY KEY (id_client)
)ENGINE=INNODB;

CREATE TABLE Restaurant (
                id_restaurant SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
                nom_restaurant VARCHAR(30) NOT NULL,
                horaire_ouverture TIME NOT NULL,
                horaire_fermeture TIME NOT NULL,
                id_adresse INT UNSIGNED NOT NULL,
                PRIMARY KEY (id_restaurant)
)ENGINE=INNODB;

CREATE TABLE Gerant (
                id_gerant SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
                mot_de_passe VARCHAR(40) NOT NULL,
                nom VARCHAR(40) NOT NULL,
                prenom VARCHAR(40) NOT NULL,
                id_restaurant SMALLINT UNSIGNED NOT NULL,
                PRIMARY KEY (id_gerant)
)ENGINE=INNODB;

CREATE TABLE Cuisinier (
                id_cuisinier SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
                nom VARCHAR(40) NOT NULL,
                prenom VARCHAR(40) NOT NULL,
                id_restaurant SMALLINT UNSIGNED NOT NULL,
                statut VARCHAR(20),
                PRIMARY KEY (id_cuisinier)
)ENGINE=INNODB;

CREATE TABLE Livreur (
                id_livreur SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
                nom VARCHAR(40) NOT NULL,
                prenom VARCHAR(40) NOT NULL,
                id_restaurant_1 SMALLINT UNSIGNED NOT NULL,
                id_restaurant_2 SMALLINT UNSIGNED,
                statut VARCHAR(30),
                PRIMARY KEY (id_livreur)
)ENGINE=INNODB;

CREATE TABLE Stock (
                id_ingredient SMALLINT UNSIGNED NOT NULL,
                id_restaurant SMALLINT UNSIGNED NOT NULL,
                nom_produit VARCHAR(100) NOT NULL,
                quantite DECIMAL(5,2) NOT NULL,
                alerte_quantite DECIMAL(5,2) NOT NULL,
                unite CHAR(2) NOT NULL,
                date_limite DATE NOT NULL,
                PRIMARY KEY (id_ingredient, id_restaurant)
)ENGINE=INNODB;

CREATE TABLE Recette (
                id_ingredient SMALLINT UNSIGNED NOT NULL,
                id_pizza SMALLINT UNSIGNED NOT NULL,
                quantite DECIMAL(5,2) NOT NULL,
                unite CHAR(2) NOT NULL,
                PRIMARY KEY (id_pizza, id_ingredient)
)ENGINE=INNODB;


CREATE TABLE Pizza (
                id_pizza SMALLINT UNSIGNED AUTO_INCREMENT NOT NULL,
                nom_pizza VARCHAR(200) NOT NULL,
                description TEXT NOT NULL,
                prix_unitaire DECIMAL(4,2) NOT NULL,
                taux_TVA_100 DECIMAL (4,2) NOT NULL,
                PRIMARY KEY (id_pizza)
)ENGINE=INNODB;



CREATE TABLE Commande (
                id_commande SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
                id_pizza SMALLINT UNSIGNED,
                nb_pizza SMALLINT UNSIGNED NOT NULL,
                id_boisson SMALLINT UNSIGNED,
                nb_boisson SMALLINT UNSIGNED NOT NULL,
                date_commande DATETIME NOT NULL,
                id_client INT UNSIGNED NOT NULL,
                type_paiement CHAR(1) NOT NULL,
                etat_commande CHAR(2) NOT NULL,
                id_restaurant SMALLINT UNSIGNED NOT NULL,
                PRIMARY KEY (id_commande, id_client, date_commande)
)ENGINE=INNODB;



ALTER TABLE Restaurant ADD CONSTRAINT adresse_restaurant_fk
FOREIGN KEY (id_adresse)
        REFERENCES Adresse (id_adresse)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION;

ALTER TABLE Client ADD CONSTRAINT adresse_client_fk
FOREIGN KEY (id_adresse_client)
        REFERENCES Adresse (id_adresse)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION;

ALTER TABLE Commande ADD CONSTRAINT client_commande_fk
FOREIGN KEY (id_client)
        REFERENCES Client (id_client)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION;

ALTER TABLE Commande ADD CONSTRAINT restaurant_commande_fk
FOREIGN KEY (id_restaurant)
        REFERENCES Restaurant (id_restaurant)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION;

ALTER TABLE Stock ADD CONSTRAINT restaurant_stock_fk
FOREIGN KEY (id_restaurant)
        REFERENCES Restaurant (id_restaurant)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION;

ALTER TABLE Livreur ADD CONSTRAINT restaurant_1_livreur_fk
FOREIGN KEY (id_restaurant_1)
        REFERENCES Restaurant (id_restaurant)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION;

ALTER TABLE Livreur ADD CONSTRAINT restaurant_2_livreur_fk
FOREIGN KEY (id_restaurant_2)
        REFERENCES Restaurant (id_restaurant)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION;

ALTER TABLE Cuisinier ADD CONSTRAINT restaurant_cuisinier_fk
FOREIGN KEY (id_restaurant)
        REFERENCES Restaurant (id_restaurant)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION;

ALTER TABLE Gerant ADD CONSTRAINT restaurant_gerant_fk
FOREIGN KEY (id_restaurant)
        REFERENCES Restaurant (id_restaurant)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION;

ALTER TABLE Recette ADD CONSTRAINT stock_recette_fk
FOREIGN KEY (id_ingredient)
        REFERENCES Stock (id_ingredient)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION;

ALTER TABLE Recette ADD CONSTRAINT pizza_recette_fk
FOREIGN KEY (id_pizza)
        REFERENCES Pizza (id_pizza)
        ON DELETE NO ACTION;
        ON UPDATE NO ACTION;

ALTER TABLE Commande ADD CONSTRAINT boisson_commande_fk
FOREIGN KEY (id_boisson)
        REFERENCES Boisson (id_boisson)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION;

ALTER TABLE Commande ADD CONSTRAINT pizza_commande_fk
FOREIGN KEY (id_pizza)
        REFERENCES Pizza (id_pizza)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION;