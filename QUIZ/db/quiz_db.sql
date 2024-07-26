-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 26, 2024 at 10:25 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `quiz_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `answers`
--

CREATE TABLE `answers` (
  `id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `answer_text` text NOT NULL,
  `is_correct` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `answers`
--

INSERT INTO `answers` (`id`, `question_id`, `answer_text`, `is_correct`) VALUES
(1, 1, 'Paris', 1),
(2, 1, 'London', 0),
(3, 2, '4', 1),
(4, 2, '5', 0),
(5, 3, 'America', 1),
(6, 3, 'India', 0),
(7, 4, '10', 1),
(8, 4, '12', 0),
(9, 5, '41', 1),
(10, 5, '40', 0);

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int(11) NOT NULL,
  `question_text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `question_text`) VALUES
(1, 'What is the capital of France?'),
(2, 'What is 2 + 2?'),
(3, 'What is the capital of England?'),
(4, 'What is 5 + 5?'),
(5, 'What is 20 + 21?');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`) VALUES
(1, 'vishnu'),
(2, 'abhi'),
(3, 'abhiz'),
(4, 'alan'),
(5, 'john senass'),
(6, 'ajju'),
(7, 'raj'),
(8, 'ajzz'),
(9, 'jada'),
(10, 'qwasq'),
(11, 'Iaq'),
(12, 'Nithi'),
(13, 'Nithis'),
(14, 'niyas'),
(15, 'eech'),
(16, 'yaqs'),
(17, 'nmees'),
(18, 'renju'),
(19, 'kj'),
(20, 'qqqq'),
(21, 'Pass'),
(22, 'peeli'),
(23, 'Abhinavu Yadhavu'),
(24, 'Amalz'),
(25, 'sss');

-- --------------------------------------------------------

--
-- Table structure for table `user_answers`
--

CREATE TABLE `user_answers` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `answer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_answers`
--

