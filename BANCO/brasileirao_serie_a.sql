-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Tempo de geração: 19-Abr-2021 às 18:22
-- Versão do servidor: 8.0.23-0ubuntu0.20.04.1
-- versão do PHP: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `brasileirao_serie_a`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `campeonato`
--

CREATE TABLE `campeonato` (
  `id_campeonato` int UNSIGNED NOT NULL,
  `nome_campeonato` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `qtd_rodadas` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Extraindo dados da tabela `campeonato`
--

INSERT INTO `campeonato` (`id_campeonato`, `nome_campeonato`, `qtd_rodadas`, `created_at`, `updated_at`) VALUES
(1, 'Brasileirão série A', 38, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `clubes`
--

CREATE TABLE `clubes` (
  `id_clube` int UNSIGNED NOT NULL,
  `nome_clube` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `pontos` int NOT NULL,
  `qtd_jogos` int NOT NULL,
  `qtd_vitorias` int NOT NULL,
  `qtd_empates` int NOT NULL,
  `qtd_derrotas` int NOT NULL,
  `gols_P` int NOT NULL,
  `gols_C` int NOT NULL,
  `saldo_gols` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Extraindo dados da tabela `clubes`
--

INSERT INTO `clubes` (`id_clube`, `nome_clube`, `pontos`, `qtd_jogos`, `qtd_vitorias`, `qtd_empates`, `qtd_derrotas`, `gols_P`, `gols_C`, `saldo_gols`, `created_at`, `updated_at`) VALUES
(2, 'Atletico-MG', 0, 0, 0, 0, 0, 0, 0, 0, '2021-04-18 20:41:26', '2021-04-18 20:41:26'),
(3, 'Palmeiras', 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL),
(4, 'Flamengo', 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL),
(5, 'Corinthians', 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL),
(6, 'São Paulo-FC', 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL),
(7, 'Internacional', 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL),
(8, 'Grêmio', 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL),
(9, 'Atlético-GO', 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL),
(10, 'Baiha', 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL),
(11, 'Bragantino', 3, 1, 1, 0, 0, 3, 1, 3, NULL, NULL),
(12, 'América-MG', 3, 1, 1, 0, 0, 2, 1, 2, NULL, NULL),
(13, 'Athletico-PR', 0, 1, 0, 0, 1, 1, 3, 1, NULL, NULL),
(14, 'Ceará', 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL),
(15, 'Fluminense', 0, 1, 0, 0, 1, 1, 2, 1, NULL, NULL),
(16, 'Santos', 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL),
(17, 'Juventude', 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL),
(18, 'Sport', 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL),
(19, 'Fortaleza', 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL),
(20, 'Chapecoense', 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL),
(21, 'Cuiabá', 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `confrotos`
--

CREATE TABLE `confrotos` (
  `id_confronto` int UNSIGNED NOT NULL,
  `id_rodada` int NOT NULL,
  `placar` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `mandante` int NOT NULL,
  `visitante` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Estrutura da tabela `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Extraindo dados da tabela `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2021_04_18_143138_create_clubes_table', 1),
(2, '2014_10_12_000000_create_users_table', 2),
(3, '2014_10_12_100000_create_password_resets_table', 2),
(4, '2021_04_19_165147_create_campeonato_table', 3),
(5, '2021_04_19_165849_create_rodadas_table', 3),
(6, '2021_04_19_170702_create_confrotos_table', 3),
(7, '2021_04_19_172026_alter_rodadas_table', 4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Estrutura da tabela `rodadas`
--

CREATE TABLE `rodadas` (
  `id_rodada` int UNSIGNED NOT NULL,
  `id_campeonato` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `num_rodada` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Extraindo dados da tabela `rodadas`
--

INSERT INTO `rodadas` (`id_rodada`, `id_campeonato`, `created_at`, `updated_at`, `num_rodada`) VALUES
(1, 1, '2021-04-19 21:20:07', '2021-04-19 21:20:07', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

CREATE TABLE `users` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `campeonato`
--
ALTER TABLE `campeonato`
  ADD PRIMARY KEY (`id_campeonato`);

--
-- Índices para tabela `clubes`
--
ALTER TABLE `clubes`
  ADD PRIMARY KEY (`id_clube`);

--
-- Índices para tabela `confrotos`
--
ALTER TABLE `confrotos`
  ADD PRIMARY KEY (`id_confronto`);

--
-- Índices para tabela `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Índices para tabela `rodadas`
--
ALTER TABLE `rodadas`
  ADD PRIMARY KEY (`id_rodada`);

--
-- Índices para tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `campeonato`
--
ALTER TABLE `campeonato`
  MODIFY `id_campeonato` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `clubes`
--
ALTER TABLE `clubes`
  MODIFY `id_clube` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de tabela `confrotos`
--
ALTER TABLE `confrotos`
  MODIFY `id_confronto` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `rodadas`
--
ALTER TABLE `rodadas`
  MODIFY `id_rodada` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
