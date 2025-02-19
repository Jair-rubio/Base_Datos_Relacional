-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 19, 2025 at 06:06 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `escuela`
--

-- --------------------------------------------------------

--
-- Table structure for table `alumno`
--

CREATE TABLE `alumno` (
  `codigo` varchar(15) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Apellidos` varchar(50) NOT NULL,
  `edad` int(5) NOT NULL,
  `telefono` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `alumno`
--

INSERT INTO `alumno` (`codigo`, `Nombre`, `Apellidos`, `edad`, `telefono`) VALUES
('123456', 'Adriana', 'Polanco', 23, 656123894),
('459634', 'Frida', ' Olivas', 19, 656147859);

-- --------------------------------------------------------

--
-- Table structure for table `carrera`
--

CREATE TABLE `carrera` (
  `codigo` varchar(15) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Duracion` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `carrera`
--

INSERT INTO `carrera` (`codigo`, `Nombre`, `Duracion`) VALUES
('2056', 'Ingeneria en sistemas', '6 años'),
('2458', 'Astronomia', '5 años'),
('3248', 'Diseño Grafico', '5 años'),
('9514', 'Psicologia', '3 años'),
('9615', 'Medicina', 'Nunca sales');

-- --------------------------------------------------------

--
-- Table structure for table `inscripcion`
--

CREATE TABLE `inscripcion` (
  `codigoInscripcion` int(11) NOT NULL,
  `Fecha` varchar(25) NOT NULL,
  `CodigoAlumno` varchar(25) NOT NULL,
  `CodigoCarrera` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `inscripcion`
--

INSERT INTO `inscripcion` (`codigoInscripcion`, `Fecha`, `CodigoAlumno`, `CodigoCarrera`) VALUES
(98745, '19-feb2025', '459634', '3248'),
(123456, '19-feb-2025', '123456', '2458');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alumno`
--
ALTER TABLE `alumno`
  ADD PRIMARY KEY (`codigo`);

--
-- Indexes for table `carrera`
--
ALTER TABLE `carrera`
  ADD PRIMARY KEY (`codigo`);

--
-- Indexes for table `inscripcion`
--
ALTER TABLE `inscripcion`
  ADD PRIMARY KEY (`codigoInscripcion`),
  ADD UNIQUE KEY `FkCarrera` (`CodigoCarrera`),
  ADD KEY `FkAlumno` (`CodigoAlumno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `inscripcion`
--
ALTER TABLE `inscripcion`
  MODIFY `codigoInscripcion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123457;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `inscripcion`
--
ALTER TABLE `inscripcion`
  ADD CONSTRAINT `inscripcion_ibfk_1` FOREIGN KEY (`CodigoAlumno`) REFERENCES `alumno` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `inscripcion_ibfk_2` FOREIGN KEY (`CodigoCarrera`) REFERENCES `carrera` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
