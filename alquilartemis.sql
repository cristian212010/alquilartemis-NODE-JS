-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-06-2023 a las 06:12:04
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `alquilartemis`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id_categoria` int(11) NOT NULL,
  `nombre_categoria` varchar(100) NOT NULL,
  `descripcion_categoria` varchar(255) NOT NULL,
  `img_categoria` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id_categoria`, `nombre_categoria`, `descripcion_categoria`, `img_categoria`) VALUES
(1, 'Herramientas', 'Herramientas inalámbricas y para talleres. Diseño pionero, tecnología y alta durabilidad.', ''),
(2, 'Materia Prima', 'Compra en línea Materiales de Construcción, la Tienda con los mejores precios con envío gratis o retiro en tienda. ', ''),
(3, 'Acero', 'Encuentra los materiales que necesitas para tu proyecto de construcción. Contamos con una amplia variedad de productos de gran calidad.', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `constructoras`
--

CREATE TABLE `constructoras` (
  `id_constructora` int(11) NOT NULL,
  `nombre_constructora` varchar(100) NOT NULL,
  `nit_constructora` int(11) NOT NULL,
  `nombre_representante` varchar(100) NOT NULL,
  `email_contacto` varchar(120) DEFAULT NULL,
  `telefono_contacto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `constructoras`
--

INSERT INTO `constructoras` (`id_constructora`, `nombre_constructora`, `nit_constructora`, `nombre_representante`, `email_contacto`, `telefono_contacto`) VALUES
(1, 'Omega CORP S.A.S', 564856156, 'Fransisco Pérez', 'omega@corp.com', 1456156),
(2, 'Tríade Constructura S.A.S', 564874578, 'Lucía Bejarano', 'triade@construct.com', 5615665),
(3, 'Jet Constructora S.A.S', 484156564, 'Pedro Solano', 'jet@constructoras.com', 584653186);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cotizaciones`
--

CREATE TABLE `cotizaciones` (
  `id_cotizacion` int(11) NOT NULL,
  `fk_id_empleado` int(11) NOT NULL,
  `fk_id_constructora` int(11) NOT NULL,
  `fecha_cotizacion` date NOT NULL,
  `hora_cotizacion` varchar(20) NOT NULL,
  `dia_alquiler` varchar(55) NOT NULL,
  `duracion_alquiler` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `id_empleado` int(11) NOT NULL,
  `nombre_empleado` varchar(100) NOT NULL,
  `email_empleado` varchar(120) NOT NULL,
  `celular_empleado` int(11) NOT NULL,
  `password_empleado` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`id_empleado`, `nombre_empleado`, `email_empleado`, `celular_empleado`, `password_empleado`) VALUES
(1, 'Esteban Quito', 'estebanquito@mail.com', 311254698, '123'),
(2, 'Verónica Vargas', 'verovargas@mail.com', 317452010, '123'),
(3, 'Mariano Pedraza', 'marianopedraza@mail.com', 316229941, '123');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_producto` int(11) NOT NULL,
  `nombre_producto` varchar(120) NOT NULL,
  `precio_x_dia` int(11) NOT NULL,
  `stock_producto` int(11) DEFAULT NULL,
  `categoria_producto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_producto`, `nombre_producto`, `precio_x_dia`, `stock_producto`, `categoria_producto`) VALUES
(1, 'Serruchos', 50000, NULL, 1),
(2, 'Bulto Cemento', 350000, NULL, 2),
(3, 'Varillas', 120000, NULL, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos_x_cotizaciones`
--

CREATE TABLE `productos_x_cotizaciones` (
  `id_registro` int(11) NOT NULL,
  `fk_id_producto` int(11) NOT NULL,
  `fk_id_detalle` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `constructoras`
--
ALTER TABLE `constructoras`
  ADD PRIMARY KEY (`id_constructora`);

--
-- Indices de la tabla `cotizaciones`
--
ALTER TABLE `cotizaciones`
  ADD PRIMARY KEY (`id_cotizacion`),
  ADD KEY `fk_id_empleado` (`fk_id_empleado`),
  ADD KEY `fk_id_constructora` (`fk_id_constructora`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`id_empleado`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `categoria_producto` (`categoria_producto`);

--
-- Indices de la tabla `productos_x_cotizaciones`
--
ALTER TABLE `productos_x_cotizaciones`
  ADD PRIMARY KEY (`id_registro`),
  ADD KEY `fk_id_producto` (`fk_id_producto`),
  ADD KEY `fk_id_detalle` (`fk_id_detalle`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `constructoras`
--
ALTER TABLE `constructoras`
  MODIFY `id_constructora` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `cotizaciones`
--
ALTER TABLE `cotizaciones`
  MODIFY `id_cotizacion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `id_empleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `productos_x_cotizaciones`
--
ALTER TABLE `productos_x_cotizaciones`
  MODIFY `id_registro` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cotizaciones`
--
ALTER TABLE `cotizaciones`
  ADD CONSTRAINT `cotizaciones_ibfk_1` FOREIGN KEY (`fk_id_empleado`) REFERENCES `empleados` (`id_empleado`),
  ADD CONSTRAINT `cotizaciones_ibfk_2` FOREIGN KEY (`fk_id_constructora`) REFERENCES `constructoras` (`id_constructora`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`categoria_producto`) REFERENCES `categorias` (`id_categoria`);

--
-- Filtros para la tabla `productos_x_cotizaciones`
--
ALTER TABLE `productos_x_cotizaciones`
  ADD CONSTRAINT `productos_x_cotizaciones_ibfk_1` FOREIGN KEY (`fk_id_producto`) REFERENCES `productos` (`id_producto`),
  ADD CONSTRAINT `productos_x_cotizaciones_ibfk_2` FOREIGN KEY (`fk_id_detalle`) REFERENCES `cotizaciones` (`id_cotizacion`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
