-- phpMyAdmin SQL Dump
-- version 4.0.9
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 17, 2019 at 06:06 PM
-- Server version: 5.6.14
-- PHP Version: 5.5.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `comp3278`
--

--
-- Dumping data for table `books`
--

INSERT INTO `t4_books` (`bookID`, `name`, `description`, `price`, `picture`) VALUES
(1, 'Database System Concepts', 'Database System Concepts by Silberschatz, Korth and Sudarshan is now in its 6th edition and is one of the cornerstone texts of database education. It presents the fundamental concepts of database management in an intuitive manner geared toward allowing students to begin working with databases as quickly as possible.\r\nThe text is designed for a first course in databases at the junior/senior undergraduate level or the first year graduate level. It also contains additional material that can be used as supplements or as introductory material for an advanced course. Because the authors present concepts as intuitive descriptions, a familiarity with basic data structures, computer organization, and a high-level programming language are the only prerequisites. Important theoretical results are covered, but formal proofs are omitted. In place of proofs, figures and examples are used to suggest why a result is true.', 680, 'photos/1.jpg'),
(2, 'Operating System Concepts', 'Operating System Concepts, now in its ninth edition, continues to provide a solid theoretical foundation for understanding operating systems. The ninth edition has been thoroughly updated to include contemporary examples of how operating systems function. The text includes content to bridge the gap between concepts and actual implementations. End-of-chapter problems, exercises, review questions, and programming exercises help to further reinforce important concepts.  A new Virtual Machine provides interactive exercises to help engage students with the material.', 655, 'photos/2.jpg'),
(3, 'Operating Systems Concepts with Java', '* New edition of the bestseller provides readers with a clear description of the concepts that underlie operating systems\r\n* Uses Java to illustrate many ideas and includes numerous examples that pertain specifically to popular operating systems such as UNIX, Solaris 2, Windows NT and XP, Mach, the Apple Macintosh OS, IBM''s OS/2 and Linux\r\n* Style is even more hands-on than the previous edition, with extensive programming examples written in Java and C\r\n* New coverage includes recent advances in Windows 2000/XP, Linux, Solaris 9, and Mac OS X\r\n* Detailed case studies of Windows XP and Linux give readers full coverage of two very popular operating systems', 480, 'photos/3.jpg'),
(4, 'Introduction to Algorithms, 3rd Edition', 'Some books on algorithms are rigorous but incomplete; others cover masses of material but lack rigor. Introduction to Algorithms uniquely combines rigor and comprehensiveness. The book covers a broad range of algorithms in depth, yet makes their design and analysis accessible to all levels of readers. Each chapter is relatively self-contained and can be used as a unit of study. The algorithms are described in English and in a pseudocode designed to be readable by anyone who has done a little programming. The explanations have been kept elementary without sacrificing depth of coverage or mathematical rigor.The first edition became a widely used text in universities worldwide as well as the standard reference for professionals. The second edition featured new chapters on the role of algorithms, probabilistic analysis and randomized algorithms, and linear programming. The third edition has been revised and updated throughout. It includes two completely new chapters, on van Emde Boas trees and multithreaded algorithms, substantial additions to the chapter on recurrence (now called "Divide-and-Conquer"), and an appendix on matrices. It features improved treatment of dynamic programming and greedy algorithms and a new notion of edge-based flow in the material on flow networks. Many new exercises and problems have been added for this edition. As of the third edition, this textbook is published exclusively by the MIT Press.', 850, 'photos/4.jpg'),
(5, 'Three Blind Mice', 'Three blind mice. Three blind mice.<br>\r\nSee how they run. See how they run.<br>\r\nThey all ran after the farmer''s wife,<br>\r\nWho cut off their tails with a carving knife,<br>\r\nDid you ever see such a sight in your life,<br>\r\nAs three blind mice?', 99.9, 'photos/5.jpg');

-- --------------------------------------------------------

INSERT INTO `t4_authors` (`authorID`, `name`) VALUES
(1, 'Abraham Silberschatz'),
(2, 'Henry Korth'),
(3, 'S. Sudarshan'),
(4, 'Peter B. Galvin'),
(5, 'Greg Gagne'),
(6, 'Thomas H. Cormen'),
(7, 'Charles E. Leiserson'),
(8, 'Ronald L. Rivest'),
(9, 'Clifford Stein'),
(10, 'Jeffrey B. Fuerst');

-- --------------------------------------------------------


--
-- Dumping data for table `categories`
--

INSERT INTO `t4_categories` (`categoryID`, `name`) VALUES
(1, 'Computer Science'),
(2, 'Database'),
(3, 'Algorithms'),
(4, 'Operating systems'),
(5, 'Children'),
(6, 'Story');

--
-- Dumping data for table `belongs`
--

INSERT INTO `t4_belongs` (`bookID`, `categoryID`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(1, 2),
(4, 3),
(2, 4),
(3, 4),
(5, 5),
(5, 6);

-- --------------------------------------------------------


-- Dumping data for table `writes`
--

INSERT INTO `t4_writes` (`bookID`, `authorID`) VALUES
(1, 1),
(2, 1),
(3, 1),
(1, 2),
(1, 3),
(2, 4),
(3, 4),
(2, 5),
(3, 5),
(4, 6),
(4, 7),
(4, 8),
(4, 9),
(5, 10);

--
-- Constraints for dumped tables
--


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
