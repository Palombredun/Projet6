#Insertion données

USE OCPizza;

INSERT INTO Boisson (id_boisson, nom_boisson, description, prix_unitaire, taux_TVA_100)
VALUES (100, 'évian', 'bouteille de 500 ml', 2.5, 19.6),
	   (101, 'breizh cola', 'bouteille de 250 ml', 5.0, 19.6),
	   (102, 'schewpps', 'scwhepps agrume de 250 ml', 6.0, 19.6),
	   (103, 'san pellegrino', 'bouteille de 500 ml', 5.0, 19.6);

INSERT INTO Adresse (id_adresse, id_possesseur, voie, complement_construction, 
					complement_localisation, code_postal, localite)
VALUES (1, 2 ,'15 rue des martyrs', NULL, NULL, '75009', 'Paris'),
	   (2, 1, '8 rue de Rennes', NULL, NULL, '75006', 'Paris'),
	   (3, 3, '23 rue Cotrel', NULL, NULL, '33000', 'Bordeaux'),
	   # adresses clients :
	   (100, 1, '22 rue Commine', 'Bâtiment B', 'Etage 4, appartement 403', '75010', 'Paris'),
	   (101, 2, '38 avenue Malherbes', NULL, NULL, '75019', 'Paris'),
	   (102, 3, '52 rue Mouffetard', NULL, NULL, '75001', 'Paris'),
	   (103, 4, '44 boulevard Saint Anne', NULL, 'RDC 020', '33000', 'Bordeaux'),
	   (104, 5, '52 rue saint george', NULL, NULL, '75015', 'Paris'),
	   (105, 6, '5, rue du passage', NULL, NULL, '75001', 'Paris'),
	   (106, 7, '12 boulevard de Rennes', NULL, 'Etage 2, appartement 203', '75005', 'Paris'),
	   (107, 8, '15 place de la libération', NULL, 'Etage 3 appartement 318', '33000', 'Bordeaux'),
	   (108, 9, "72 avenue de l'orangerie", NULL, NULL, '33000', 'Bordeaux'),
	   (109, 10, '21 rue du bout du manoir', NULL, NULL, '75016', 'Paris');

INSERT INTO Restaurant (nom_restaurant, horaire_ouverture, horaire_fermeture, id_adresse)
VALUES ('OCPizza Paris Sud', '11:00:00', '23:59:59', 1),
	   ('OCPizza Paris Nord', '11:00:00', '23:59:59', 2),
	   ('OCPizza Bordeaux', '11:00:00', '23:59:59', 3);

INSERT INTO Pizza (nom_pizza, description, prix_unitaire, taux_TVA_100)
VALUES ('Pizza Margherita', "Pizza à la tomate, mozarella et basilic", 12.0, 19.6),
	   ('Pizza Regina', "Pizza au jambon blanc et champignons", 13.0, 19.6),
	   ('Pizza Napoli', "Pizza aux anchois, olives et mozarella", 12.0, 19.6),
	   ('Pizza Bianca', "Pâte à pizzas, huile d'olive et basilic", 9.0, 19.6);

INSERT INTO Gerant (mot_de_passe, nom, prenom, id_restaurant)
VALUES ("Cheval15Piscine", 'Dupont', "Serge", 1),
	   ("ArboricoleMange18", 'Faucher', 'Morgane', 3),
	   ("TigreFibreMaison156", 'Annot', 'Lucille', 2);

INSERT INTO Cuisinier (nom, prenom, id_restaurant, statut)
VALUES ('Bapon', 'Mathieu', 1, 'Occupé'),
	   ('Piflou', 'Mathilde', 1, 'Libre'),
	   ('Hafleu', 'Benjamin', 2, NULL),
	   ('Jugnat', 'Sébastien', 2, 'Libre'),
	   ('Manileve', 'Léa', 2, 'Occupé'),
	   ('Vincont', 'Sarah', 3, NULL),
	   ('Pesquot', 'Thomas', 3, 'Occupé');

INSERT INTO Livreur (nom, prenom, id_restaurant_1, id_restaurant_2, statut)
VALUES ('Joubert', 'Louis', 1, 2, 'Libre'),
	   ('Sanchez', 'Pierre', 2, NULL, 'En cours de livraison'),
	   ('Roussel', 'Lauriane', 3, NULL, 'Jour de repos'),
	   ('Lenoir', 'Juliette', 1, NULL, 'Libre'),
	   ('Roche', 'Jules', 3, NULL, 'Libre');

