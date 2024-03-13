CREATE DATABASE cinema;

USE cinema;

CREATE TABLE cinema (
    Id_cinema INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Nom VARCHAR(100) NOT NULL,
    Adresse VARCHAR(100) NOT NULL
);

CREATE TABLE utilisateur (
    Id_utilisateur INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Nom VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    Mdp VARCHAR(100) NOT NULL,
    Role VARCHAR(100) NOT NULL,
    Id_cinema INT NULL
);

ALTER TABLE utilisateur ADD FOREIGN KEY (Id_cinema) REFERENCES cinema(Id_cinema);

CREATE TABLE salle (
    Id_salle INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Nom VARCHAR(100) NOT NULL,
    Capacite INT NOT NULL,
    Id_cinema INT NOT NULL
);

ALTER TABLE salle ADD FOREIGN KEY (Id_cinema) REFERENCES cinema(Id_cinema);

CREATE table seance (
    Id_seance INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Date DATE NOT NULL,
    Heure TIME NOT NULL,
    Id_film INT NOT NULL,
    Id_salle INT NOT NULL
);

ALTER TABLE seance ADD FOREIGN KEY (Id_film) REFERENCES film(Id_film);
ALTER TABLE seance ADD FOREIGN KEY (Id_salle) REFERENCES salle(Id_salle);

CREATE TABLE film (
    Id_film INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Titre VARCHAR(100) NOT NULL,
    Duree INT NOT NULL,
    Categorie VARCHAR(100) NOT NULL
);

CREATE TABLE reservation (
    Id_reservation INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Nb_places INT NOT NULL,
    Id_seance INT NOT NULL,
    Id_tarif INT NOT NULL
);

ALTER TABLE reservation ADD FOREIGN KEY (Id_seance) REFERENCES seance(Id_seance);
ALTER TABLE reservation ADD FOREIGN KEY (Id_tarif) REFERENCES tarif(Id_tarif);

CREATE TABLE tarif (
    Id_tarif INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Description VARCHAR(255) NOT NULL,
    Prix INT NOT NULL
);

CREATE TABLE numticket (
    Id_numticket INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Code_barre VARCHAR(255) NOT NULL,
    Utilise BOOLEAN NOT NULL,
    Id_reservation INT NOT NULL
);

ALTER TABLE numticket ADD FOREIGN KEY (Id_reservation) REFERENCES reservation(Id_reservation);

CREATE TABLE gerer_cinema (
    Id_utilisateur INT NOT NULL,
    Id_cinema INT NOT NULL
);

ALTER TABLE gerer_cinema ADD FOREIGN KEY (Id_utilisateur) REFERENCES utilisateur(Id_utilisateur);
ALTER TABLE gerer_cinema ADD FOREIGN KEY (Id_cinema) REFERENCES cinema(Id_cinema);


INSERT INTO cinema (Nom, Adresse) VALUES
('Cinéma Paradiso', '123 rue de la Paix, 75007 Paris'),
('Le Grand Rex', '1 bd Poissonnière, 75002 Paris'),
('Cinéma de l\'Odéon', '29 rue de l\'Ancienne Comédie, 75006 Paris');

INSERT INTO utilisateur (Nom, Email, Mdp, Role, Id_cinema) VALUES
('John Doe', 'john.doe@email.com', 'johnssecurepassword', 'administrateur', NULL),
('Jane Smith', 'jane.smith@email.com', 'janessecurepassword', 'gestionnaire', 1),
('Bob Brown', 'bob.brown@email.com', 'bobssecurepassword', 'gestionnaire', 2),
('Alice Green', 'alice.green@email.com', 'alicessecurepassword', 'vendeur', NULL);

INSERT INTO salle (Nom, Capacite, Id_cinema) VALUES
('Salle 1', 150, 1),
('Salle 2', 200, 1),
('Salle 1', 120, 2),
('Salle 1', 100, 3),
('Salle 2', 80, 3);

INSERT INTO film (Titre, Duree, Categorie) VALUES
('L\'Odyssée de l\'espace', 149, 'Science-fiction'),
('Le Parrain', 175, 'Drame'),
('Inception', 148, 'Science-fiction'),
('Interstellar', 169, 'Science-fiction');

INSERT INTO seance (Date, Heure, Id_film, Id_salle) VALUES
('2024-03-15', '18:00:00', 1, 1),
('2024-03-15', '21:00:00', 2, 1),
('2024-03-16', '17:00:00', 3, 2),
('2024-03-16', '20:00:00', 4, 2);

INSERT INTO tarif (Description, Prix) VALUES
('Plein tarif', 9.20),
('Tarif étudiant', 7.60),
('Moins de 14 ans', 5.90);

INSERT INTO reservation (Nb_places, Id_seance, Id_tarif) VALUES
(3, 1, 1),
(2, 1, 2),
(1, 2, 3),
(4, 3, 1),
(2, 4, 2);

INSERT INTO numticket (Code_barre, Utilise, Id_reservation) VALUES
('ABCD1234', FALSE, 1),
('EFGH5678', FALSE, 2),
('IJKL9012', TRUE, 3),
('MNOP3456', FALSE, 4),
('QRST7890', TRUE, 5);

INSERT INTO gerer_cinema (Id_utilisateur, Id_cinema) VALUES
(2, 1),
(3, 2),
(3, 3),
(4, 1);

