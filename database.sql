-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 24, 2024 at 01:21 PM
-- Server version: 5.7.31
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `storybook`
--

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
CREATE TABLE IF NOT EXISTS `comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `post` int(11) NOT NULL,
  `user` varchar(20) NOT NULL,
  `text` varchar(250) NOT NULL,
  `created` timestamp NOT NULL,
  `last_modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`comment_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`comment_id`, `post`, `user`, `text`, `created`, `last_modified`) VALUES
(2, 3, 'test', 'Here, I am commenting on my own post!\nP.S. I edited this comment!', '2024-05-23 14:01:53', '2024-05-23 14:12:15');

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
CREATE TABLE IF NOT EXISTS `post` (
  `post_id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(20) NOT NULL,
  `text` varchar(1000) NOT NULL,
  `image` blob,
  `created` timestamp NOT NULL,
  `last_modified` timestamp NULL DEFAULT NULL,
  `comments_count` int(11) NOT NULL DEFAULT '0',
  `likes_count` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`post_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`post_id`, `user`, `text`, `image`, `created`, `last_modified`, `comments_count`, `likes_count`) VALUES
(2, 'test', 'This post was updated', NULL, '2024-05-23 13:21:49', '2024-05-23 13:22:29', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `react`
--

DROP TABLE IF EXISTS `react`;
CREATE TABLE IF NOT EXISTS `react` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(20) NOT NULL,
  `post` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `username` varchar(15) NOT NULL,
  `hashed_password` varchar(64) NOT NULL,
  `email` varchar(20) NOT NULL,
  `verified` tinyint(1) NOT NULL DEFAULT '0',
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `dob` date NOT NULL,
  `bio` varchar(150) DEFAULT NULL,
  `profile_picture` blob,
  `posts_count` int(11) NOT NULL DEFAULT '0',
  `confirmed` tinyint(1) DEFAULT '0',
  `verificationCode` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`username`, `hashed_password`, `email`, `verified`, `first_name`, `last_name`, `dob`, `bio`, `profile_picture`, `posts_count`, `confirmed`, `verificationCode`) VALUES
('test', '$2a$10$JuLhmvyAy36zhMRSVNVr1uxJg62HtELqTb5yxJ.BM5H5rtEkE5UUi', 'test@test.com', 0, 'te', 'st', '1999-12-25', NULL, NULL, 0, 1, NULL),
('test1', '$2a$10$PXFKY9/.IR.jQqvxbuf/5.mEwjdbgRSy0112s.6siptezu51l6xXa', 'test1@test.com', 0, 'te1', 'st1', '1995-04-16', 'I am a auther. I write novels.', NULL, 0, 1, NULL);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
