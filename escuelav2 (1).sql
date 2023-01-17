-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-01-2023 a las 22:11:27
-- Versión del servidor: 10.4.25-MariaDB
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `escuelav2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnos`
--

CREATE TABLE `alumnos` (
  `IdAlumnos` int(11) NOT NULL,
  `Nombre` varchar(255) NOT NULL,
  `Institucion` varchar(255) NOT NULL,
  `TipoServ` varchar(130) NOT NULL,
  `Horas` varchar(100) NOT NULL,
  `Fecha` varchar(100) NOT NULL,
  `Area` varchar(50) NOT NULL,
  `Direccion` varchar(150) NOT NULL,
  `NumCel` varchar(10) NOT NULL,
  `Correo` varchar(100) NOT NULL,
  `NumEmerg` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `alumnos`
--

INSERT INTO `alumnos` (`IdAlumnos`, `Nombre`, `Institucion`, `TipoServ`, `Horas`, `Fecha`, `Area`, `Direccion`, `NumCel`, `Correo`, `NumEmerg`) VALUES
(17, 'Tatiana Diaz', 'UPH 480 horas', 'Estadias', '500 hrs', '17/01/2023', 'catastro', 'campanario #2 col centro', '2221260724', 'jmreclu2225@gmail.com', '2721260724'),
(22, 'John', 'PH', 'Estancias', '700 hrs', '12/06/2024', 'Alumbrado Publico', 'Mendoza ', '2291913673', 'gio@1124', '229089786'),
(23, 'GIOVANNI EUGENIO HERNANDEZ', 'ITSZ', 'Otro...', '600 hrs', '12/07/2023', 'catastro', 'Mendoza ', '2283737387', 'gio@1124', '2323525253');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documentos`
--

CREATE TABLE `documentos` (
  `IdDocs` int(11) NOT NULL,
  `nombreDoc` varchar(255) NOT NULL,
  `Id_Alumno_fk` int(255) NOT NULL,
  `ruta` varchar(130) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `documentos`
--

INSERT INTO `documentos` (`IdDocs`, `nombreDoc`, `Id_Alumno_fk`, `ruta`) VALUES
(68, 'Carta de Aceptación', 17, 'fpdf/Pago Derecho Vehicular.pdf');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `login`
--

CREATE TABLE `login` (
  `id` int(2) NOT NULL,
  `usuario` varchar(30) NOT NULL,
  `contraseña` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `login`
--

INSERT INTO `login` (`id`, `usuario`, `contraseña`) VALUES
(1, 'Admin1', 'DepartRecluNog23');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `misdocumentos`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `misdocumentos` (
`IdDocs` int(11)
,`nombreDoc` varchar(255)
,`Nombre` varchar(255)
,`ruta` varchar(130)
,`Id_Alumno_fk` int(255)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `misdocumentos`
--
DROP TABLE IF EXISTS `misdocumentos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `misdocumentos`  AS SELECT `d`.`IdDocs` AS `IdDocs`, `d`.`nombreDoc` AS `nombreDoc`, `a`.`Nombre` AS `Nombre`, `d`.`ruta` AS `ruta`, `d`.`Id_Alumno_fk` AS `Id_Alumno_fk` FROM (`documentos` `d` join `alumnos` `a` on(`d`.`Id_Alumno_fk` = `a`.`IdAlumnos`))  ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  ADD PRIMARY KEY (`IdAlumnos`);

--
-- Indices de la tabla `documentos`
--
ALTER TABLE `documentos`
  ADD PRIMARY KEY (`IdDocs`),
  ADD KEY `fk_documentos_alumnos` (`Id_Alumno_fk`);

--
-- Indices de la tabla `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usuario` (`usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  MODIFY `IdAlumnos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `documentos`
--
ALTER TABLE `documentos`
  MODIFY `IdDocs` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT de la tabla `login`
--
ALTER TABLE `login`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `documentos`
--
ALTER TABLE `documentos`
  ADD CONSTRAINT `fk_documentos_alumnos` FOREIGN KEY (`Id_Alumno_fk`) REFERENCES `alumnos` (`IdAlumnos`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