INSERT INTO Client (mot_de_passe, nom, prenom, adresse_mail, telephone, id_adresse_client)
VALUES ('TenorEsprit50', 'Rolland', 'Frédéric', 'frederic.r@mail.com', '0102030405', 100),
	   ('ProfondeurBurger38' ,'Pereira', 'Nicolas', 'n.pereira@mail.fr', '0105040302', 101),
	   ('VolerIvoire42' ,'Aubert', 'Véronique', 'veronique.aubert@mail.fr', '0302010405', 102),
	   ('BossuCimetière15' ,'Petitjean', 'Alexandra', 'a.petitjean@mail.fr', '0305040301', 103),
	   ('ReseauDeviner86' ,'Duval', 'Jeanne', 'jeanne.duval@mail.org', '0102030504', 104),
	   ('FonctionPole98' ,'Bertin', 'Christophe', 'c.bertin@mail.org', '0104020305', 105),
	   ('RicheMagie54' ,'Vialat', 'Hugo', 'h.vialat@mail.fr', '0302010405', 106),
	   ('QuinzeNoir46' ,'Ramos', 'Christine', 'christine.r@mail.org', '0301020504', 107),
	   ('TonneAumone63' ,'Mallet', 'Patrick', 'p.mallet@mail.com', '0305040201', 108),
	   ('PruneTraction71' ,'Giraud', 'Laura', 'laura.giraud@mail.org', '0103020405', 109);


INSERT INTO Stock (id_ingredient, nom_produit, quantite, alerte_quantite, unite, 
					date_limite, id_restaurant, prix_unitaire, taux_TVA_100)
VALUES (1, 'farine', 22.50, 5.00, 'kg', '2019-09-28', 1),
	   (2, 'Pate à pizza', 12.5, 2.0, 'kg', '2018-07-10', 1),
	   (3, 'tomate', 7.30, 1.00, 'kg', '2018-07-01', 1),
	   (4, 'basilic', 0.250, 0.100, 'kg', '2018-07-01', 1),
	   (5, 'mozarella', 2.25, 0.500, 'kg', '2018-08-01', 1),
	   (6, 'jambon blanc', 0.850, 0.500, 'kg', '2018-07-15', 1),
	   (7, 'olives', 2.500, 1.00, 'kg', '2018-10-01', 1),
	   (8, 'anchois', 550, 100, 'g', '2019-03-01', 1),
	   (9, 'pecorino sardo', 2.200, 1.00, 'kg', '2018-11-16', 1),
	   (10, "huile d'olive", 20.0, 5.0, 'L', '2019-12-31', 1),
	   (11, "champignons", 950, 500, 'g', '2018-07-15', 1);



INSERT INTO Recette (id_pizza, id_ingredient, nom_ingredient, quantite, unite)
VALUES (1, 2, "pâte à pizza", 250.0, 'g'),
       (1, 3, "tomate", 50.0, 'g'),
       (1, 5, "mozarella", 100.0, 'g'),
       (1, 4, "basilic", 5.0, 'g'),
       (1, 10, "huile d'olive", 15, 'ml'),

       (2, 2, "pâte à pizza", 250.0, 'g'),
       (2, 3, "tomate", 75.0, 'g'),
       (2, 6, "jambon blanc", 100.0, 'g'),
       (2, 11, "champignons", 60.0, 'g'),

       (3, 2, "pâte à pizza", 250.0, 'g'),
       (3, 3, "tomate", 100.0, 'g'),
       (3, 5, "mozarella", 100.0, 'g'),
       (3, 7, "olives", 50.0, 'g'),
       (3, 8, "anchois", 20.0, 'g'),

       (4, 2, "pâte à pizza", 250.0, 'g'),
       (4, 10, "huile d'olive", 20.0, 'ml'),
       (4, 4, "basilic", 5.0, 'g');

	    (1, 'Pizza Margherita', 12.0, 19.6, 'pizza'),
	    (2, 'Pizza Regina', 13.0, 19.6, 'pizza'),
	    (3, 'Pizza Napoli', 12.0, 19.6, 'pizza'),
	    (4, 'Pizza Bianca' 9.0, 19.6, 'pizza');

INSERT INTO Commande (id_commande, id_client, date_commande, id_pizza, nb_pizza,
					  id_boisson, nb_boisson,type_paiement, etat_commande, id_restaurant)
VALUES (1, 1, '2018-06-28 19:30:02', 1, 1, 101, 1, 'L', 'EA', 1),
	   (2, 1, '2018-06-28 19:30:02', 3, 1, 103, 2, 'L', 'EA', 1),

	   (4, 5, '2018-05-22 22:07:06', 2, 1, 1001, 0, 'S', 'A', 3),

	   (5, 2, '2018-08-03 20:46:36', 2, 1, 1001, 0, 'S', 'CL', 2),
	   (7, 2, '2018-08-03 20:46:36', 4, 1, 1001, 0, 'S', 'CL', 2),
	   (8, 2, '2018-08-03 20:46:36', 3, 1, 1001, 0, 'S', 'CL', 2),
	   (9, 2, '2018-08-03 20:46:36', 1, 1, 1001, 0, 'S', 'CL', 2),

	   (10, 3, '2018-08-04 20:12:08', 1, 1, 101, 2, 'S', 'CP', 3),
	   (11, 3, '2018-08-04 20:12:08', 2, 2, 104, 1, 'S', 'CP', 3),

	   (14, 8, '2018-08-06 20:35:34', 4, 1, 1001, 0, 'L', 'F', 2);