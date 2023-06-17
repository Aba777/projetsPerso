-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : ven. 16 juin 2023 à 23:31
-- Version du serveur : 5.7.36
-- Version de PHP : 8.1.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `suguba`
--

-- --------------------------------------------------------

--
-- Structure de la table `categorieproduit`
--

CREATE TABLE `categorieproduit` (
  `idCategorie` int(10) NOT NULL,
  `nomCategorie` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `idClient` int(10) NOT NULL,
  `nomClient` varchar(50) DEFAULT NULL,
  `prenomClient` varchar(50) DEFAULT NULL,
  `emailClient` varchar(50) DEFAULT NULL,
  `adresseClient` varchar(50) DEFAULT NULL,
  `telephoneClient` int(10) DEFAULT NULL,
  `motDePasse` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE `commande` (
  `idCommande` int(10) NOT NULL,
  `dateCommande` date NOT NULL,
  `statutsCommande` varchar(30) NOT NULL,
  `idVendeur` int(10) NOT NULL,
  `idClient` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `contenir`
--

CREATE TABLE `contenir` (
  `idProduit` int(10) NOT NULL,
  `idCommande` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `evaluationetcommentaire`
--

CREATE TABLE `evaluationetcommentaire` (
  `idEvaluationCommentaire` int(10) NOT NULL,
  `note` text NOT NULL,
  `idClient` int(10) NOT NULL,
  `idProduit` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `paiement`
--

CREATE TABLE `paiement` (
  `idPaiement` int(10) NOT NULL,
  `datePaiement` date NOT NULL,
  `montantPaiement` int(20) NOT NULL,
  `type` varchar(50) NOT NULL,
  `idCommande` int(10) NOT NULL,
  `idClient` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `photo`
--

CREATE TABLE `photo` (
  `idphoto` int(10) NOT NULL,
  `nomphoto` varchar(30) NOT NULL,
  `fichier` longblob NOT NULL,
  `typefichier` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `produits`
--

CREATE TABLE `produits` (
  `idProduit` int(10) NOT NULL,
  `nomProduit` varchar(50) NOT NULL,
  `prixProduit` int(10) NOT NULL,
  `quantiteStock` int(10) NOT NULL,
  `description` text NOT NULL,
  `idphoto` int(10) NOT NULL,
  `idCategorie` int(10) NOT NULL,
  `idVendeur` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `promotionproduit`
--

CREATE TABLE `promotionproduit` (
  `idPomotion` int(10) NOT NULL,
  `dateDebut` date NOT NULL,
  `dateFin` date NOT NULL,
  `pourcentageReduction` float NOT NULL,
  `idProduit` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `vendeur`
--

CREATE TABLE `vendeur` (
  `idVendeur` int(10) NOT NULL,
  `nomVendeur` varchar(50) NOT NULL,
  `adresseVendeur` varchar(70) NOT NULL,
  `emailVendeur` varchar(50) NOT NULL,
  `telephoneVendeur` int(10) NOT NULL,
  `motDePasse` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `categorieproduit`
--
ALTER TABLE `categorieproduit`
  ADD PRIMARY KEY (`idCategorie`);

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`idClient`);

--
-- Index pour la table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`idCommande`),
  ADD KEY `idVendeur` (`idVendeur`,`idClient`),
  ADD KEY `idClient` (`idClient`);

--
-- Index pour la table `contenir`
--
ALTER TABLE `contenir`
  ADD KEY `idProduit` (`idProduit`,`idCommande`),
  ADD KEY `idCommande` (`idCommande`);

--
-- Index pour la table `evaluationetcommentaire`
--
ALTER TABLE `evaluationetcommentaire`
  ADD PRIMARY KEY (`idEvaluationCommentaire`),
  ADD KEY `idClient` (`idClient`,`idProduit`),
  ADD KEY `idProduit` (`idProduit`);

--
-- Index pour la table `paiement`
--
ALTER TABLE `paiement`
  ADD PRIMARY KEY (`idPaiement`),
  ADD KEY `idCommande` (`idCommande`),
  ADD KEY `idClient` (`idClient`);

--
-- Index pour la table `photo`
--
ALTER TABLE `photo`
  ADD PRIMARY KEY (`idphoto`);

--
-- Index pour la table `produits`
--
ALTER TABLE `produits`
  ADD PRIMARY KEY (`idProduit`),
  ADD KEY `idphoto` (`idphoto`,`idCategorie`,`idVendeur`),
  ADD KEY `idVendeur` (`idVendeur`),
  ADD KEY `idCategorie` (`idCategorie`);

--
-- Index pour la table `promotionproduit`
--
ALTER TABLE `promotionproduit`
  ADD PRIMARY KEY (`idPomotion`),
  ADD KEY `idProduit` (`idProduit`);

--
-- Index pour la table `vendeur`
--
ALTER TABLE `vendeur`
  ADD PRIMARY KEY (`idVendeur`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `categorieproduit`
--
ALTER TABLE `categorieproduit`
  MODIFY `idCategorie` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `idClient` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `commande`
--
ALTER TABLE `commande`
  MODIFY `idCommande` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `evaluationetcommentaire`
--
ALTER TABLE `evaluationetcommentaire`
  MODIFY `idEvaluationCommentaire` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `paiement`
--
ALTER TABLE `paiement`
  MODIFY `idPaiement` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `photo`
--
ALTER TABLE `photo`
  MODIFY `idphoto` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `produits`
--
ALTER TABLE `produits`
  MODIFY `idProduit` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `promotionproduit`
--
ALTER TABLE `promotionproduit`
  MODIFY `idPomotion` int(10) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `commande_ibfk_1` FOREIGN KEY (`idVendeur`) REFERENCES `vendeur` (`idVendeur`),
  ADD CONSTRAINT `commande_ibfk_2` FOREIGN KEY (`idClient`) REFERENCES `client` (`idClient`);

--
-- Contraintes pour la table `contenir`
--
ALTER TABLE `contenir`
  ADD CONSTRAINT `contenir_ibfk_1` FOREIGN KEY (`idProduit`) REFERENCES `produits` (`idProduit`),
  ADD CONSTRAINT `contenir_ibfk_2` FOREIGN KEY (`idCommande`) REFERENCES `commande` (`idCommande`);

--
-- Contraintes pour la table `evaluationetcommentaire`
--
ALTER TABLE `evaluationetcommentaire`
  ADD CONSTRAINT `evaluationetcommentaire_ibfk_1` FOREIGN KEY (`idProduit`) REFERENCES `produits` (`idProduit`),
  ADD CONSTRAINT `evaluationetcommentaire_ibfk_2` FOREIGN KEY (`idClient`) REFERENCES `client` (`idClient`);

--
-- Contraintes pour la table `paiement`
--
ALTER TABLE `paiement`
  ADD CONSTRAINT `paiement_ibfk_1` FOREIGN KEY (`idClient`) REFERENCES `client` (`idClient`),
  ADD CONSTRAINT `paiement_ibfk_2` FOREIGN KEY (`idCommande`) REFERENCES `commande` (`idCommande`);

--
-- Contraintes pour la table `produits`
--
ALTER TABLE `produits`
  ADD CONSTRAINT `produits_ibfk_1` FOREIGN KEY (`idVendeur`) REFERENCES `vendeur` (`idVendeur`),
  ADD CONSTRAINT `produits_ibfk_2` FOREIGN KEY (`idphoto`) REFERENCES `photo` (`idphoto`),
  ADD CONSTRAINT `produits_ibfk_3` FOREIGN KEY (`idCategorie`) REFERENCES `categorieproduit` (`idCategorie`);

--
-- Contraintes pour la table `promotionproduit`
--
ALTER TABLE `promotionproduit`
  ADD CONSTRAINT `promotionproduit_ibfk_1` FOREIGN KEY (`idProduit`) REFERENCES `produits` (`idProduit`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
