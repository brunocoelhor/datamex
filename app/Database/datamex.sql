--
-- Database: `datamex`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `filhos`
--

CREATE TABLE `filhos` (
  `pessoas_id` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `idade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `filhos`
--

INSERT INTO `filhos` (`pessoas_id`, `nome`, `idade`) VALUES
(1, 'João', 3),
(1, 'Pedro', 3),
(2, 'Joana', 1),
(7, 'Enzo', 16);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pessoas`
--

CREATE TABLE `pessoas` (
  `id` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `idade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `pessoas`
--

INSERT INTO `pessoas` (`id`, `nome`, `idade`) VALUES
(1, 'Bruno', 33),
(2, 'Sabrina', 25),
(3, 'Maria', 33),
(4, 'Marcele', 25),
(5, 'Marcelo', 33),
(6, 'Mariana', 25),
(7, 'Mario', 67);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `filhos`
--
ALTER TABLE `filhos`
  ADD KEY `pessoas_id` (`pessoas_id`);

--
-- Indexes for table `pessoas`
--
ALTER TABLE `pessoas`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pessoas`
--
ALTER TABLE `pessoas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `filhos`
--
ALTER TABLE `filhos`
  ADD CONSTRAINT `pessoas_id` FOREIGN KEY (`pessoas_id`) REFERENCES `pessoas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
