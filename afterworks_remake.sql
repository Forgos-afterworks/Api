-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : ven. 20 mai 2022 à 08:16
-- Version du serveur :  10.4.13-MariaDB
-- Version de PHP : 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `afterworks_remake`
--

-- --------------------------------------------------------

--
-- Structure de la table `afttable`
--

CREATE TABLE `afttable` (
  `id_table` int(11) NOT NULL,
  `nom` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `afttable`
--

INSERT INTO `afttable` (`id_table`, `nom`) VALUES
(1, '15B');

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

CREATE TABLE `article` (
  `id_article` int(11) NOT NULL,
  `titre` varchar(50) NOT NULL,
  `date_creation` date NOT NULL,
  `id_employe` int(11) NOT NULL,
  `id_rubrique` int(11) NOT NULL,
  `contenue` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `article`
--

INSERT INTO `article` (`id_article`, `titre`, `date_creation`, `id_employe`, `id_rubrique`, `contenue`) VALUES
(26, 'Test d\'article', '2022-01-19', 143, 1, 'Contenue de l\'article de test'),
(27, 'Test d\'article', '2022-01-20', 143, 20, 'Contenue de l\'article de test'),
(28, 'Test d\'article', '2022-01-20', 143, 20, 'Contenue de l\'article de test');

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE `categorie` (
  `id_categorie` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`id_categorie`, `nom`, `description`) VALUES
(1, 'Racine', ''),
(2, 'Boutique', ''),
(10, 'Infusion', '<p><span style=\"color:#363a41;font-family:\'Open Sans\', Helvetica, Arial, sans-serif;font-size:12.8px;\">La Brûlerie Comtoise vous propose une sélection d\'infusions...<br />Classiques, fruitées, épicées il y en a pour tous les goûts... A consommer aussi bien chaudes que glacées elles sauront vous accompagner toute au long de la journée et au fil des saisons... </span></p>'),
(11, 'Infusettes', '<p>La Brûlerie Comtoise vous fait découvrir sa large de gamme d\'infusions en sachet individuel. Au bureau comme à la maison, plus pratique et plus rapide, faites vous plaisir avec ces infusettes Made in France.</p>'),
(12, 'Infusion vrac', '<p>La Brûlerie Comtoise vous propose une sélection d\'infusions.<br />Classiques, fruitées, épicées il y en a pour tous les goûts... A consommer aussi bien chaudes que glacées elles sauront vous accompagner tout au long de la journée et au fil des saisons...</p>'),
(13, 'Thé', 'Description de la catégorie thé'),
(14, 'Café', ''),
(15, 'Infusettes', '<p>La Brûlerie Comtoise vous fait découvrir sa large gamme de thés en sachets individuels. Au bureau comme à la maison, plus pratique et plus rapide, faites vous plaisir avec ces infusettes Made in France. </p>'),
(16, 'Thé vrac', '<p>Découvrez la sélection de thés vrac de la Brûlerie Comtoise. <br />Amateurs de grandes origines, de mélanges aromatisés, fruités ou épicés... Sur une base de thé blanc, de thé vert ou de thé noir... il y a de quoi ravir tous les palais...</p>'),
(17, 'Café capsule', '<p style=\"text-align:right;\"><img src=\"https://www.labruleriecomtoise.fr/img/cms/capsules.jpg\" alt=\"\" width=\"275\" height=\"207\" style=\"float:left;\" /></p>\n<blockquote>\n<p style=\"text-align:justify;\">La Brûlerie Comtoise a développé sa sélection de capsules compatibles Nespresso®. Après avoir été torréfié le café est transformé et mis en capsule dans notre manufacture de la Grande rue de Dole. Étant basée sur la même gamme que notre sélection de café en grain, les capsules bénéficient des mêmes labels : Rainforest, issu de l\'agriculture biologique. De plus, elles sont labellisées « Made in Jura », label qui valorise la production artisanale et locale. </p>\n<p style=\"text-align:justify;\"></p>\n<p style=\"text-align:justify;\"></p>\n<p style=\"text-align:justify;\">La production se veut intégralement Made in France. La machine qui permet de concevoir les capsules, ainsi que les capsules elles-mêmes sont fabriquées en France. Élaborées dans des matières biodégradables, la dosette est en amidon de maïs et l\'opercule en canne à sucre. Elles illustrent pleinement la volonté de l\'entreprise de préserver l\'environnement et de limiter la production de déchets. </p>\n</blockquote>\n<p align=\"justify\" style=\"margin-bottom:0cm;text-align:justify;\"></p>'),
(18, 'Café grain', ''),
(19, 'Café grain & moulu', '<p style=\"text-align:justify;\">Le cœur du métier de la Brûlerie Comtoise est sa torréfaction 100% doloise. Du sourcing, à la réception des échantillons, aux séances de tasting et pour finir à la transformation du grain vert... tout se passe entre les quatre mûrs de la manufacture de la Grande rue de Dole. </p>\n<p style=\"text-align:justify;\">Attirés par les effluves du café grillé, les passants du centre ville peuvent assister aux séances de torréfaction et écouter les histoires et les conseils de Yoann sur le café. </p>\n<p style=\"text-align:justify;\">Torréfacteur et diplômé du Q Arabica Grader, Yoann Bride gère la sélection et la production du café de la Brûlerie Comtoise. Il choisit lui-même les producteurs avec lesquels il veut collaborer afin de veiller que leurs plantations leur assurent une rémunération correcte. Dans un souci de qualité, de préservation de l\'environnement le choix des grains se porte sur des origines labellisées. Issue de l\'agriculture biologique, labellisée Rainforest (préservation de la forêt) la gamme proposée se veut au plus près de la nature. </p>\n<p style=\"text-align:justify;\">La sélection de Yoann, sera un voyage à chaque tasse. Destination l\'Afrique avec un café d\'Éthiopie ou du Burundi. L\'Amérique du Sud avec le café aux notes chocolatées du Pérou ou de Colombie, suaves du Honduras, des notes de fruits rouges dans le Brésil ou le déca du Mexique. </p>\n<p style=\"text-align:justify;\">Le traditionnel Mélange Italien avec son assemblage d\'arabica et de robusta et le Blend de la Brûlerie entièrement élaboré par Yoann complètent la gamme. Vous y trouverez des cafés intenses, corsés, fruités, acidulés, gourmands, doux et fleuris. Palais de grand amateur, de débutant ou d\'épicurien qui aime les bonnes choses il y aura forcément un café pour vous. </p>\n<p style=\"text-align:justify;\">Nous vous proposons également un café expérimental, unique au monde, vieilli en fût de Sauternes 1er grand cru classé. Ce café issu du travail de 3 amis, Simon Verger, MOF Maître d\'hôtel et directeur du Skiff club, 2 étoilés Michelin, de Jean Compeyrot du Château Sigalas Rabaud, 1er grand cru classé et de notre torréfacteur Yoann.</p>'),
(20, 'Rooibos', '<p>La Brûlerie Comtoise propose une gamme de rooibos parfumés. Issu d\'Afrique du Sud, faible en tanin, sans théine et aux vertus antioxydantes, le rooibos accompagnera volontiers toutes vos soirées. </p>'),
(21, 'Accompagnements', '<p>Pour un moment de plaisir, pour accompagner votre café ou votre thé, la Brûlerie Comtoise a sélectionné pour vous une gamme de confiseries... à grignoter, à tartiner ou à déguster... </p>'),
(22, 'Machine & Accessoire', ''),
(23, 'Les Chocolats de Damien Benetot', '<p>Les Chocolats de Damien Benetot</p>\n<p>Pâtisserie Damien BENETOT</p>\n<p><a href=\"http://www.benetot.fr/\">http://www.benetot.fr/</a></p>\n<p>26 rue de Besançon</p>\n<p>39100 Dole</p>'),
(24, 'Coffret', ''),
(25, 'Pâques - Moulage', '<p>Les Chocolats de Damien Benetot</p>\n<p>Pâtisserie Damien BENETOT</p>\n<p><a href=\"http://www.benetot.fr/\">http://www.benetot.fr/</a></p>\n<p>26 rue de Besançon</p>\n<p>39100 Dole</p>'),
(26, 'Chocolats, macarons et divers', '<p>Les Chocolats de Damien Benetot</p>\n<p>Pâtisserie Damien BENETOT</p>\n<p><a href=\"http://www.benetot.fr/\">http://www.benetot.fr/</a></p>\n<p>26 rue de Besançon</p>\n<p>39100 Dole</p>'),
(27, 'Epicerie', '<p>Pour un moment de plaisir, pour accompagner votre café ou votre thé, la Brûlerie Comtoise a sélectionné pour vous une gamme Épicerie fine... à grignoter, à tartiner ou à déguster... </p>\n<p>Pour vous satisfaire du mieux possible nous avons élaboré une gamme de produits artisanaux, locaux si possible mais surtout MADE IN FRANCE. Nous avons à cœur de proposer des produits de qualité qui sauront accompagner vos instants de dégustation.</p>'),
(28, 'Confiseries', '<p>Pour un moment de plaisir, pour accompagner votre café ou votre thé, la Brûlerie Comtoise a sélectionné pour vous une gamme de confiseries... à grignoter, à tartiner ou à déguster... </p>'),
(29, 'Thé & Infusion', ''),
(30, 'Vrac', '<p><span style=\"color:#ffffff;\">Découvrez la sélection de thés et infusions vrac de la Brûlerie Comtoise. </span></p>\n<p><span style=\"color:#ffffff;\">Amateurs de grandes origines, de mélanges aromatisés, fruités ou épicés... Sur une base de thé blanc, vert ou noir, de fruits ou de plantes ... Il y a de quoi ravir tous les palais ...  </span></p>'),
(31, 'Sachet', '<p align=\"left\" style=\"margin-bottom:0cm;\"><span style=\"color:#ffffff;\"><span style=\"font-family:\'Times New Roman\', serif;font-size:medium;\">La Brûlerie Comtoise vous fait découvrir sa large gamme de thés et infusions en sachets individuels. Au bureau comme à la maison, plus pratique et plus rapide, faites vous plaisir avec ces infusettes Made in France.</span></span></p>');

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `id_client` int(11) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `mail` varchar(50) NOT NULL,
  `lib_adresse` varchar(50) DEFAULT NULL,
  `cp_adresse` varchar(50) DEFAULT NULL,
  `ville_adresse` varchar(25) DEFAULT NULL,
  `tel` varchar(25) DEFAULT NULL,
  `password` text NOT NULL,
  `newsletter` tinyint(1) NOT NULL,
  `role_JWT` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`id_client`, `prenom`, `nom`, `mail`, `lib_adresse`, `cp_adresse`, `ville_adresse`, `tel`, `password`, `newsletter`, `role_JWT`) VALUES
(1, 'johan', 'ROUSSEAU', 'johan.rousseau39@gmail.com', 'rue de la faïencerie', '39600', 'Arbois', '0612345678', '$2y$10$xe2DYLLh8vYnpQXp3ZiYQeIXalOVO3nchePy.s95gIQ8Ko2uHK8jK', 0, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE `commande` (
  `id_commande` int(11) NOT NULL,
  `id_table` int(11) NOT NULL,
  `id_statut` int(11) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`id_commande`, `id_table`, `id_statut`, `date`) VALUES
(1, 1, 5, '2022-03-01'),
(2, 1, 1, '2022-02-03'),
(3, 1, 1, '2022-05-03');

-- --------------------------------------------------------

--
-- Structure de la table `commande_declinaison`
--

CREATE TABLE `commande_declinaison` (
  `id_commande_declinaison` int(11) NOT NULL,
  `id_commande` int(11) NOT NULL,
  `id_produit_declinaison` int(11) NOT NULL,
  `quantitee` int(11) NOT NULL,
  `prix_HT` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `commande_declinaison`
--

INSERT INTO `commande_declinaison` (`id_commande_declinaison`, `id_commande`, `id_produit_declinaison`, `quantitee`, `prix_HT`) VALUES
(1, 1, 1, 3, 14),
(2, 1, 2, 15, 564);

-- --------------------------------------------------------

--
-- Structure de la table `commentaire`
--

CREATE TABLE `commentaire` (
  `id_commentaire` int(11) NOT NULL,
  `date` date NOT NULL,
  `titre` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `id_client` int(11) NOT NULL,
  `id_produit_declinaison` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `declinaison`
--

CREATE TABLE `declinaison` (
  `id_declinaison` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `declinaison`
--

INSERT INTO `declinaison` (`id_declinaison`, `nom`, `description`) VALUES
(1, '250 g', ''),
(2, 'Filtre', ''),
(3, 'Piston', ''),
(4, 'Italienne', ''),
(5, 'Espresso', ''),
(6, '500 g', ''),
(7, '1 kg', ''),
(21, 'sachet 100 g', ''),
(22, 'boîte 100 g ', ''),
(24, 'Grain', ''),
(25, 'Boîte 100 g ', ''),
(26, 'Sachet 100g', ''),
(27, 'Boîte 50g', ''),
(28, 'Sachet 50g', ''),
(30, '15', ''),
(31, '50', ''),
(32, '100', '');

-- --------------------------------------------------------

--
-- Structure de la table `employe`
--

CREATE TABLE `employe` (
  `id_employe` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `lib_adresse` varchar(50) DEFAULT NULL,
  `ville_adresse` varchar(25) DEFAULT NULL,
  `cp_adresse` varchar(25) DEFAULT NULL,
  `date_embauche` date NOT NULL,
  `id_role` int(11) NOT NULL,
  `password` text DEFAULT NULL,
  `mail` varchar(50) NOT NULL,
  `role_JWT` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`role_JWT`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `employe`
--

INSERT INTO `employe` (`id_employe`, `nom`, `prenom`, `lib_adresse`, `ville_adresse`, `cp_adresse`, `date_embauche`, `id_role`, `password`, `mail`, `role_JWT`) VALUES
(143, 'Brassens', 'George', 'rue de la faïencerie', 'Arbois', '39600', '2022-05-04', 2, '$2y$10$xe2DYLLh8vYnpQXp3ZiYQeIXalOVO3nchePy.s95gIQ8Ko2uHK8jK', 'johan.rousseau@gmail.com', '[]');

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE `produit` (
  `id_produit` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `id_tva` int(11) NOT NULL,
  `id_categorie` int(11) NOT NULL,
  `description` text NOT NULL,
  `prix_unitaire` float NOT NULL,
  `image` text DEFAULT NULL,
  `nombre_en_stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`id_produit`, `nom`, `id_tva`, `id_categorie`, `description`, `prix_unitaire`, `image`, `nombre_en_stock`) VALUES
(1, 'Feuilles de thé', 1, 1, 'Feuilles de thé bio et naturelles', 12, NULL, 0),
(128, 'Symphonie - 15 infusettes', 1, 31, 'Raisin de Corynthe, Cynorrhodon, Hibiscus, Orange, Ananas, Papaye, arômes', 0, '', 314),
(129, 'Cerise sauvage - 15 infusettes', 1, 11, 'Pomme, Cynorrhodon, Hibiscus, Cerise sauvage (3%), arômes', 0, '', 314),
(130, 'Digestive - 15 infusettes', 1, 31, 'Menthe Poivrée BIO plante, Mélisse BIO plante, Angélique BIO fruit, Anis Vert BIO fruit, Fenouil BIO fruit', 0, '', 314),
(131, 'Au clair de la Lune - 15 infusettes', 1, 31, 'Oranger Doux feuille, Passiflore des Indes, Mélisse, Verveine Odorante, Aspérule Odorante', 0, '', 314),
(132, 'Camomille - 15 infusettes', 1, 31, 'Camomille Bio', 0, '', 314),
(133, 'Infusion Tilleul - 15 infusettes', 1, 31, 'Tilleul', 0, '', 314),
(134, 'Infusion Verveine - 15 infusettes', 1, 31, 'Verveine Bio', 0, '', 314),
(135, 'La délicieuse - 15 infusettes', 1, 31, 'Verveine, Menthe Poivrée, Mélisse, Réglisse', 0, '', 314),
(147, 'Tisane de Noël - 15 infusettes', 1, 31, 'Cannelle, Orange Douce, Badiane, Hibiscus, Orange Amère, Cardamome', 0, '', 314),
(148, 'Transit - 15 infusettes', 1, 31, '<p>Anis Vert, Menthe Douce, Citronnelle</p>', 0, '', 314),
(149, 'Zen', 1, 11, 'Oranger Doux pétale, Passiflore des Indes, Camomille Matricaire, Mélisse, Coquelicot', 0, '', 314),
(150, 'Infusion Camomille - 50g', 1, 30, '', 0, '', 314),
(151, 'Infusion Fruits rouges - 100g', 1, 30, '', 0, '', 314),
(152, 'Infusion Mangue - 100g', 1, 30, '', 0, '', 314),
(153, 'Infusion Menthe - 50g', 1, 30, '', 0, '', 314),
(154, 'Thé noir caramel beurre salé - 100g', 1, 30, '<p style=\"text-align:justify;\"><span style=\"font-family:Tahoma, Verdana, Arial, Helvetica, sans-serif;font-size:16px;\">Du caramel fondant et doux accompagné d\'un soupçon de sel de perles africaines ajoutés aux morceaux de crème et d\'amandes... Il n\'en fallait pas plus pour inventer cette noble création gourmande.</span></p>', 0, '', 314),
(155, 'Darjeeling First Flush - 100g', 1, 30, '<p>Signifiant \"pays des orages\" en langue tibétaine. Plantation de thé noir issue de la région d\'Inde portant le même nom, elle est la seule à bénéficier d\'une Indication Géographique Protégée (IGP) pour lutter contre les nombreuses contrefaçons existantes.</p>\n<p>Le thé peut être récolté jusqu\'à 4 fois par an, celle du printemps, la première récolte, ou \"First Flush\" est très attendue des amateurs qui la qualifient de \"Champagne du thé\".</p>\n<p>Elle offre un thé léger et délicat aux notes fraîches et intenses, merveilleusement élaboré et présentant un caractère frais, légèrement épicé. </p>', 0, '', 314),
(156, 'English Breakfast - 100g', 1, 30, '<p style=\"text-align:justify;\">Ce mélange So British de culture biologique contrôlée est composé essentiellement de thés Assam. D\'abord réservée à l\'élite anglaise, la consommation du \"five o\'clock tea\" se démocratise au XIXe siècle. Depuis l\'époque coloniale, les Britanniques ont pour habitude de consommer des thés noirs plus corsés le matin comme ce ENGLISH BREAKFAST. Ce thé, à la fois puissant et aromatique, révèle une tasse foncée d\'un brun cuivré et un bouquet plein et épicé. </p>', 0, '', 314),
(165, 'Roiboos bergamote - 100g', 1, 30, '', 0, '', 314),
(166, 'Rooibos aloe vera melon', 1, 30, '', 0, '', 314),
(167, 'Rooibos Cranberry vanille - 100g', 1, 30, '', 0, '', 314),
(168, 'Rooibos Rhubarbe framboise - 100g', 1, 30, '', 0, '', 314),
(169, 'Thé blanc Chine - 50g', 1, 30, '<h3>Ce thé du Yunnan est cultivé à une altitude comprise entre 1300 et 2000m d\'altitude et à des températures allant de 12 à 23°C. Ses grandes feuilles ouvertes vert clair et la large proportion de pointes argentées laissent un bouquet doux et fleuri en bouche. La liqueur a un parfum fleuri dont la couleur rappelle le lever du soleil.<br />Le THE BLANC est celui qui nécessite le temps d\'infusion le moins long, l\'eau la moins chaude et est celui qui subit le moins de transformation.</h3>', 0, '', 314),
(170, 'Thé noir Ceylan - 100g', 1, 30, '<p>Jusqu’au milieu du XIXème siècle, on consommait à Ceylan exclusivement du café. Cependant, dans les années 1850, un parasite ravagea les plantations de café de l’île, ce qui obligea les cultivateurs anglais à recourir à une autre plante : les théiers. C’est ainsi que le thé fit son apparition au Sri Lanka.</p>\n<p>Ce Ceylan organique provient de la vallée de Bogawantalwa dans l\'ouest du Sri Lanka. Les feuilles courtes et foncées d\'un brun rouillé développent une tasse brillante de couleur cuivrée et une infusion rouge vif. Le bouquet vous impressionnera par son goût plein et un arôme doux et épicé, qui laisse un arrière-goût très riche.  </p>', 0, '', 314),
(171, 'Thé noir Chine - 100g', 1, 30, '<p style=\"text-align:justify;\"><span style=\"font-family:Tahoma, Verdana, Arial, Helvetica, sans-serif;font-size:16px;text-align:justify;\">La qualité supérieure de ce thé noir du Yunnan se présente magnifiquement avec beaucoup de grandes pointes de feuilles brun doré et une infusion brun cuivré foncé avec un goût bien équilibré et des notes légèrement douces et épicées. Elle vous laissera avec une touche finale douce et légèrement fumée. </span></p>', 0, '', 314),
(172, 'Thé noir fruits rouges - 100g', 1, 30, '<p style=\"text-align:justify;\"><span id=\"s2_1\" style=\"background-color:#ffffff;font-family:Tahoma, Verdana, Arial, Helvetica, sans-serif;font-size:16px;\">L’ardeur du printemps se transforme en amour estival.</span><span style=\"font-family:Tahoma, Verdana, Arial, Helvetica, sans-serif;font-size:16px;background-color:#f7f7f7;\"> </span><span id=\"s2_3\" style=\"background-color:#ffffff;font-family:Tahoma, Verdana, Arial, Helvetica, sans-serif;font-size:16px;\">Les fleurs de pavot, le souci et la rose sont les annonciateurs de l’été.</span><span style=\"font-family:Tahoma, Verdana, Arial, Helvetica, sans-serif;font-size:16px;background-color:#f7f7f7;\"> </span><span id=\"s2_4\" style=\"background-color:#ffffff;font-family:Tahoma, Verdana, Arial, Helvetica, sans-serif;font-size:16px;\">Le bonheur peut durer un moment de plus sur cette prairie fruitée et douce de fleurs. </span></p>\n<p></p>\n<p></p>\n<p></p>', 0, '', 314),
(173, 'Thé noir Inde - 100g', 1, 30, '<p><span style=\"font-family:Tahoma, Verdana, Arial, Helvetica, sans-serif;font-size:16px;text-align:justify;\">Ce thé noir du Sud de l\'Inde du jardin Thiashola a une saveur fraîche et légèrement tranchante avec un certain corps. Une feuille multicolore et inégale avec des tâches vertes. La couleur de coupe d\'un rouge cuivre offre un parfum de fleurs fraîches. </span></p>', 0, '', 314),
(174, 'Thé noir mangue - 100g', 1, 30, '', 0, '', 314),
(175, 'Thé noir orange - 100g', 1, 30, '<p><span style=\"color:#888888;font-family:Tahoma, Verdana, Arial, Helvetica, sans-serif;font-size:16px;text-align:justify;background-color:#ffffff;\">Aussi rafraîchissant et vitaminé qu\'un jus d\'orange pressé, ce thé noir, frais et vif, sera votre allié pour démarrer votre journée du bon pied ! </span></p>', 0, '', 314),
(176, 'Thé noir pêche - 100g', 1, 30, '<p><span style=\"color:#888888;font-family:Tahoma, Verdana, Arial, Helvetica, sans-serif;font-size:16px;text-align:justify;background-color:#ffffff;\">Ce thé de Ceylan doux décoré avec les couleurs de différentes fleurs et le bleu profond et scintillant de fleurs de bleuet est une promesse de détente complète. Cet arôme est composé des fruits les plus exotiques au monde et d\'un soupçon de crème douce qui fait errer vos pensées, vous permettant de profiter d’un moment de relaxation parfait et de recueillir de nouvelles forces. </span></p>', 0, '', 314),
(177, 'Thé vert citron jasmin - 100g', 1, 30, '', 0, '', 314),
(178, 'Thé vert fraise litchi - 100g', 1, 30, '', 0, '', 314),
(179, 'Thé vert Inde - 100g', 1, 30, '<p><span style=\"color:#888888;font-family:Tahoma, Verdana, Arial, Helvetica, sans-serif;font-size:16px;text-align:justify;\">Au cours des dernières années, la plantation Nagri Farm, qui se trouve dans la vallée de Rongbong, a acquis une réputation exceptionnelle pour la production de thé vert. La plantation est répartie sur une superficie de 571 hectares à des altitudes allant jusqu’à 1400 m et a une production annuelle d’environ 190000 kg de thé. Les buissons poussent lentement dans l’air frais de la montagne et l’arôme et les feuilles peuvent se développer parfaitement dans ces conditions idéales. La feuille verte régulière a quelques pointes argentées et présente son caractère classique, rond et doux dans une tasse jaune citron. </span></p>', 0, '', 314),
(180, 'Thé vert Japon - 50g', 1, 30, '', 0, '', 314),
(181, 'Thé vert jasmin - 100g', 1, 30, '<p><span style=\"color:#888888;font-family:Tahoma, Verdana, Arial, Helvetica, sans-serif;font-size:16px;text-align:justify;\">Avec une tasse légèrement jaune et le parfum expressif et typique de jasmin ainsi qu\'une légère note fruitée-acidulée, ce thé au jasmin est un compagnon idéal pour chaque repas et un vrai désaltérant. Selon la qualité de l’eau, le thé peut être infusé plus d’une fois</span></p>', 0, '', 314),
(182, 'Thé vert mangue ananas - 100g', 1, 30, '', 0, '', 314),
(183, 'Thé vert poire - 100g', 1, 30, '', 0, '', 314),
(184, 'Thé vert Vanille jasmin - 100g', 1, 30, '', 0, '', 314),
(185, 'Thé vert Vietnam - 100g', 1, 30, '', 0, '', 314),
(197, 'Brésil', 1, 17, '<p>Premier pays producteur de café, ce cru du Brésil de chez Daterra vous surprendra par ses notes sucrées et fruitées.</p>', 0, '', 314),
(198, 'Ethiopie Yrgacheffe', 1, 17, '<p>Issu de la célèbre région d\'Ethiopie Yrgacheffe, ce café est récolté à pleine maturité, puis laissé fermenter sous eau de 24 à 36 heures afin de développer ses arômes d\'une rare délicatesse</p>', 0, '', 314),
(201, 'Mexique Décaféiné', 1, 17, '<p>Un décaféiné mexicain issu d\'un process naturel à l\'eau et crédité du label biologiqueLabel : Bio</p>', 0, '', 314),
(202, 'Pérou El Palto', 1, 17, '<p>L\'association JUMARP qui gère cette coopérative a pour objectifs d\'aider fiancièrement les producteurs et d\'améliorer leurs conditions de travail mais aussi en finançant la construction d\'école Label : Bio</p>', 0, '', 314),
(203, 'Blend de la Brûlerie', 1, 17, '<p>Un café rond et subtil 100% arabica avec ses notes de chocolat et de fruits secs</p>', 0, '', 314),
(204, 'Mélange italien', 1, 17, '<p>Un café corsé comme dans la tradition italienne avec ses notes de cacao et animal</p>', 0, '', 314),
(206, 'Colombie', 1, 18, 'Issu d\'un microlot de Colombie, ce café vous ravira par ses notes subtiles et suaves', 0, '', 314),
(207, 'Brésil', 1, 18, 'Premier pays producteur de café, ce cru du Brésil de chez Daterra vous surprendra par ses notes sucrées et fruitées.', 0, '', 314),
(208, 'Ethiopie Yrgacheffe', 1, 18, 'Issu de la célèbre région d\'Ethiopie Yrgacheffe, ce café est récolté à pleine maturité, puis laissé fermenter sous eau de 24 à 36 heures afin de développer ses arômes d\'une rare délicatesse', 0, '', 314),
(210, 'Ethiopie Guji', 1, 19, '<p>Berceau du café, ce cru produit dans la région de Guji est séché naturellement au soleil pour transférer les sucres présent dans la chair du fruit au grain de café</p>', 0, '', 314),
(211, 'Mexique Décaféiné', 1, 18, 'Un décaféiné mexicain issu d\'un process naturel à l\'eau et crédité du label biologiqueLabel : Bio', 0, '', 314),
(212, 'Pérou El Palto', 1, 18, 'L\'association JUMARP qui gère cette coopérative a pour objectifs d\'aider fiancièrement les producteurs et d\'améliorer leurs conditions de travail mais aussi en finançant  la construction d\'école Label : Bio', 0, '', 314),
(213, 'Blend de la Brûlerie', 1, 18, 'Un café rond et subtil 100% arabica avec ses notes de chocolat et de fruits secs', 0, '', 314),
(214, 'Mélange italien', 1, 18, 'Un café corsé comme dans la tradition italienne avec ses notes de cacao et animal', 0, '', 314),
(216, 'Colombie', 1, 19, '<p>Issu d\'un microlot de Colombie, ce café vous ravira par ses notes subtiles et suaves</p>', 0, '', 314),
(217, 'Brésil', 1, 19, '<p>Premier pays producteur de café, ce cru du Brésil de chez Daterra vous surprendra par ses notes sucrées et fruitées.</p>', 0, '', 314),
(218, 'Ethiopie Yrgacheffe', 1, 19, '<p>Issu de la célèbre région d\'Ethiopie Yrgacheffe, ce café est récolté à pleine maturité, puis laissé fermenter sous eau de 24 à 36 heures afin de développer ses arômes d\'une rare délicatesse</p>', 0, '', 314),
(220, 'Guji Ethiopie naturel', 1, 19, '<p>Berceau du café, ce cru produit dans la région de Guji est séché naturellement au soleil pour transférer les sucres présent dans la chair du fruit au grain de café</p>', 0, '', 314),
(221, 'Mexique Décaféiné', 1, 19, '<p>Un décaféiné mexicain issu d\'un process naturel à l\'eau et crédité du label biologiqueLabel : Bio</p>', 0, '', 314),
(222, 'Pérou El Palto', 1, 19, '<p>L\'association JUMARP qui gère cette coopérative a pour objectifs d\'aider fiancièrement les producteurs et d\'améliorer leurs conditions de travail mais aussi en finançant la construction d\'école Label : Bio</p>', 0, '', 314),
(223, 'Blend de la Brûlerie', 1, 19, '<p>Un café rond et subtil 100% arabica avec ses notes de chocolat et de fruits secs</p>', 0, '', 314),
(224, 'Mélange italien', 1, 19, '<p>Un café corsé comme dans la tradition italienne avec ses notes de cacao et animal</p>', 0, '', 314),
(225, 'Infusion Noix de coco aloé vera - 100g', 1, 30, '', 0, '', 314),
(226, 'Infusion Pina Colada -100g', 1, 30, '', 0, '', 314),
(227, 'Infusion Poire cannelle - 100g', 1, 30, '', 0, '', 314),
(228, 'Infusion Tilleul - 50g', 1, 30, '', 0, '', 314),
(229, 'Thé blanc Bai Mu Dan - 15 infusettes', 1, 15, 'Thé blanc de Chine', 0, '', 314),
(230, 'Earl Grey - 15 infusettes', 1, 15, 'Thé noir romatisé à la bergamote', 0, '', 314),
(231, 'Lendemain de fête - 15 infusettes', 1, 15, 'Thé Noir, Badiane, Tilleul Aubier, Gingembre, Réglisse', 0, '', 314),
(232, 'English Breakfast - 15 infusettes', 1, 15, 'Thé noir', 0, '', 314),
(233, 'Secret d\'Antan - 15 infusettes', 1, 15, 'Thé noir, flocons de sucre, Pomme, Amande, arômes, pétale de Rose', 0, '', 314),
(234, 'Peps - 15 infusettes', 1, 15, 'Maté, Cynorrhodon, Eleuthérocoque, Gingembre, Sarriette, Hibiscus', 0, '', 314),
(235, 'Sencha douce saveur - 15 infusettes', 1, 15, 'Thé vert Sencha (70%), Raisin de Corinthe, Pétale de rose, arômes,  Ananas, Papaye, Fraise, Framboise', 0, '', 314),
(236, 'Thé vert bio - 15 infusettes', 1, 15, 'Thé vert Bio', 0, '', 314),
(237, 'Thé vert citron - 15 infusettes', 1, 15, 'Thé vert (90%), Citron écorce (10%)', 0, '', 314),
(238, 'Detox Automne hiver - 15 infusettes', 1, 15, 'Thé vert feuille, Chicorée feuille, Citron écorce, Chiendent Officinal racine', 0, '', 314),
(239, 'Thé vert menthe - 15 infusettes', 1, 15, 'Thé vert (60%), Menthe Douce (40%)', 0, '', 314),
(240, 'Thé vert pêche - 100g', 1, 30, '', 0, '', 314),
(241, 'Thé vert mirabelle - 100g', 1, 30, '', 0, '', 314),
(242, 'Thé vert figue baies rouges - 100g', 1, 30, '', 0, '', 314),
(243, 'Thé vert pomme gingembre - 100g', 1, 30, '', 0, '', 314),
(244, 'Thé vert cerise - 100g', 1, 30, '<p><span style=\"color:#888888;font-family:Tahoma, Verdana, Arial, Helvetica, sans-serif;font-size:16px;text-align:justify;\">Ce thé vert est une invitation au voyage... L\'excellente base abondamment décorée de pétales de rose, et son parfum fruité de cerise n\'est pas sans rappeler les magnifiques jardins japonais durant la saison de floraison des cerisiers... </span></p>', 0, '', 314),
(245, 'Oolong Vietnam - 100g', 1, 30, '<h3 class=\"PreformattedText\" style=\"text-align:justify;\"><span style=\"color:#9b9b9b;font-family:\'Arial Nova Cond Light\', sans-serif;\"><span style=\"font-size:11pt;\">Thé désigné sous le nom de « bleu vert » à mi chemin entre le thé vert non oxydé et le thé noir </span><span style=\"font-size:14.6667px;\">complétement</span><span style=\"font-size:11pt;\"> oxydé. Qualifié de thé semi-oxydé, faible en théine il sera à déguster tout au long de la journée. Issu de la ville de Bao Loc, où sont produits des Oolong en utilisant les méthodes taïwanaises anciennes. Les </span></span><span style=\"color:#9b9b9b;\"><span style=\"font-family:\'Arial Nova Cond Light\', sans-serif;\"><span style=\"font-size:11pt;\">feuilles</span></span><span style=\"font-family:\'Arial Nova Cond Light\', sans-serif;\"><span style=\"font-size:11pt;\"> </span></span></span><span style=\"color:#9b9b9b;font-family:\'Arial Nova Cond Light\', sans-serif;\"><span style=\"font-size:11pt;\">de thé fraîchement cueillies sont séchées puis écrasées pour commencer la fermentation. Après avoir atteint le niveau de fermentation souhaité, le thé est séché à basse température. La tasse verte rayonnante caresse les papilles de chacun avec sa saveur fleurie et sucrée. </span></span></h3>', 0, '', 314),
(246, 'Honduras', 1, 17, '<p>Ce Cru du Honduras vous fera voyager dans ce pays emblématique de la production de café</p>', 0, '', 314),
(247, 'Honduras', 1, 18, '<p>Ce Cru du Honduras vous fera voyager dans ce pays emblématique de la production de café</p>', 0, '', 314),
(248, 'Honduras', 1, 19, '<p>Ce Cru du Honduras vous fera voyager dans ce pays emblématique de la production de café</p>', 0, '', 314),
(254, 'Orangette chocolat noir  - 100g', 1, 27, '', 0, '', 314),
(255, 'Caramel à l\'O - 230g', 1, 27, '<p>Elaboré par la Confiserie Lou Sucrèu St Haon-le-Châtel avec l\'eau Thermale de Salins les Bains, Jura</p>\n<p>Ingrédients : crème, sucre, glucose, beurre, sel 1,2%.</p>\n<p><strong>Sans huile de palme</strong></p>', 0, '', 314),
(256, 'Nougatine amandes - 150g', 1, 27, '<p>Fabrication artisanale par la Confiserie \"La Sucrerie\" - 39600 Arbois, JURA</p>\n<p>Ingrédients : glucose, sucre, <span>amandes</span>, beurre</p>', 0, '', 314),
(259, 'Miel forêt - 250g', 1, 27, '<p>Miel du JURA - 39190 Val-Sonnette</p>', 0, '', 314),
(297, 'Machine Automatique Mélitta Solo Noir', 1, 22, 'Machine automatique avec moulin intégré, réservoir d\'eau + 1kg de café offert Pérou Bio Commerce équitable', 0, '', 314),
(311, 'cafetière', 1, 22, 'Machine à café vendue avec 3 adaptateurs : Café moulu, Capsules Nespresso et Capsules Dolce Gusto. Une machine compact et facile d\'utilisation. Fournit avec un tampeur et une cuillère doseuse.', 0, '', 314),
(314, 'Nougatine noisettes - 150g', 1, 2, '<p style=\"margin-top:0px;margin-bottom:1rem;font-size:14px;color:#888888;font-family:Lato, sans-serif;background-color:#f3f3f3;\">Fabrication artisanale par la Confiserie \"La Sucrerie\" - 39600 Arbois, JURA</p>\n<p style=\"margin-top:0px;margin-bottom:1rem;font-size:14px;color:#888888;font-family:Lato, sans-serif;background-color:#f3f3f3;\">Ingrédients : glucose, sucre, <span>noisettes</span>, beurre</p>', 0, '', 314),
(315, 'Nougatine sésame - 150g', 1, 27, '<p style=\"margin-top:0px;margin-bottom:1rem;font-size:14px;color:#888888;font-family:Lato, sans-serif;background-color:#f3f3f3;\">Fabrication artisanale par la Confiserie \"La Sucrerie\" - 39600 Arbois, JURA</p>\n<p style=\"margin-top:0px;margin-bottom:1rem;font-size:14px;color:#888888;font-family:Lato, sans-serif;background-color:#f3f3f3;\">Ingrédients : glucose, sucre, lin,  sésame, beurre</p>\n<p style=\"margin-top:0px;margin-bottom:1rem;font-size:14px;color:#888888;font-family:Lato, sans-serif;background-color:#f3f3f3;\"><span>Traces possibles de fruits à coque</span></p>', 0, '', 314),
(317, 'Miel Tilleul - 250g', 1, 28, '<p>Miel du JURA - 39190 Val-Sonnette</p>', 0, '', 314),
(318, 'Miel acacia - 250g', 1, 2, '<p>Miel du JURA - 39190 Val-Sonnette</p>', 0, '', 314),
(320, 'Indonésie', 1, 17, '', 0, '', 314),
(321, 'Papouasie Nouvelle Guinée', 1, 17, '<p>Ce café a été récolté par 3113 petits exploitants agricoles travaillant avec Greenco Coffee et qui livrent leur production à la centrale de lavage de Nemba. Greenco achète les cerises de café aux exploitants plus cher que la moyenne des achats dans le secteur. </p>', 0, '', 314),
(322, 'Eau tonique nature', 1, 2, '<p align=\"left\" style=\"margin-bottom:0cm;\"><span style=\"font-family:\'Bahnschrift Light SemiCondensed\', sans-serif;\"><span style=\"font-size:medium;\">EAU TONIQUE NATURE HYSOPE :</span></span></p>\n<p align=\"left\" style=\"margin-bottom:0cm;\"><span style=\"font-family:\'Bahnschrift Light SemiCondensed\', sans-serif;\"><span style=\"font-size:medium;\">Fruit de l\'artisanat français sur l\'intégralité de sa chaîne de production, l\'eau tonique HYSOPE est élaborée à partir d\'ingrédients d\'origine biologique, dont l\'ensemble des recettes est certifiée ECOCERT. Tous les arômes sont sélectionnés à Grasse, capitale du parfum.</span></span></p>\n<p align=\"left\" style=\"margin-bottom:0cm;\"></p>\n<p align=\"left\" style=\"margin-bottom:0cm;\"><span style=\"font-family:\'Bahnschrift Light SemiCondensed\', sans-serif;\"><span style=\"font-size:medium;\">Pour twister vos cocktails, sublimer vos spiritueux ou simplement se déguster bien fraîche l\'eau tonique HYSOPE saura vous accompagner lors de vos apéritifs. </span></span></p>', 0, '', 314),
(323, 'Eau tonique concombre', 1, 2, '<p align=\"left\" style=\"margin-bottom:0cm;\"><span style=\"font-family:\'Bahnschrift Light SemiCondensed\', sans-serif;\"><span style=\"font-size:medium;\">EAU TONIQUE CONCOMBRE HYSOPE :</span></span></p>\n<p align=\"left\" style=\"margin-bottom:0cm;\"><span style=\"font-family:\'Bahnschrift Light SemiCondensed\', sans-serif;\"><span style=\"font-size:medium;\">Fruit de l\'artisanat français sur l\'intégralité de sa chaîne de production, l\'eau tonique HYSOPE est élaborée à partir d\'ingrédients d\'origine biologique, dont l\'ensemble des recettes est certifiée ECOCERT. Tous les arômes sont sélectionnés à Grasse, capitale du parfum.</span></span></p>\n<p align=\"left\" style=\"margin-bottom:0cm;\"></p>\n<p align=\"left\" style=\"margin-bottom:0cm;\"><span style=\"font-family:\'Bahnschrift Light SemiCondensed\', sans-serif;\"><span style=\"font-size:medium;\">Pour twister vos cocktails, sublimer vos spiritueux ou simplement se déguster bien fraîche l\'eau tonique HYSOPE saura vous accompagner lors de vos apéritifs.</span></span></p>', 0, '', 314),
(324, 'Eau tonique gingembre', 1, 2, '<p align=\"left\" style=\"margin-bottom:0cm;\"><span style=\"font-family:\'Bahnschrift Light SemiCondensed\', sans-serif;\"><span style=\"font-size:medium;\">EAU TONIQUE GINGEMBRE HYSOPE :</span></span></p>\n<p align=\"left\" style=\"margin-bottom:0cm;\"><span style=\"font-family:\'Bahnschrift Light SemiCondensed\', sans-serif;\"><span style=\"font-size:medium;\">Fruit de l\'artisanat français sur l\'intégralité de sa chaîne de production, l\'eau tonique HYSOPE est élaborée à partir d\'ingrédients d\'origine biologique, dont l\'ensemble des recettes est certifiée ECOCERT. Tous les arômes sont sélectionnés à Grasse, capitale du parfum.</span></span></p>\n<p align=\"left\" style=\"margin-bottom:0cm;\"></p>\n<p align=\"left\" style=\"margin-bottom:0cm;\"><span style=\"font-family:\'Bahnschrift Light SemiCondensed\', sans-serif;\"><span style=\"font-size:medium;\">Pour twister vos cocktails, sublimer vos spiritueux ou simplement se déguster bien fraîche l\'eau tonique HYSOPE saura vous accompagner lors de vos apéritifs.</span></span></p>', 0, '', 314),
(326, 'Eau tonique citron', 1, 2, '<p align=\"left\" style=\"margin-bottom:0cm;\"><span style=\"font-family:\'Bahnschrift Light SemiCondensed\', sans-serif;\"><span style=\"font-size:medium;\">EAU TONIQUE CITRON HYSOPE :</span></span></p>\n<p align=\"left\" style=\"margin-bottom:0cm;\"><span style=\"font-family:\'Bahnschrift Light SemiCondensed\', sans-serif;\"><span style=\"font-size:medium;\">Fruit de l\'artisanat français sur l\'intégralité de sa chaîne de production, l\'eau tonique HYSOPE est élaborée à partir d\'ingrédients d\'origine biologique, dont l\'ensemble des recettes est certifiée ECOCERT. Tous les arômes sont sélectionnés à Grasse, capitale du parfum.</span></span></p>\n<p align=\"left\" style=\"margin-bottom:0cm;\"></p>\n<p align=\"left\" style=\"margin-bottom:0cm;\"><span style=\"font-family:\'Bahnschrift Light SemiCondensed\', sans-serif;\"><span style=\"font-size:medium;\">Pour twister vos cocktails, sublimer vos spiritueux ou simplement se déguster bien fraîche l\'eau tonique HYSOPE saura vous accompagner lors de vos apéritifs.</span></span></p>', 0, '', 314),
(328, 'Eau tonique fleur de sureau', 1, 2, '<p align=\"left\" style=\"margin-bottom:0cm;\"><span style=\"font-family:\'Bahnschrift Light SemiCondensed\', sans-serif;\"><span style=\"font-size:medium;\">EAU TONIQUE FLEUR DE SUREAU HYSOPE :</span></span></p>\n<p align=\"left\" style=\"margin-bottom:0cm;\"><span style=\"font-family:\'Bahnschrift Light SemiCondensed\', sans-serif;\"><span style=\"font-size:medium;\">Fruit de l\'artisanat français sur l\'intégralité de sa chaîne de production, l\'eau tonique HYSOPE est élaborée à partir d\'ingrédients d\'origine biologique, dont l\'ensemble des recettes est certifiée ECOCERT. Tous les arômes sont sélectionnés à Grasse, capitale du parfum.</span></span></p>\n<p align=\"left\" style=\"margin-bottom:0cm;\"></p>\n<p align=\"left\" style=\"margin-bottom:0cm;\"><span style=\"font-family:\'Bahnschrift Light SemiCondensed\', sans-serif;\"><span style=\"font-size:medium;\">Pour twister vos cocktails, sublimer vos spiritueux ou simplement se déguster bien fraîche l\'eau tonique HYSOPE saura vous accompagner lors de vos apéritifs.</span></span></p>', 0, '', 314),
(331, 'Miel sapin - 250g', 1, 2, '<p>Miel du JURA - 39190 Val-Sonnette</p>', 0, '', 314),
(332, 'Miel fleurs sauvages - 250g', 1, 2, '<p>Miel du JURA - 39190 Val-Sonnette</p>', 0, '', 314),
(333, 'Cranberry enrobée - 120g', 1, 2, '<p>Dragée Reynaud, confiseur de la région de Marseille, détourne la dragée traditionnelle avec des recettes des plus gourmandes. </p>\n<p></p>', 0, '', 314),
(334, 'Guimauve vanille', 1, 2, '', 0, '', 314),
(335, 'Dragée fruitée - abricot 150g', 1, 2, '<p style=\"font-style:normal;font-weight:400;letter-spacing:normal;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;margin-top:0px;margin-bottom:1rem;font-size:14px;color:#888888;font-family:Lato, sans-serif;background-color:#f3f3f3;\"></p>\n<p style=\"font-style:normal;font-weight:400;letter-spacing:normal;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;margin-top:0px;margin-bottom:1rem;font-size:14px;color:#888888;font-family:Lato, sans-serif;background-color:#f3f3f3;\">Dragée Reynaud, confiseur de la région de Marseille, détourne la dragée traditionnelle avec des recettes des plus gourmandes. </p>', 0, '', 314),
(336, 'Dragée fruitée - framboise 150g', 1, 2, '<p style=\"margin-top:0px;margin-bottom:1rem;font-size:14px;color:#888888;font-family:Lato, sans-serif;background-color:#f3f3f3;\">Dragée Reynaud, confiseur de la région de Marseille, détourne la dragée traditionnelle avec des recettes des plus gourmandes. </p>\n<p></p>', 0, '', 314),
(337, 'Dragée fruitée - poire 150g', 1, 2, '<p style=\"margin-top:0px;margin-bottom:1rem;font-size:14px;color:#888888;font-family:Lato, sans-serif;background-color:#f3f3f3;\">Dragée Reynaud, confiseur de la région de Marseille, détourne la dragée traditionnelle avec des recettes des plus gourmandes. </p>\n<p></p>', 0, '', 314),
(338, 'Dragée fruitée - assortiment 150g', 1, 2, '<p style=\"margin-top:0px;margin-bottom:1rem;font-size:14px;color:#888888;font-family:Lato, sans-serif;background-color:#f3f3f3;\">Dragée Reynaud, confiseur de la région de Marseille, détourne la dragée traditionnelle avec des recettes des plus gourmandes. </p>\n<p></p>', 0, '', 314),
(339, 'Amande chocolat noir - 100g', 1, 2, '', 0, '', 314),
(340, 'Bille croustillante chocolat lait - 100g', 1, 2, '', 0, '', 314),
(345, 'Le Café Sigalas - 150g', 1, 2, '', 0, '', 314),
(347, 'Le Café Sigalas - 10 capsules', 1, 17, '', 0, '', 314),
(352, 'Filtre x100', 1, 2, '', 0, '', 314),
(353, 'Valrhona - Jivara 40%', 1, 2, '<p style=\"text-align:justify;\"><span style=\"color:#ffffff;\">Jivara, par sa douceur cacaotée et maltée, est un chocolat chaleureux comme les rayons dorés du soleil à l\'aube d\'un matin d\'été.</span></p>\n<p style=\"text-align:justify;\"></p>\n<p style=\"text-align:justify;\"><span style=\"color:#ffffff;\">Développé en 1995, Valrhona fait évoluer les codes du chocolat au lait avec Jivara, premier chocolat au lait à proposer une telle force gustative, avec un véritable goût de cacao. Pour atteindre ce goût singulier, Jivara est issu d\'un assemblage complexe de profils aromatiques de cacaos typiques d\'Equateur et du Ghana. </span></p>', 0, '', 314),
(354, 'Valrhona - Dulcey 35%', 1, 2, '<p style=\"text-align:justify;\"><span style=\"color:#ffffff;\">Dulcey, par sa douceur biscuitée très légèrement salée et son goût de lait caramélisé, à ce don de nus renvoyer en enfance, de nousf aire voyager dans un tourbillon de souvenirs délicieux propres à chacun.</span></p>\n<p style=\"text-align:justify;\"><span style=\"color:#ffffff;\">En 2012, Valrhona invente la quatrième couleur de chocolat : le blond. Laissant du chocolat blanc au bain-marie trop longtemps, Frédéric Bau découvre un surprenant résultat, le chocolat est devenu blond et laisse échapper une douce odeur. Dulcey est une ode à la créativité et à l\'audace qui révolutionne le monde de la pâtisserie pour offrir de nouvelles émotions grâce à a couleur son goût et sa texture. </span></p>', 0, '', 314),
(355, 'Valrhona - Ivoire 35%', 1, 2, '<p style=\"text-align:justify;\"><span style=\"color:#ffffff;\">Les notes réconfortantes de lait cuit de chocolat blanc Ivoire font écho aux éclats de rire d\'enfants qui partagent ensemble leurs plus grands moments de bonheur. </span></p>\n<p style=\"text-align:justify;\"><span style=\"color:#ffffff;\">Avec Ivoire, Valrhona se démarque de l\'univers traditionnel des chocolats blancs, grâce à sa note sucrée tout en légèreté et sa couleur subtilement nacrée. </span></p>\n<p style=\"text-align:justify;\"><span style=\"color:#ffffff;\">Référence iconique, Ivoire est devenu le mot générique parmi les professionnels de la gastronomie pour désigner le chocolat blanc.</span></p>', 0, '', 314),
(356, 'Valrhona - Caraïbe 66%', 1, 2, '<p style=\"text-align:justify;\"><span style=\"color:#ffffff;\">Caraïbe, avec ses notes amères intenses et ses accents boisés et de fruits secs grillés, fait rêver à une danse envoûtante à l\'ombre des cacaoyers. </span></p>\n<p style=\"text-align:justify;\"><span style=\"color:#ffffff;\">Référent des chocolats équilibrés depuis 1988, Caraïbe est issu d\'un assemblage complexe de profils aromatiques de cacaos typiques de République Dominicaine, Equateur, Jamaïque et Togo pour atteindre ce goût singulier. Caraïbe est ainsi nommé car il rend hommage à la diversité des îles Caraïbes, dont les fèves ont inspiré sa création. </span></p>', 0, '', 314),
(357, 'Thé noir Par Amour - 100g', 1, 2, '<p><span style=\"color:#ffffff;\">Un thé noir aux saveurs de cerise parsemé de pétales de rose et de cœur en sucre. </span></p>\n<p><span style=\"color:#ffffff;\">Une façon gourmande et délicate de dire</span> <strong><span style=\"color:#d0121a;\">JE T\'AIME</span> </strong><span style=\"color:#ffffff;\">à ceux qui sont chers à notre cœur... </span></p>\n<p><span style=\"color:#ffffff;\">A la fois fruité, parfumé et sucré ce thé saura mettre vos pailles en extase. Les pétales de rose qu\'il contient remplaceront volontiers le traditionnel bouquet de fleurs de la Saint Valentin... </span></p>', 0, '', 314),
(358, 'Valrhona - Oriado 60% 1kg', 1, 2, '<p>La douceur onctueuse et vanillée d\'Oriado invite à une sieste sur le sable chaud, avec la caresse enveloppante du soleil sur la peau. </p>\n<p>Créé en 2015, Oriado se distingue à la dégustation par sa légèreté et son équilibre. Issu de la gamme certifée, Oriado est l\'expression visible de l\'engagement de Valrhona, pour sa qualité et la traçabilité de la filière cacao. </p>\n<p>Oriado est réalisé exclusivement à partir des meilleures matières premières biologiques, issues du commerce équitable (certifié Fairtrade/ Max Havelaar et issu de l\'Agriculture Biologique)</p>', 0, '', 314),
(360, 'GEISHA DU PANAMA - 150g', 1, 2, '', 0, '', 314),
(361, 'Thé vert citron - 15 infusettes', 1, 2, '', 0, '', 314),
(362, 'Delonghi Dinamica 3515B', 1, 2, '<p>Système Boissons lactées : Buse vapeur simple</p>\n<p>Boissons réalisable : Expresso, Café Long (Lungo), Café, Café Filtre (basse pression), Mousse de lait manuel, Eau chaude</p>\n<p>Trappe à moulu : Oui</p>\n<p>Nombre de réglages du Broyeur : 13 positions</p>\n<p>Réglage intensité café : 5</p>\n<p>Température de percolation programmable : 3 niveaux</p>\n<p>Interface : Touches tactiles</p>\n<p>Type d\'écran : Écran à texte LCD</p>\n<p>Type de Broyeur<span style=\"white-space:pre;\"> </span>Acier</p>\n<p>2 cafés simultanés : Oui</p>\n<p>Rinçage des buses : Automatique</p>\n<p>Entretien du Groupe Café<span style=\"white-space:pre;\"> </span>Manuel : groupe café extractible</p>\n<p>Pression de la pompe : 15 Bars</p>\n<p>Garantie : 3 ans</p>\n<p>Coloris : Noir</p>\n<p>Matériau(x) : ABS Mat</p>\n<p>Volume du réservoir à eau : 1.8 l</p>\n<p>Volume du bac à grain : 300 g</p>\n<p>Nombre de bac à grains  : 1 bac</p>\n<p>Volume du bac à marcs : 14 galettes</p>\n<p>Dimensions (LxPxH) : 236 x 429 x 348 mm</p>\n<p>Poids<span style=\"white-space:pre;\"> </span> : 9.5 Kg</p>\n<p>Puissance (en Watts) : 1450 W</p>\n<p>Capacité journalière : jusqu\'à 30 cafés/jour</p>', 0, '', 314),
(363, 'Infuseur Gladys', 1, 2, '', 0, '', 314),
(364, 'Infuseur hippopotame', 1, 2, '', 0, '', 314),
(365, 'Dragée Reyanud - Mûre 150g', 1, 2, '', 0, '', 314),
(366, 'Amande crème de nougat - 140g', 1, 2, '', 0, '', 314),
(367, 'Détartrant Delonghi', 1, 2, '', 0, '', 314),
(368, 'Cartouche filtrante Delonghi', 1, 2, '', 0, '', 314),
(369, 'Rooibos caramel - 100g', 1, 2, '', 0, '', 314),
(370, 'Earl Grey - 15 infusettes', 1, 2, '', 0, '', 314),
(371, 'Secret d\'Antan - 15 infusettes', 1, 2, '', 0, '', 314),
(372, 'Peps - 15 infusettes', 1, 2, '', 0, '', 314),
(374, 'Gyokuro - 100g', 1, 2, '', 0, '', 314),
(376, 'Honeybush chocolat - 100g', 1, 2, '', 0, '', 314),
(377, 'Maté latino - 100g', 1, 2, '', 0, '', 314),
(378, 'Infusion Yetchuno - 100g', 1, 2, '', 0, '', 314),
(379, 'Croisière sur le Nil - 100g', 1, 30, '', 0, '', 314),
(380, 'Infusion Tout en douceur - 50g', 1, 29, '', 0, '', 314),
(381, 'Namas\'thé 100g', 1, 2, '', 0, '', 314),
(382, 'Infusion d\'antan - 100g', 1, 2, '', 0, '', 314),
(383, 'Thé blanc grenade cassis aloe 100g', 1, 2, '', 0, '', 314),
(384, 'Thé blanc framboise tonka 50g', 1, 2, '', 0, '', 314),
(385, 'L\'ambroisie du dragon 100g', 1, 30, '', 0, '', 314),
(386, 'Maté della Melagrana - 100g', 1, 30, '', 0, '', 314),
(388, 'Papouasie Nouvelle Guinée', 1, 2, '', 0, '', 314),
(389, 'Bonbon d\'anis 100g', 1, 2, '', 0, '', 314),
(390, 'Bâton de réglisse 100g', 1, 30, '', 0, '', 314),
(391, 'Thé vert menthe - 15 infusettes', 1, 2, '', 0, '', 314),
(392, 'Zen - 15 infusettes', 1, 2, '', 0, '', 314),
(393, 'La délicieuse - 15 infusettes', 1, 2, '', 0, '', 314),
(394, 'Croisière sur le Nil - 15 infusettes', 1, 2, '', 0, '', 314),
(395, 'Thé vert menthe - 100g', 1, 2, '', 0, '', 314),
(396, 'Thé vert citron - 100g', 1, 30, '', 0, '', 314),
(397, 'Thé vert coco ananas - 100g', 1, 30, '', 0, '', 314),
(398, 'Thé vert ananas fraise - 100g', 1, 30, '', 0, '', 314),
(399, 'Earl Grey - 100g', 1, 30, '', 0, '', 314),
(400, 'Infusion Chaï - 100g', 1, 30, '', 0, '', 314),
(401, 'Infusion verveine - 50g', 1, 2, '', 0, '', 314),
(402, 'Maté - 100g', 1, 30, '', 0, '', 314),
(403, 'Lapsang Souchong - 100g', 1, 30, '', 0, '', 314),
(404, 'Pu Erh - 100g', 1, 2, '', 0, '', 314),
(405, 'English Breakfast - 15 infusettes', 1, 31, '', 0, '', 314),
(406, 'Detox automne hiver - 15 infusettes', 1, 31, '', 0, '', 314),
(407, 'Lendemain de fête - 15 infusettes', 1, 31, '', 0, '', 314),
(409, 'Doux nectar - 100g', 1, 30, '', 0, '', 314),
(410, 'Thé vert cactus ananas - 100g', 1, 30, '', 0, '', 314),
(412, 'Tea maker 0.5l', 1, 22, '', 0, '', 314),
(413, 'Pu erh - 100g', 1, 30, '', 0, '', 314),
(414, 'Infusion Verveine - 50g', 1, 2, '', 0, '', 314);

-- --------------------------------------------------------

--
-- Structure de la table `produit_declinaison`
--

CREATE TABLE `produit_declinaison` (
  `id_produit_declinaison` int(11) NOT NULL,
  `id_produit` int(11) NOT NULL,
  `id_declinaison` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `produit_declinaison`
--

INSERT INTO `produit_declinaison` (`id_produit_declinaison`, `id_produit`, `id_declinaison`) VALUES
(1, 129, 7),
(2, 394, 4),
(3, 150, 27),
(4, 150, 28),
(5, 151, 25),
(6, 151, 26),
(7, 152, 25),
(8, 152, 26),
(9, 153, 27),
(10, 153, 28),
(11, 154, 25),
(12, 154, 26),
(13, 155, 25),
(14, 155, 26),
(15, 156, 25),
(16, 156, 26),
(17, 165, 25),
(18, 165, 26),
(19, 166, 25),
(20, 166, 26),
(21, 167, 25),
(22, 167, 26),
(23, 168, 25),
(24, 168, 26),
(25, 169, 27),
(26, 169, 28),
(27, 170, 21),
(28, 170, 22),
(29, 171, 25),
(30, 171, 26),
(31, 172, 25),
(32, 172, 26),
(33, 173, 25),
(34, 173, 26),
(35, 174, 25),
(36, 174, 26),
(37, 175, 25),
(38, 175, 26),
(39, 176, 25),
(40, 176, 26),
(41, 177, 25),
(42, 177, 26),
(43, 178, 25),
(44, 178, 26),
(45, 179, 25),
(46, 179, 26),
(47, 180, 25),
(48, 180, 26),
(49, 181, 25),
(50, 181, 26),
(51, 182, 25),
(52, 182, 26),
(53, 183, 25),
(54, 183, 26),
(55, 184, 25),
(56, 184, 26),
(57, 185, 25),
(58, 185, 26),
(59, 197, 30),
(60, 197, 31),
(61, 197, 32),
(62, 198, 30),
(63, 198, 31),
(64, 198, 32),
(65, 201, 30),
(66, 201, 31),
(67, 201, 32),
(68, 202, 30),
(69, 202, 31),
(70, 202, 32),
(71, 203, 30),
(72, 203, 31),
(73, 203, 32),
(74, 204, 30),
(75, 204, 31),
(76, 204, 32),
(77, 206, 1),
(78, 206, 6),
(79, 206, 7),
(80, 207, 1),
(81, 207, 6),
(82, 207, 7),
(83, 208, 1),
(84, 208, 6),
(85, 208, 7),
(86, 210, 1),
(87, 210, 2),
(88, 210, 3),
(89, 210, 4),
(90, 210, 5),
(91, 210, 6),
(92, 210, 7),
(93, 210, 24),
(94, 211, 1),
(95, 211, 6),
(96, 211, 7),
(97, 212, 1),
(98, 212, 6),
(99, 212, 7),
(100, 213, 1),
(101, 213, 6),
(102, 213, 7),
(103, 214, 1),
(104, 214, 6),
(105, 214, 7),
(106, 216, 1),
(107, 216, 2),
(108, 216, 3),
(109, 216, 4),
(110, 216, 5),
(111, 216, 6),
(112, 216, 7),
(113, 216, 24),
(114, 217, 1),
(115, 217, 2),
(116, 217, 3),
(117, 217, 4),
(118, 217, 5),
(119, 217, 6),
(120, 217, 7),
(121, 217, 24),
(122, 218, 1),
(123, 218, 2),
(124, 218, 3),
(125, 218, 4),
(126, 218, 5),
(127, 218, 6),
(128, 218, 7),
(129, 218, 24),
(130, 220, 1),
(131, 220, 2),
(132, 220, 3),
(133, 220, 4),
(134, 220, 5),
(135, 220, 6),
(136, 220, 7),
(137, 220, 24),
(138, 221, 1),
(139, 221, 2),
(140, 221, 3),
(141, 221, 4),
(142, 221, 5),
(143, 221, 6),
(144, 221, 7),
(145, 221, 24),
(146, 222, 1),
(147, 222, 2),
(148, 222, 3),
(149, 222, 4),
(150, 222, 5),
(151, 222, 6),
(152, 222, 7),
(153, 222, 24),
(154, 223, 1),
(155, 223, 2),
(156, 223, 3),
(157, 223, 4),
(158, 223, 5),
(159, 223, 6),
(160, 223, 7),
(161, 223, 24),
(162, 224, 1),
(163, 224, 2),
(164, 224, 3),
(165, 224, 4),
(166, 224, 5),
(167, 224, 6),
(168, 224, 7),
(169, 224, 24),
(170, 225, 25),
(171, 225, 26),
(172, 226, 25),
(173, 226, 26),
(174, 227, 25),
(175, 227, 26),
(176, 228, 27),
(177, 228, 28),
(178, 240, 25),
(179, 240, 26),
(180, 241, 25),
(181, 241, 26),
(182, 242, 25),
(183, 242, 26),
(184, 243, 25),
(185, 243, 26),
(186, 244, 25),
(187, 244, 26),
(188, 245, 25),
(189, 245, 26),
(190, 246, 30),
(191, 246, 31),
(192, 246, 32),
(193, 247, 1),
(194, 247, 2),
(195, 247, 3),
(196, 247, 4),
(197, 247, 5),
(198, 247, 6),
(199, 247, 7),
(200, 247, 24),
(201, 248, 1),
(202, 248, 2),
(203, 248, 3),
(204, 248, 4),
(205, 248, 5),
(206, 248, 6),
(207, 248, 7),
(208, 248, 24),
(209, 320, 30),
(210, 320, 31),
(211, 320, 32),
(212, 321, 30),
(213, 321, 31),
(214, 321, 32),
(215, 345, 2),
(216, 345, 3),
(217, 345, 4),
(218, 345, 5),
(219, 345, 24),
(220, 353, 7),
(221, 354, 7),
(222, 355, 1),
(223, 355, 7),
(224, 356, 7),
(225, 357, 25),
(226, 357, 26),
(227, 360, 2),
(228, 360, 3),
(229, 360, 4),
(230, 360, 5),
(231, 360, 24),
(232, 369, 21),
(233, 369, 22),
(234, 374, 21),
(235, 374, 22),
(236, 376, 21),
(237, 376, 22),
(238, 377, 21),
(239, 377, 22),
(240, 378, 21),
(241, 378, 22),
(242, 379, 21),
(243, 379, 22),
(244, 380, 21),
(245, 380, 22),
(246, 381, 21),
(247, 381, 22),
(248, 382, 21),
(249, 382, 22),
(250, 383, 21),
(251, 383, 22),
(252, 384, 27),
(253, 384, 28),
(254, 385, 21),
(255, 385, 22),
(256, 386, 21),
(257, 386, 22),
(258, 388, 1),
(259, 388, 2),
(260, 388, 3),
(261, 388, 4),
(262, 388, 5),
(263, 388, 6),
(264, 388, 7),
(265, 388, 24),
(266, 389, 21),
(267, 389, 22),
(268, 390, 21),
(269, 390, 22),
(270, 395, 21),
(271, 395, 22),
(272, 396, 21),
(273, 396, 22),
(274, 397, 21),
(275, 397, 22),
(276, 398, 21),
(277, 398, 22),
(278, 399, 21),
(279, 399, 22),
(280, 400, 21),
(281, 400, 22),
(282, 401, 21),
(283, 401, 22),
(284, 402, 21),
(285, 402, 22),
(286, 403, 21),
(287, 403, 22),
(288, 404, 21),
(289, 404, 22),
(290, 409, 21),
(291, 409, 22),
(292, 410, 21),
(293, 410, 22),
(294, 413, 21),
(295, 413, 22),
(296, 414, 21),
(297, 414, 22);

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

CREATE TABLE `role` (
  `id_role` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `power` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `role`
--

INSERT INTO `role` (`id_role`, `nom`, `power`) VALUES
(1, 'Rédacteur', 1),
(2, 'Administrateur', 2);

-- --------------------------------------------------------

--
-- Structure de la table `rubrique`
--

CREATE TABLE `rubrique` (
  `id_rubrique` int(11) NOT NULL,
  `titre` varchar(50) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `rubrique`
--

INSERT INTO `rubrique` (`id_rubrique`, `titre`, `description`) VALUES
(1, 'Bonjour', 'Description de test'),
(20, 'Ceci est un test du test', 'Val le best'),
(21, 'Test', '');

-- --------------------------------------------------------

--
-- Structure de la table `statut`
--

CREATE TABLE `statut` (
  `id_statut` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `statut`
--

INSERT INTO `statut` (`id_statut`, `nom`, `description`) VALUES
(1, 'Nouvelle commande', 'La commande viens d\'être créée.'),
(2, 'Acceptée ', 'La commande à été acceptée.'),
(3, 'Refusée', 'La commande à été refusée.\r\n'),
(4, 'En préparation', 'La commande est en préparation.'),
(5, 'En attente, de livraison', 'La commande est en attente de livraison.'),
(6, 'Livrée', 'La commande à été livrée en salle.'),
(7, 'Payée', 'La commande à été payée.'),
(8, 'Client partis avant livraison', 'Le client est partis avant la livraison.'),
(9, 'Client partis après livraison', 'Le client est partis après la livraison.'),
(10, 'Rupture de stock', 'La commande est en rupture de stock.'),
(11, 'Réclamation', 'Le client à demandé une réclamation après être livré.');

-- --------------------------------------------------------

--
-- Structure de la table `tva`
--

CREATE TABLE `tva` (
  `id_tva` int(11) NOT NULL,
  `pourcentage` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `tva`
--

INSERT INTO `tva` (`id_tva`, `pourcentage`) VALUES
(1, 20);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `afttable`
--
ALTER TABLE `afttable`
  ADD PRIMARY KEY (`id_table`);

--
-- Index pour la table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id_article`),
  ADD KEY `id_employe` (`id_employe`),
  ADD KEY `id_rubrique` (`id_rubrique`);

--
-- Index pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`id_categorie`);

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id_client`);

--
-- Index pour la table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`id_commande`),
  ADD KEY `id_table` (`id_table`),
  ADD KEY `id_statut` (`id_statut`);

--
-- Index pour la table `commande_declinaison`
--
ALTER TABLE `commande_declinaison`
  ADD PRIMARY KEY (`id_commande_declinaison`),
  ADD KEY `id_commande` (`id_commande`),
  ADD KEY `id_produit_declinaison` (`id_produit_declinaison`);

--
-- Index pour la table `commentaire`
--
ALTER TABLE `commentaire`
  ADD PRIMARY KEY (`id_commentaire`),
  ADD KEY `id_produit_declinaison` (`id_produit_declinaison`),
  ADD KEY `id_client` (`id_client`);

--
-- Index pour la table `declinaison`
--
ALTER TABLE `declinaison`
  ADD PRIMARY KEY (`id_declinaison`);

--
-- Index pour la table `employe`
--
ALTER TABLE `employe`
  ADD PRIMARY KEY (`id_employe`),
  ADD KEY `id_role` (`id_role`);

--
-- Index pour la table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`id_produit`),
  ADD KEY `id_tva` (`id_tva`),
  ADD KEY `id_categorie` (`id_categorie`);

--
-- Index pour la table `produit_declinaison`
--
ALTER TABLE `produit_declinaison`
  ADD PRIMARY KEY (`id_produit_declinaison`),
  ADD KEY `id_produit` (`id_produit`),
  ADD KEY `id_declinaison` (`id_declinaison`);

--
-- Index pour la table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id_role`);

--
-- Index pour la table `rubrique`
--
ALTER TABLE `rubrique`
  ADD PRIMARY KEY (`id_rubrique`);

--
-- Index pour la table `statut`
--
ALTER TABLE `statut`
  ADD PRIMARY KEY (`id_statut`);

--
-- Index pour la table `tva`
--
ALTER TABLE `tva`
  ADD PRIMARY KEY (`id_tva`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `afttable`
--
ALTER TABLE `afttable`
  MODIFY `id_table` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `article`
--
ALTER TABLE `article`
  MODIFY `id_article` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT pour la table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `id_categorie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `id_client` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `commande`
--
ALTER TABLE `commande`
  MODIFY `id_commande` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `commande_declinaison`
--
ALTER TABLE `commande_declinaison`
  MODIFY `id_commande_declinaison` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `employe`
--
ALTER TABLE `employe`
  MODIFY `id_employe` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=315;

--
-- AUTO_INCREMENT pour la table `produit`
--
ALTER TABLE `produit`
  MODIFY `id_produit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=415;

--
-- AUTO_INCREMENT pour la table `produit_declinaison`
--
ALTER TABLE `produit_declinaison`
  MODIFY `id_produit_declinaison` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=298;

--
-- AUTO_INCREMENT pour la table `role`
--
ALTER TABLE `role`
  MODIFY `id_role` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `rubrique`
--
ALTER TABLE `rubrique`
  MODIFY `id_rubrique` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT pour la table `statut`
--
ALTER TABLE `statut`
  MODIFY `id_statut` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `tva`
--
ALTER TABLE `tva`
  MODIFY `id_tva` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `article_ibfk_1` FOREIGN KEY (`id_employe`) REFERENCES `employe` (`id_employe`),
  ADD CONSTRAINT `article_ibfk_2` FOREIGN KEY (`id_rubrique`) REFERENCES `rubrique` (`id_rubrique`);

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `commande_ibfk_1` FOREIGN KEY (`id_table`) REFERENCES `afttable` (`id_table`),
  ADD CONSTRAINT `commande_ibfk_2` FOREIGN KEY (`id_statut`) REFERENCES `statut` (`id_statut`);

--
-- Contraintes pour la table `commande_declinaison`
--
ALTER TABLE `commande_declinaison`
  ADD CONSTRAINT `commande_declinaison_ibfk_1` FOREIGN KEY (`id_commande`) REFERENCES `commande` (`id_commande`),
  ADD CONSTRAINT `commande_declinaison_ibfk_2` FOREIGN KEY (`id_produit_declinaison`) REFERENCES `produit_declinaison` (`id_produit_declinaison`);

--
-- Contraintes pour la table `commentaire`
--
ALTER TABLE `commentaire`
  ADD CONSTRAINT `commentaire_ibfk_1` FOREIGN KEY (`id_produit_declinaison`) REFERENCES `produit_declinaison` (`id_produit_declinaison`),
  ADD CONSTRAINT `commentaire_ibfk_2` FOREIGN KEY (`id_client`) REFERENCES `client` (`id_client`);

--
-- Contraintes pour la table `employe`
--
ALTER TABLE `employe`
  ADD CONSTRAINT `employe_ibfk_1` FOREIGN KEY (`id_role`) REFERENCES `role` (`id_role`);

--
-- Contraintes pour la table `produit`
--
ALTER TABLE `produit`
  ADD CONSTRAINT `produit_ibfk_1` FOREIGN KEY (`id_tva`) REFERENCES `tva` (`id_tva`),
  ADD CONSTRAINT `produit_ibfk_2` FOREIGN KEY (`id_categorie`) REFERENCES `categorie` (`id_categorie`);

--
-- Contraintes pour la table `produit_declinaison`
--
ALTER TABLE `produit_declinaison`
  ADD CONSTRAINT `produit_declinaison_ibfk_1` FOREIGN KEY (`id_produit`) REFERENCES `produit` (`id_produit`),
  ADD CONSTRAINT `produit_declinaison_ibfk_2` FOREIGN KEY (`id_declinaison`) REFERENCES `declinaison` (`id_declinaison`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
