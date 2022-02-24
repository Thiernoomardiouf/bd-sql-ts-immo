============ CREATION DES TABLES ============
// 1-CREATION DE LA TABLE administrateur
CREATE TABLE `administrateur`
(
    `id_administrateur` INT NOT NULL AUTO_INCREMENT,
    `nom` VARCHAR(65) NOT NULL,
    `prenom` VARCHAR(65) NOT NULL,
    `telephone` INT NOT NULL,
    `cni` VARCHAR(65) NOT NULL,
    `adresse` VARCHAR(65) NOT NULL,
    `civilite` VARCHAR(65) NOT NULL,
    `date_de_naissance` DATE NOT NULL,
    `id_user_creer` INT NOT NULL,
    `id_user_compte` INT NOT NULL,
    `id_quartier` INT NOT NULL,
    PRIMARY KEY(`id_administrateur`),
    FOREIGN KEY(`id_user_creer`) REFERENCES `administrateur`(`id_administrateur`) ON DELETE CASCADE,
    FOREIGN KEY(`id_user_compte`) REFERENCES `user_compte`(`id_user_compte`) ON DELETE CASCADE,
    FOREIGN KEY(`id_quartier`) REFERENCES `quartier`(`id_quartier`) ON DELETE CASCADE
);

// 2-CREATION DE LA TABLE user_compte

CREATE TABLE `user_compte`
(
    `id_user_compte` INT NOT NULL AUTO_INCREMENT,
    `e-mail` VARCHAR(65) NOT NULL,
    `mot_de_passe` VARCHAR(65) NOT NULL,
    `etat_compte` BOOLEAN,
    `date_creation_compte` DATE NOT NULL,
    `date_fermeture_compte` DATE NOT NULL,
    PRIMARY KEY(`id_user_compte`)
);

// 3-CREATION DE LA TABLE pays

CREATE TABLE `pays`
(
    `id_pays` INT NOT NULL AUTO_INCREMENT,
    `libelle_pays` VARCHAR(65) NOT NULL,
    `indicatif_pays` VARCHAR(65) NOT NULL,
    `continent_pays` VARCHAR(65) NOT NULL,
    PRIMARY KEY(`id_pays`) 
);

// 4-CREATION DE LA TABLE region

CREATE TABLE `region`
(
    `id_region` INT NOT NULL AUTO_INCREMENT,
    `libelle_region` VARCHAR(65) NOT NULL,
    `id_pays` INT NOT NULL,
    PRIMARY KEY(`id_region`),
    FOREIGN KEY(`id_pays`) REFERENCES `pays`(`id_pays`) ON DELETE CASCADE
);

// 5-CREATION DE LA TABLE commune

CREATE TABLE `commune`
(
    `id_commune` INT NOT NULL AUTO_INCREMENT,
    `libelle_commune` VARCHAR(65) NOT NULL,
    `id_region` INT NOT NULL,
    PRIMARY KEY(`id_commune`),
    FOREIGN KEY(`id_region`) REFERENCES `region`(`id_region`) ON DELETE CASCADE 
);
// 5-CREATION DE LA TABLE quartier

CREATE TABLE `quartier`
(
    `id_quartier` INT NOT NULL AUTO_INCREMENT,
    `libelle_quartier` VARCHAR(65) NOT NULL,
    `id_commune` INT NOT NULL,
    PRIMARY KEY(`id_quartier`),
    FOREIGN KEY(`id_commune`) REFERENCES `commune`(`id_commune`) ON DELETE CASCADE 
 
);

// 6-CREATION DE LA TABLE role

CREATE TABLE `role`
(
    `id_role` INT NOT NULL AUTO_INCREMENT,
    `libelle_role` VARCHAR(65) NOT NULL,
    `id_user_compte` INT NOT NULL,
    PRIMARY KEY(`id_role`),
    FOREIGN KEY(`id_user_compte`) REFERENCES `user_compte`(`id_user_compte`) ON DELETE CASCADE
);

// 7-CREATION DE LA TABLE permission
CREATE TABLE `permission`
(
    `id_permission` INT NOT NULL AUTO_INCREMENT,
    `libelle_permission` VARCHAR(65) NOT NULL,
    `description_permission` VARCHAR(65) NOT NULL,
    PRIMARY KEY(`id_permission`) 
);

// 8-CREATION DE LA TABLE role_permission

CREATE TABLE `role_permission`
(
    `id_role_permission` INT NOT NULL AUTO_INCREMENT,
    `id_role` INT NOT NULL,
    `id_permission` INT NOT NULL,
    PRIMARY KEY(`id_role_permission`),
    FOREIGN KEY(`id_role`) REFERENCES `role`(`id_role`) ON DELETE CASCADE,
    FOREIGN KEY(`id_permission`) REFERENCES `permission`(`id_permission`) ON DELETE CASCADE
    PRIMARY KEY(`id_role_permission`) 
);









