CREATE DATABASE IF NOT EXISTS db_loca_tech;
USE db_loca_tech;

-- ------------------------------------------------------------
-- Tabela: Pessoa
-- (cliente)
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS pessoa (
    id_pessoa       INT AUTO_INCREMENT PRIMARY KEY,
    nome            VARCHAR(100) NOT NULL,
    email           VARCHAR(150) UNIQUE,
    data_nascimento DATE,
    telefone        VARCHAR(20),
    status_pessoa   VARCHAR(20) DEFAULT 'ativo'
);

-- ------------------------------------------------------------
-- Tabela: Item
-- (equipamentos disponíveis para aluguel)
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS item (
    id_item               INT AUTO_INCREMENT PRIMARY KEY,
    nome                  VARCHAR(100) NOT NULL,
    categoria             VARCHAR(50),
    descricao             TEXT,
    valor                 DECIMAL(10, 2),
    quantidade_disponivel INT DEFAULT 0
);

-- ------------------------------------------------------------
-- Tabela: Registro
-- (histórico de cada locação)
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS registro (
    id_registro           	INT AUTO_INCREMENT PRIMARY KEY,
    id_pessoa    			INT NOT NULL,
    id_item      			INT NOT NULL,
    data_registro 			DATE DEFAULT NULL,
    observacao   			TEXT,
    status_registro       	VARCHAR(20) DEFAULT 'pendente',
    FOREIGN KEY (id_pessoa) REFERENCES pessoa(id_pessoa),
    FOREIGN KEY (id_item)   REFERENCES item(id_item)
);

-- ------------------------------------------------------------
-- INPUT de Dados
-- ------------------------------------------------------------

-- =========================
-- TABELA PESSOA
-- =========================

INSERT INTO pessoa (nome, email, data_nascimento, telefone, status_pessoa) VALUES
('João Silva'	 , 'joao.silva@email.com'	 , '1998-05-12', '(11) 98765-1234', 'ativo'),
('Maria Oliveira', 'maria.oliveira@email.com', '1995-11-03', '(11) 99876-2345', 'ativo'),
('Pedro Santos'	 , 'pedro.santos@email.com'	 , '2001-02-18', '(11) 99123-4567', 'ativo'),
('Ana Souza'	 , 'ana.souza@email.com'	 , '1992-08-27', '(11) 98888-1111', 'suspenso'),
('Lucas Ferreira', 'lucas.ferreira@email.com', '1999-07-15', '(11) 99999-2222', 'ativo'),
('Beatriz Costa' , 'beatriz.costa@email.com' , '1997-03-09', '(11) 98777-3333', 'bloqueado'),
('Carlos Lima'	 , 'carlos.lima@email.com'	 , '1988-12-21', '(11) 98666-4444', 'ativo'),
('Juliana Rocha' , 'juliana.rocha@email.com' , '2000-06-30', '(11) 98555-5555', 'ativo'),
('Rafael Martins', 'rafael.martins@email.com', '1994-10-11', '(11) 98444-6666', 'inativo'),
('Fernanda Alves', 'fernanda.alves@email.com', '1996-09-05', '(11) 98333-7777', 'ativo');



-- =========================
-- TABELA ITEM
-- =========================

INSERT INTO item (nome, categoria, descricao, valor, quantidade_disponivel) VALUES
('Notebook Dell Inspiron 15'   , 'Notebook'		 , 'Notebook Dell Core i5, 16GB RAM', 180.00, 	5),
('PlayStation 5'			   , 'Videogame'	 , 'Console Sony PlayStation 5'		, 150.00, 	3),
('Xbox Series X'			   , 'Videogame'	 , 'Console Microsoft Xbox Series X', 145.00, 	2),
('Nintendo Switch OLED'		   , 'Videogame'	 , 'Console Nintendo Switch OLED'	, 90.00, 	4),
('Drone DJI Mini 4 Pro'		   , 'Drone'		 , 'Drone com câmera 4K'			, 250.00, 	2),
('Câmera Canon EOS R50'		   , 'Câmera'		 , 'Câmera mirrorless Canon'		, 170.00,	3),
('Projetor Epson PowerLite'	   , 'Projetor'		 , 'Projetor Full HD'				, 120.00, 	4),
('Notebook Lenovo IdeaPad 3'   , 'Notebook'		 , 'Notebook Ryzen 5, 8GB RAM'		, 160.00, 	6),
('GoPro Hero 12'			   , 'Câmera de Ação', 'Câmera esportiva 5.3K'			, 110.00, 	5),
('Tablet Samsung Galaxy Tab S9', 'Tablet'		 , 'Tablet Android 11 polegadas'	, 95.00, 	7);

-- =========================
-- TABELA REGISTRO
-- =========================

INSERT INTO registro (id_pessoa, id_item, data_registro, observacao, status_registro) VALUES
(1,  2 , '2026-06-01', 'Retirada realizada no balcão.'		 	  , 'em andamento'),
(2 , 5 , '2026-06-03', 'Cliente solicitou extensão do prazo.'	  , 'em andamento'),
(3 , 1 , '2026-06-05', 'Equipamento devolvido em perfeito estado.', 'concluido'),
(4 , 7 , '2026-06-06', 'Reserva cancelada pelo cliente.'		  , 'cancelado'),
(5 , 4 , '2026-06-08', 'Locação iniciada normalmente.'			  , 'em andamento'),
(6 , 9 , '2026-06-10', 'Cliente bloqueado por atraso anterior.'	  , 'cancelado'),
(7 , 8 , '2026-06-12', 'Notebook devolvido com carregador.'		  , 'concluido'),
(8 , 10, '2026-06-15', 'Aguardando retirada do equipamento.'	  , 'reservado'),
(9 , 6 , '2026-06-18', 'Devolução com um dia de atraso.'		  , 'concluido'),
(10, 3 , '2026-06-20', 'Videogame reservado para retirada amanhã.', 'reservado');

-- ------------------------------------------------------------
-- Agora:
-- 1. Defina o contexto do seu sistema (Fase 1)
-- 2. Gere dados coerentes com esse contexto com IA (Fase 2)
--    e adicione os dados usando INSERT
-- 3. Formule suas perguntas e escreva os comandos abaixo (Fase 3)
-- ------------------------------------------------------------

-- Pergunta 1 (UPDATE):

-- [escreva aqui uma pergunta que pode ser respondida usando UPDATE]

-- " Como registrar que o cliente João Silva foi bloqueado por atraso 
-- na devolução de um equipamento? "

-- [agora escreva o código que ajuda a responder essa pergunta logo abaixo]

UPDATE pessoa
SET status_pessoa = 'bloqueado'
WHERE id_pessoa = 1;

-- Pergunta 2 (DELETE):

-- [escreva aqui uma pergunta que pode ser respondida usando DELETE]
-- " Como remover um registro de locação que foi cadastrado por engano? "

-- [agora escreva o código que ajuda a responder essa pergunta logo abaixo]

DELETE FROM registro
WHERE id_registro = 7;

-- Pergunta 3 (ALTER TABLE):

-- [escreva aqui uma pergunta que pode ser respondida usando ALTER TABLE]
-- " Como adaptar o banco de dados para armazenar a marca de cada equipamento, 
-- permitindo que a empresa organize seu estoque e identifique oportunidades de 
--  parcerias e promoções com fabricantes? "

-- [agora escreva o código que ajuda a responder essa pergunta logo abaixo]
ALTER TABLE item
ADD COLUMN marca VARCHAR(100);
