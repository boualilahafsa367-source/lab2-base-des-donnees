CREATE TABLE auteur (
  id   INT AUTO_INCREMENT PRIMARY KEY,
  nom  VARCHAR(100) NOT NULL
) ENGINE=InnoDB;
CREATE TABLE ouvrage (
  id          INT AUTO_INCREMENT PRIMARY KEY,
  titre       VARCHAR(200) NOT NULL,
  disponible  BOOLEAN NOT NULL DEFAULT TRUE,
  auteur_id   INT NOT NULL,
  CONSTRAINT fk_ouvrage_auteur
    FOREIGN KEY (auteur_id)
    REFERENCES auteur(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE=InnoDB;
CREATE TABLE abonne (
  id    INT AUTO_INCREMENT PRIMARY KEY,
  nom   VARCHAR(100) NOT NULL,
  email VARCHAR(150) NOT NULL UNIQUE
) ENGINE=InnoDB;
CREATE TABLE emprunt (
  id          INT AUTO_INCREMENT PRIMARY KEY,
  ouvrage_id  INT NOT NULL,
  abonne_id   INT NOT NULL,
  date_debut  TIMESTAMP  NOT NULL DEFAULT CURRENT_TIMESTAMP,
  date_fin    DATE,
  CONSTRAINT fk_emprunt_ouvrage
    FOREIGN KEY (ouvrage_id)
    REFERENCES ouvrage(id)
    ON DELETE RESTRICT,
  CONSTRAINT fk_emprunt_abonne
    FOREIGN KEY (abonne_id)
    REFERENCES abonne(id)
    ON DELETE CASCADE,
  CONSTRAINT ck_date_emprunt
    CHECK (date_fin IS NULL OR date_fin >= date_debut)
) ENGINE=InnoDB;
ALTER TABLE ouvrage ADD INDEX (disponible);
ALTER TABLE emprunt ADD INDEX (date_fin);
USE bibliotheque;
SHOW TABLES;
INSERT INTO auteur (id, nom) VALUES
  ('2', 'lina'),
  ('3', 'Mounir');
  
 SELECT * FROM auteur; 
 INSERT INTO ouvrage (id, titre, disponible, auteur_id) VALUES
  ('4', 'june', '1', '2'),
  ('5', 'la pluie', '0', '3');
  SELECT * FROM ouvrage;
  INSERT INTO abonne (id, nom, email) VALUES
  ('6', 'Hamza', 'Hamza@example.com'),
  ('7', 'ahmed', 'ahmed@example.com');
   SELECT * FROM abonne;
   SELECT * FROM emprunt;
INSERT INTO emprunt (id, ouvrage_id, abonne_id, date_debut, date_fin) VALUES 
('40', '22', '30', '2025-12-04', '2025-12-10' );
INSERT INTO emprunt (id, ouvrage_id, abonne_id, date_debut, date_fin) VALUES 
('40', '20', '30', '2025-12-04', '2025-12-01' );
DELETE FROM auteur WHERE id = 10;
 
 



