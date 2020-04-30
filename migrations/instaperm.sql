-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Апр 30 2020 г., 21:43
-- Версия сервера: 5.6.41
-- Версия PHP: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `instaperm`
--

-- --------------------------------------------------------

--
-- Структура таблицы `contacts`
--

CREATE TABLE `contacts` (
  `id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `middlename` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(128) NOT NULL,
  `phone` varchar(16) NOT NULL,
  `comment` varchar(128) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `contacts`
--

INSERT INTO `contacts` (`id`, `firstname`, `middlename`, `lastname`, `email`, `phone`, `comment`) VALUES
(1, 'Константин', 'Константинович', 'Константинопольский', 'k19@ya.ru', '+79876543210', '8-)'),
(2, 'Ян', '', 'Гус', 'yan@goose.nl', '+47987654321', ''),
(3, 'Bertrand', '', 'Guillaume', 'vel.necessitatibus@fu.ga', '+76377510490', ''),
(4, 'Эвелина', 'Иларионовна', 'Энтина', 'ut.totam@su.nt', '+10196966766', ''),
(5, 'Татьяна', 'Михаиловна', 'Еськова', 'laboriosam.quam@suscip.it', '+11406521450', ''),
(6, 'Майя', 'Венедиктовна', 'Чкалова', 'ab.debitis@obcaeca.ti', '+51093387448', ''),
(7, 'Ираида', 'Виталиевна', 'Косинова', 'voluptatibus.ut@cumq.ue', '+72044943107', ''),
(8, 'Мирослава', 'Трофимовна', 'Стрельцова', 'ea@explicabo.exercitation.em', '+66735386422', ''),
(9, 'Марина', 'Ираклиевна', 'Путилова', 'necessitatibus.voluptas@opt.io', '+78670968249', ''),
(10, 'Рада', 'Юлиевна', 'Тевосова', 'eum.modi@deleni.ti', '+24226529256', ''),
(11, 'Лада', 'Игоревна', 'Самсонова', 'iusto@omni.sa', '+38451101054', ''),
(12, 'Онисим', 'Иннокентиевич', 'Семичаевский', 'molestias.esse@eveni.et', '+66400065018', ''),
(13, 'Карл', 'Никанорович', 'Кошечкин', 'velit.similique@veritat.is', '+91894632667', ''),
(14, 'Лука', 'Ильевич', 'Боварин', 'voluptatem@id.aliqu.id', '+94505629262', ''),
(15, 'Прокофий', 'Ираклиевич', 'Елизаров', 'cupiditate@eius.ut', '+13683913653', ''),
(16, 'Роман', 'Чеславович', 'Яковленко', 'iste.corporis@dolorib.us', '+60269296025', ''),
(17, 'Никита', 'Анатолиевич', 'Митькин', 'culpa@non.ea', '+17397340064', ''),
(18, 'Ипполит', 'Панкратиевич', 'Левкин', 'qui.vitae@deleni.ti', '+78774141858', ''),
(19, 'Arttu', '', 'Hovinen', 'nulla.omnis@aliqu.id', '+59738260835', ''),
(20, 'Tapani', '', 'Sariola', 'eum@este.st.', '+60368139854', ''),
(21, 'Pekka', '', 'Mikkola', 'qui.obcaecati@perferend.is', '+47863780366', ''),
(22, 'Reijo', '', 'Kokkonen', 'ut.est@vel.it', '+36912763210', ''),
(23, 'Jalmari', '', 'Laakso', 'aliquid.non@maxi.me', '+45156879462', ''),
(24, 'Vincent', '', 'Dussault', 'blanditiisea@aperi.am', '+98785180898', ''),
(25, 'Florentin', '', 'Robert', 'rerum@eligendi.ut', '+85364488026', ''),
(26, 'Alain', '', 'Perrot', 'consequatur@dignissimos.sae.pe', '+92102094249', ''),
(27, 'Thibault', '', 'Lefebvre', 'nihil@exercitationem.in', '+52434779374', ''),
(28, 'Pascal', '', 'Simon', 'minus.dignissimos@nob.is', '+56453042249', ''),
(29, 'Daniel', '', 'Blanchard', 'est@veniam.od.io', '+70553356648', '');

-- --------------------------------------------------------

--
-- Структура таблицы `favorites`
--

CREATE TABLE `favorites` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `contact_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `favorites`
--

INSERT INTO `favorites` (`id`, `user_id`, `contact_id`) VALUES
(11, 1, 10),
(12, 1, 11),
(20, 1, 8),
(17, 2, 4),
(18, 2, 7),
(19, 2, 9);

-- --------------------------------------------------------

--
-- Структура таблицы `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1588268388);

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(256) NOT NULL,
  `password_hash` varchar(64) NOT NULL,
  `auth_key` varchar(32) NOT NULL,
  `status` int(2) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `username`, `password_hash`, `auth_key`, `status`, `created_at`, `updated_at`) VALUES
(1, 'admin', '$2y$13$9ihW42bqMgTSIixnXvxR2u0ivUDOxtyy0UCEVE1ZA0.drcyjMs1lS', 'MYrF-jPzevNcavKQJTndPT7pnhYIhcHK', 10, 1588173660, 1588173660),
(2, 'admin2', '$2y$13$kGSmyhcKb4.m9vrUYH0q1.9GsYarx7E/dAEruQzNow5Ol09dYFzI2', 'ehWZfzGzs5ckv_jnt9dESE36_uf4giHZ', 10, 1588227519, 1588227519);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `favorites`
--
ALTER TABLE `favorites`
  ADD UNIQUE KEY `id` (`id`);

--
-- Индексы таблицы `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD UNIQUE KEY `id` (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT для таблицы `favorites`
--
ALTER TABLE `favorites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
