DROP DATABASE IF exists palavraresta;
CREATE DATABASE palavraresta;

USE palavraresta;

CREATE TABLE usuario (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(50),
    sobrenome VARCHAR(50),
	email VARCHAR(50),
	senha VARCHAR(50)
);

INSERT INTO usuario (nome, sobrenome, email, senha) VALUES
('Clara','Garcia', 'c-carolina@live.com', '123');

CREATE TABLE livro (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(50),
	autor VARCHAR (150),
	numpaginas INT,
	imagem VARCHAR (1000),
    resenha TEXT,
	dtinicio DATE,
	dttermino DATE,
    favorito TINYINT,
    fkusuario INT,
    CONSTRAINT fkusuario_livro
    foreign key (fkusuario) REFERENCES usuario(id)
);

CREATE TABLE quero_ler (
fkusuario INT,
fklivro INT,
FOREIGN KEY (fkusuario) REFERENCES usuario(id),
FOREIGN KEY (fkusuario) REFERENCES usuario(id)
);

INSERT INTO livro 
    (nome, autor, numpaginas, imagem, dtinicio, dttermino, favorito)
VALUES 
    ('Canção para ninar menino grande', 'Angélica Freitas', 112,
     'assets/livros/cancao-para-ninar-menino-grande.jpg',
     '2025-02-01', '2025-02-10', 0);



select * from livro;

-- FEED (todos os úsuarios menos o que está logado) nome do livro, autor, nome do usario e resenha

SELECT l.nome, l.autor, l.resenha,
u.nome
FROM livro
JOIN usuario ON fk;


-- PG LIVROS (livros do usuário logado) o que 
-- DASHBOARD (usuário logado) nome resenhas, livros, 
-- sequencia de leitura (a partir das semanas), paginas por semana (paginas do livro pelo tempo de leitura), quero ler, favoritos
SELECT u.nome nome_usuario, 
l.numpaginas, 
l.dtinicio, 
l.dttermino,
l.favorito,
q.fklivro quero_ler
FROM livro l
JOIN usuario u ON l.fkusuario = u.id
JOIN quero_ler q ON q.fklivro = l.id;