INSERT INTO `user_answers` (`id`, `user_id`, `question_id`, `answer_id`) VALUES
(1, 1, 1, 1),
(2, 1, 1, 1),
(3, 1, 1, 1),
(4, 1, 1, 1),
(5, 1, 1, 1),
(6, 1, 1, 1),
(7, 1, 1, 1),
(8, 1, 1, 1),
(9, 1, 1, 1),
(10, 1, 1, 1),
(11, 1, 1, 1),
(12, 1, 1, 1),
(13, 1, 1, 1),
(14, 1, 1, 1),
(15, 1, 1, 1),
(16, 1, 1, 1),
(17, 1, 1, 1),
(18, 1, 2, 3),
(19, 2, 1, 2),
(20, 2, 1, 2),
(21, 2, 1, 2),
(22, 2, 1, 2),
(23, 2, 1, 2),
(24, 2, 1, 2),
(25, 2, 1, 2),
(26, 2, 1, 2),
(27, 2, 1, 2),
(28, 2, 1, 2),
(29, 2, 1, 2),
(30, 2, 1, 1),
(31, 2, 1, 1),
(32, 2, 1, 1),
(33, 2, 1, 1),
(34, 2, 1, 1),
(35, 2, 1, 1),
(36, 2, 1, 1),
(37, 2, 1, 1),
(38, 2, 1, 1),
(39, 2, 1, 1),
(40, 2, 1, 1),
(41, 2, 1, 2),
(42, 2, 1, 2),
(43, 2, 1, 2),
(44, 2, 1, 2),
(45, 2, 1, 2),
(46, 2, 1, 2),
(47, 2, 2, 4),
(48, 3, 1, 2),
(49, 3, 2, 4),
(50, 3, 1, 1),
(51, 3, 2, 3),
(52, 4, 1, 2),
(53, 4, 2, 3),
(54, 5, 1, 1),
(55, 5, 2, 3),
(56, 8, 1, 1),
(57, 8, 2, 4),
(58, 9, 1, 1),
(59, 9, 2, 3),
(60, 10, 1, 1),
(61, 10, 2, 3),
(62, 10, 3, 5),
(63, 10, 4, 8),
(64, 11, 1, 2),
(65, 11, 2, 3),
(66, 11, 3, 5),
(67, 11, 4, 7),
(68, 12, 1, 2),
(69, 12, 2, 3),
(70, 12, 3, 5),
(71, 12, 4, 7),
(72, 12, 1, 1),
(73, 12, 2, 3),
(74, 12, 3, 5),
(75, 12, 4, 7),
(76, 13, 1, 2),
(77, 13, 2, 3),
(78, 13, 3, 5),
(79, 13, 4, 7),
(80, 14, 1, 2),
(81, 14, 2, 3),
(82, 14, 3, 5),
(83, 14, 4, 7),
(84, 14, 1, 1),
(85, 14, 2, 3),
(86, 14, 3, 5),
(87, 14, 4, 7),
(88, 15, 1, 1),
(89, 15, 2, 4),
(90, 15, 3, 5),
(91, 15, 4, 7),
(92, 15, 1, 1),
(93, 15, 2, 3),
(94, 15, 3, 5),
(95, 15, 4, 7),
(96, 16, 1, 1),
(97, 16, 2, 4),
(98, 16, 3, 5),
(99, 16, 4, 7),
(100, 16, 1, 1),
(101, 16, 2, 3),
(102, 16, 3, 5),
(103, 16, 4, 7),
(104, 17, 1, 2),
(105, 17, 2, 3),
(106, 17, 3, 5),
(107, 17, 4, 7),
(108, 17, 1, 1),
(109, 17, 2, 3),
(110, 17, 3, 5),
(111, 17, 4, 7),
(112, 18, 1, 1),
(113, 18, 2, 4),
(114, 18, 3, 5),
(115, 18, 4, 7),
(116, 18, 1, 1),
(117, 18, 2, 3),
(118, 18, 3, 5),
(119, 18, 4, 7),
(120, 19, 1, 2),
(121, 19, 2, 3),
(122, 19, 3, 5),
(123, 19, 4, 7),
(124, 19, 1, 1),
(125, 19, 2, 3),
(126, 19, 3, 5),
(127, 19, 4, 7),
(128, 20, 1, 2),
(129, 20, 2, 4),
(130, 20, 3, 6),
(131, 20, 4, 7),
(132, 20, 1, 1),
(133, 20, 2, 4),
(134, 20, 3, 6),
(135, 20, 4, 7),
(136, 21, 1, 1),
(137, 21, 2, 3),
(138, 21, 3, 5),
(139, 21, 4, 7),
(140, 22, 1, 1),
(141, 22, 2, 4),
(142, 22, 3, 5),
(143, 22, 4, 7),
(144, 23, 1, 1),
(145, 23, 2, 3),
(146, 23, 3, 5),
(147, 23, 4, 7),
(148, 23, 5, 10),
(149, 24, 1, 1),
(150, 24, 2, 3),
(151, 24, 3, 5),
(152, 24, 4, 7),
(153, 24, 5, 10),
(154, 25, 1, 1),
(155, 25, 2, 3),
(156, 25, 3, 5),
(157, 25, 4, 7),
(158, 25, 5, 9);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `question_id` (`question_id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_answers`
--
ALTER TABLE `user_answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `question_id` (`question_id`),
  ADD KEY `answer_id` (`answer_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `answers`
--
ALTER TABLE `answers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `user_answers`
--
ALTER TABLE `user_answers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=159;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `answers`
--
ALTER TABLE `answers`
  ADD CONSTRAINT `answers_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_answers`
--
ALTER TABLE `user_answers`
  ADD CONSTRAINT `user_answers_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_answers_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_answers_ibfk_3` FOREIGN KEY (`answer_id`) REFERENCES `answers` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
