-- --------------------------------------------------------
-- Hôte:                         172.16.47.242
-- Version du serveur:           10.5.18-MariaDB-0+deb11u1 - Debian 11
-- SE du serveur:                debian-linux-gnu
-- HeidiSQL Version:             12.4.0.6659
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Listage de la structure de la base pour data
DROP DATABASE IF EXISTS `data`;
CREATE DATABASE IF NOT EXISTS `data` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `data`;

-- Listage de la structure de la table data. axis
DROP TABLE IF EXISTS `axis`;
CREATE TABLE IF NOT EXISTS `axis` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table data.axis : ~2 rows (environ)
REPLACE INTO `axis` (`id`, `name`) VALUES
	(1, 'Compétences'),
	(2, 'Numérique'),
	(3, 'Réactivité');

-- Listage de la structure de la table data. company
DROP TABLE IF EXISTS `company`;
CREATE TABLE IF NOT EXISTS `company` (
  `id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table data.company : ~0 rows (environ)

-- Listage de la structure de la table data. diagnostic
DROP TABLE IF EXISTS `diagnostic`;
CREATE TABLE IF NOT EXISTS `diagnostic` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `company_id` (`company_id`),
  CONSTRAINT `company_id_fk` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table data.diagnostic : ~0 rows (environ)

-- Listage de la structure de la table data. question
DROP TABLE IF EXISTS `question`;
CREATE TABLE IF NOT EXISTS `question` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `axis_id` int(11) NOT NULL,
  `question` varchar(512) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `axis_id_fk` (`axis_id`),
  CONSTRAINT `axis_id_fk` FOREIGN KEY (`axis_id`) REFERENCES `axis` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table data.question : ~29 rows (environ)
REPLACE INTO `question` (`id`, `axis_id`, `question`) VALUES
	(1, 1, 'Formations pour Apprendre à apprendre, changement de paradigme, "être à la page" (au-delà des compétences "justes" nécessaires) ?'),
	(2, 1, 'Le co-développement (outil d\'intelligence collective) existe-t-il dans l\'entreprise ?'),
	(3, 1, 'Les collaborateurs sont-ils amenés à partager leurs compétences et sous quelles formes ?'),
	(4, 1, 'Le mentoring (fonctionnement en binôme) existe-t-il pour assurer le transfert de compétences ?'),
	(5, 1, 'Les managers sont-ils aussi formateurs sur certains sujet pour l\'entreprise entière ?'),
	(6, 1, 'L\'entreprise favorise-t-elle l\'excellence technique ? (Principe 9 du Manifeste Agile) ?'),
	(7, 1, 'Déployez vous les pratiques du \'Faire Agile\', c\'est-à-dire une ou plusieurs des "méthodes" agiles ?'),
	(8, 1, 'Votre entreprise promeut-elle un "état d\'esprit agile" ?'),
	(9, 1, 'Votre entreprise gère-t-elle humainement les compétences ?'),
	(10, 2, 'Votre entreprise dégage t-elle une part de CA  par des produits ou services en ligne ?'),
	(11, 2, 'La mise en place d’outils numériques a-t-elle permis d\'optimiser les coûts, les délais et la qualité ?'),
	(12, 2, 'Comment les outils sont-ils intégrés dans les process de l’entreprise ?'),
	(13, 2, 'Comment partagez-vous les données numériques avec les parties prenantes (clients, fournisseurs,…) ?'),
	(14, 2, 'Mesurez-vous les impacts du numérique sur votre entreprise ?'),
	(15, 2, 'Quel est l’impact du numérique sur la démarche RSE de l’entreprise ?'),
	(16, 2, 'Existe-t-il des freins (stratégiques, financiers,…) à l’ investissement dans les outils numériques ?'),
	(17, 2, 'L’entreprise dispose-t-elle : d’un site internet, d’un compte LinkedIn, d’une page Facebook, d’un compte Twitter,... ?'),
	(18, 2, 'Comment utilisez-vous le numérique dans la relation client ? (nouveau modèle de vente, nouveau modèle d’échanges avec les clients, communauté, story, chat,...)?'),
	(19, 2, 'L’entreprise dispose-t-elle d’un community manager ?'),
	(20, 2, 'Certains de vos collaborateurs sont-ils actifs sur les réseaux sociaux au nom de l’entreprise ?'),
	(21, 2, 'Comment mesurez-vous et exploitez-vous les données issues du site de votre entreprise ?'),
	(22, 2, 'Avez-vous observé chez vos concurrents des pratiques innovantes ?'),
	(23, 2, 'Vos collaborateurs sont-ils équipés de nouveaux équipements numériques de travail (PC portable, tablette, smartphone,…) ?'),
	(24, 2, 'L’arrivée des outils digitaux a-t-elle eu un impact sur les pratiques et la culture de l’entreprise ?'),
	(25, 2, 'Comment vous êtes-vous approprié et comment avez-vous accompagné ces évolutions?'),
	(26, 2, 'Les nouvelles possibilités technologiques ont-elles fait évoluer le modèle d’organisation de l’entreprise et/ou votre management, vers plus de collaboration avec des acteurs internes ou externes ?'),
	(27, 2, 'Mobilisez-vous des outils de veille et mettez-vous en œuvre des modalités de curation et de partage de l’ information ?'),
	(28, 2, 'Les fonctionnalités des outils sont-elles augmentées par la pratique de vos collaborateurs ?'),
	(29, 2, 'Comment accompagnez-vous vos collaborateurs dans la transition numérique ?'),
	(30, 3, 'Valeur supérieure utilisable livrée plus tôt (Fonction principale utilisable dès les premières versions)'),
	(31, 3, 'Réactivité face aux impératifs prépondérants'),
	(32, 3, 'Mesure de la vélocité de l\'équipe (indicateur de suivi du travail d\'une équipe de conception)'),
	(33, 3, 'Les installations techniques et de gestion sont modernes (TIC/ERP/CRM)'),
	(34, 3, 'Les équipes sont en capacité d\'autonomiser une partie de leurs tâches'),
	(35, 3, 'Les équipes s’inscrivent dans un cadre Agile Lean'),
	(36, 3, 'Les mécanismes de livraison et de synchronisation sont matures'),
	(37, 3, 'Les innovations produit tiennent compte de l\'urgence climatique'),
	(38, 3, 'Les processus internes sont remis en cause pour diminuer leur impact environnemental'),
	(39, 3, 'Les parties prenantes sont sélectionnées en fonction de leur éthique vis-à-vis du développement durable'),
	(40, 3, 'Veille stratégique');

-- Listage de la structure de la table data. response
DROP TABLE IF EXISTS `response`;
CREATE TABLE IF NOT EXISTS `response` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `response_option_id` int(10) unsigned DEFAULT NULL,
  `diagnostic_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `response_option_id_fk` (`response_option_id`),
  KEY `diagnostic_id_fk` (`diagnostic_id`),
  CONSTRAINT `diagnostic_id_fk` FOREIGN KEY (`diagnostic_id`) REFERENCES `diagnostic` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `response_option_id_fk` FOREIGN KEY (`response_option_id`) REFERENCES `response_option` (`id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table data.response : ~0 rows (environ)

-- Listage de la structure de la table data. response_option
DROP TABLE IF EXISTS `response_option`;
CREATE TABLE IF NOT EXISTS `response_option` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `question_id` int(10) unsigned NOT NULL,
  `response` varchar(512) NOT NULL DEFAULT '',
  `score` int(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `question_id_pk` (`question_id`),
  CONSTRAINT `question_id_pk` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=363 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table data.response_option : ~88 rows (environ)
REPLACE INTO `response_option` (`id`, `question_id`, `response`, `score`) VALUES
	(1, 1, 'Désintérêt pour l\'amélioration de la compétence des équipes', 0),
	(4, 1, 'Nombreuses formations métiers dans le plan de formation', 1),
	(7, 1, 'Possibilité de choisir et de suivre des formations "annexes" au métier et/ou temps dédié pour de la veille ou de l\'auto-formation', 2),
	(10, 2, 'Pas du tout', 0),
	(13, 2, 'Quelques initiatives', 1),
	(16, 2, 'Démarche instaurée et pratiquée régulièrement', 2),
	(19, 3, 'Aucune initiative', 0),
	(22, 3, 'Capitalisation d\'un certain nombre de savoirs', 1),
	(25, 3, 'Véritable communauté de pratiques mise en place', 2),
	(28, 4, 'Aucune initiative', 0),
	(31, 4, 'Quelques initiatives', 1),
	(34, 4, 'Systématiquement lors d\'une prise de poste', 2),
	(37, 5, 'Non', 0),
	(40, 5, 'Quelques fois', 1),
	(43, 5, 'Quasi systématiquement', 2),
	(46, 6, 'Pas du tout', 0),
	(49, 6, 'Oui un peu', 1),
	(52, 6, 'Oui', 2),
	(55, 7, 'NON, nous les projets sont tous en cycle en V / cascade', 0),
	(58, 7, 'Quelques projets pilotes', 1),
	(61, 7, 'Déploiement systématique d\'une ou plusieurs méthodes', 2),
	(64, 8, 'Non', 0),
	(67, 8, 'Quelques valeurs agiles promues', 1),
	(70, 8, 'Oui', 2),
	(73, 9, 'Non', 0),
	(76, 9, 'Un peu', 1),
	(79, 9, 'Oui', 2),
	(82, 10, 'Moins de 10%', 0),
	(85, 10, 'Oui environ 20%', 1),
	(88, 10, 'Oui environ 30%', 2),
	(91, 11, 'Aucun', 0),
	(94, 11, 'Oui mais pas pour tous les critères', 1),
	(97, 11, 'Oui pour tous les critères ', 2),
	(100, 12, 'Absence d\'outils ou de procédures, manque d\'utilité', 0),
	(103, 12, 'En partie, les outils ne sont pas toujours adaptés à l\'activité et pas toujours rattachés à des procédures, sans entraver ses principales fonctions', 1),
	(106, 12, 'A part entière, il existe des procédures et formations aux outils, ces outils sont intituitifs et adaptés à l\'activité', 2),
	(109, 13, 'En mode novice : au mieux par mail ou via le site internet', 0),
	(112, 13, 'En mode collaboratif : quelques aménagements (type sharepoint, drive) pour des sujets plutôt ponctuels', 1),
	(115, 13, 'En mode avancé : des plateformes dédiées (type extranet, applications) sont intégrées au mode de partage permanent', 2),
	(118, 14, 'Non', 0),
	(121, 14, 'Oui et non on observe sans mesurer', 1),
	(124, 14, 'Oui des outils de mesure sont en place', 2),
	(127, 15, 'Absence de démarche RSE', 0),
	(130, 15, 'C\'est un sujet observé de loin, on traite les questions d\'obligation légales sans aller plus loin', 1),
	(133, 15, 'Le numérique est un sujet totalement rattaché à la démarche RSE', 2),
	(136, 16, 'Oui la statégie de l\'entreprise n\'est pas orientée en faveur du numérique, elle n\'investit pas', 0),
	(139, 16, 'Oui l\'entreprise est plutôt frileuse, on ne dépense que le strict nécessaire pour que les outils fonctionnent sans recherche de performance', 1),
	(142, 16, 'Non des budgets sont alloués et l\'entreprise a bien compris cette nécessité dans sa stratégie', 2),
	(145, 17, 'Non le site/la page réseau sont inexistants ou inactifs', 0),
	(148, 17, 'Oui mais seulement sur le site internet', 1),
	(151, 17, 'Oui la présence de l\'entreprise sur les réseaux est visible, elle correspond au secteur d\'activité', 2),
	(154, 18, 'Absence de plateforme de contact', 0),
	(157, 18, 'Des accès dédiés pour les échanges entre le client et l\'entreprise sont existent, le suivi des contacts n\'est pas optimal', 1),
	(160, 18, 'Plusieurs modes d\'utilisation sont possibles pour échanger avec l\'externe, ils sont performants et adaptés avec l\'activité de l\'entreprise', 2),
	(163, 19, 'Non aucune personne n\'est dédiée ', 0),
	(166, 19, 'Non mais une personne se charge de l\'animation des réseaux sociaux parmi ses autres tâches', 1),
	(169, 19, 'Oui', 2),
	(172, 20, 'Non ou rarement', 0),
	(175, 20, 'Oui sans incitation', 1),
	(178, 20, 'Oui avec des incitations de l\'entreprise pour le faire', 2),
	(181, 21, 'Absence de suivi', 0),
	(184, 21, 'Des indicateurs sont en place mais plutôt de façon passive, ils servent à mesurer ', 1),
	(187, 21, 'Des indicateurs sont mis en place afin de mesurer l\'efficacité et l\'impact du site sur les réseaux, une recherche de performance est en place pour toucher toujours plus et mieux', 2),
	(190, 22, 'Oui ils sont tellement performants et en avance que nous pourrions perdre des marchés', 0),
	(193, 22, 'Oui ils ont quelques belles idées, si seulement on pouvait faire aussi bien qu\'eux', 1),
	(196, 22, 'Oui elles servent comme base de reflexion et de développement pour notre propre entreprise. On peut être rivaliser !', 2),
	(199, 23, 'Les fonctions supports ne sont pas amenées à être équipé pour le travail à distance. L\'entreprise fonctionne majoritairement sur le mode papier.', 0),
	(202, 23, 'Les processus s\'appuient rarement sur la numérisation des données et les outils numériques. Le potentiel ne semble pas pleinement exploité.', 1),
	(205, 23, 'Les processus de travail s\'appuient sur des outils numériques quand ceux-ci sont possibles. L\'ensemble des fonctions de l\'entreprise sont équipées pour pouvoir réaliser le travail à distance quand celui-ci est possible', 2),
	(208, 24, 'Non au contraire, peu de monde y adhère', 0),
	(211, 24, 'Oui dans l\'ensemble toutefois nous rencontrons parfois des contraintes (pratiques, techniques,…)', 1),
	(214, 24, 'Oui gain de temps, facilité, économies et fiabilité', 2),
	(217, 25, 'Absence de communication et d\'accompagnement', 0),
	(220, 25, 'La communication n\'est pas parfaite, les personnes qui peuvent se sentir en difficultés avec les nouvelles pratiques ne sont pas forcémment considérées.', 1),
	(223, 25, 'Tout est en place pour faciliter la compréhension et l\'adhésion aux nouveaux outils/pratiques', 2),
	(226, 26, 'L\'organisation est en silot, absence de projets transversaux et d\'interactions avec les autres sites', 0),
	(229, 26, 'Oui quelques évolutions s\'opèrent pour travailler en inter-service ou avec l\'externe, toutefois le potentiel n\'est pas pleinement exploité', 1),
	(232, 26, 'Oui on sort complétement du mode silot et on favorise le mode projet', 2),
	(235, 27, 'Absence de veille', 0),
	(238, 27, 'Il y a un peu de benchmark toutefois les décisions d\'évolutions sont un peu tardive (quand il n y a plus le choix)', 1),
	(241, 27, 'Oui l\'entreprise est en capacité de mesurer sa performance et de réagir rapidement pour se mettre à jour', 2),
	(244, 28, 'Absence de prise en compte des pratiques terrain', 0),
	(247, 28, 'Oui mais les outils sont vieillissants, il y a des freins pour les faire évoluer', 1),
	(250, 28, 'Oui totalement les outils s\'adaptent au terrain quotidiennement', 2),
	(253, 29, 'Absence d\'accompagnement', 0),
	(256, 29, 'L\'entreprise accompagne en faisant de son mieux pour faire adhérer les autres, il y a parfois quelques blocages. J\'aimerais parfois être moi-même accompagné', 1),
	(259, 29, 'L\'entreprise est pro-active par la promotion des innovations et des outils numériques.', 2),
	(266, 30, 'Pas de phase de validation intermédiaire', 0),
	(269, 30, 'Prototype fonctionnel intermédiaire livré au client', 1),
	(272, 30, 'Principe du MVP respecté : Minimum Viable Product / la version d\'un produit qui permet d\'obtenir un maximum de retours client avec un minimum d\'effort', 2),
	(275, 31, 'Pas de modification possible en cours de conception', 0),
	(278, 31, 'Modifications en cours de conception engendrant alors du retard', 1),
	(281, 31, 'L\'équipe de conception s\'adapte en cas de modification en cours de conception', 2),
	(284, 32, 'Jamais', 0),
	(287, 32, 'Suivi des tâches', 1),
	(290, 32, 'Mesure de la vélocité', 2),
	(293, 33, 'Le système d\'information freine toute tentative de réagir rapidement', 0),
	(296, 33, 'Le système d\'information permet avec quelques difficultés d\'avoir de la réactivité', 1),
	(299, 33, 'En cas de besoin, le système d\'information favorise la réactivité', 2),
	(302, 34, 'Jamais', 0),
	(305, 34, 'On laisse la possibilité de créer quelques macros Excel/VBA', 1),
	(308, 34, 'L\'entreprise équipe et forme ses équipes à la création de site web ou app via des outils no-code', 2),
	(311, 35, 'Pas de démarche Agile/Lean initiée dans l\'entreprise', 0),
	(314, 35, 'Plusieurs concepts Agile/Lean sont mis en œuvre dans l\'entreprise', 1),
	(317, 35, 'Les concepts Agile/Lean sont inscrits dans l\'ADN de l\'entreprise : Satisfaction du client avec des livraisons au plu tôt et régulières, accepter les changements, lisser les activités, collaboration quotidienne avec les parties prenantes, proximité terrain, autonomie des équipes dans la résolution de problèmes, amélioration continue...', 2),
	(320, 36, 'Pas de démarche de tension des flux', 0),
	(323, 36, 'Quelques concepts du juste à temps sont mis en œuvre pour tendre le flux', 1),
	(326, 36, 'Concepts du juste à temps maîtrisés (production rythmée par la demande client, peu d\'en-cours)', 2),
	(329, 37, 'Auxune réflexion sur cet axe', 0),
	(332, 37, 'Des premières initiatives ont été lancées', 1),
	(335, 37, 'Systématiquement', 2),
	(338, 38, 'Auxune réflexion sur cet axe', 0),
	(341, 38, 'Des premières initiatives ont été lancées', 1),
	(344, 38, 'Systématiquement', 2),
	(347, 39, 'Auxune réflexion sur cet axe', 0),
	(350, 39, 'Des premières initiatives ont été lancées', 1),
	(353, 39, 'Systématiquement', 2),
	(356, 40, 'Pas de veille', 0),
	(359, 40, 'La veille stratégique de l\'entreprise permet d\'anticiper les évolutions et les innovations', 1),
	(362, 40, 'La veille stratégique de l\'entreprise permet d\'anticiper les disruptions nécessaires', 2);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
