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
select * from livro;

INSERT INTO usuario (nome, sobrenome, email, senha) VALUES
('Bruno', 'Silva', 'bruno.silva@gmail.com', '456'),
('Fernanda', 'Almeida', 'fernanda.almeida@mail.com', 'abc');

CREATE TABLE livro (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(50),
	autor VARCHAR (150),
	numpaginas INT,
    editora VARCHAR (100),
	imagem VARCHAR (1000),
    resenha TEXT,
	dtinicio DATE,
	dttermino DATE,
    favorito TINYINT,
    fkusuario INT,
    CONSTRAINT fkusuario_livro
    foreign key (fkusuario) REFERENCES usuario(id)
);

INSERT INTO livro (nome, autor, numpaginas, editora, imagem, resenha, dtinicio, dttermino, favorito, fkusuario)
VALUES ('Nome do Livro', 'Nome do Autor', 200, 'Editora Exemplo', 'caminho/para/imagem.jpg', 'Esta é uma resenha do livro.', '2025-11-01', '2025-11-20', 1, 1);

DESC livro;

CREATE TABLE quero_ler (
fkusuario INT,
fklivro INT,
FOREIGN KEY (fkusuario) REFERENCES usuario(id),
FOREIGN KEY (fklivro) REFERENCES livro(id)
);

INSERT INTO livro (nome, autor, numpaginas, imagem, resenha, dtinicio, dttermino, favorito, fkusuario) VALUES 
     ('O Morro dos Ventos Uivantes', 'Emily Brontë', 300, 'assets/livros/morro-dos-ventos-uivantes.jpg',
'Um clássico da literatura inglesa que retrata paixões intensas e tragédias familiares.',
'2025-03-01', '2025-03-20', 1, 2),
('Dom Casmurro', 'Machado de Assis', 256, 'assets/livros/dom-casmurro.jpg',
'Romance que explora ciúmes e dúvidas no relacionamento amoroso.',
'2025-01-15', '2025-01-25', 0, 3);

UPDATE livro
SET imagem = 'https://m.media-amazon.com/images/I/91Ogem4dmhL._AC_UF1000,1000_QL80_.jpg'
WHERE id = 1;

select * from livro;
desc livro;
	
-- FEED (todos os úsuarios menos o que está logado) nome do livro, autor, nome do usario e resenha
SELECT l.nome, l.autor, l.resenha, u.nome
FROM livro l
JOIN usuario u ON l.fkusuario = u.id;


-- PG LIVROS (livros do usuário logado) o que 
-- DASHBOARD (usuário logado) nome resenhas, livros, 
-- sequencia de leitura (a partir das semanas), paginas por semana (paginas do livro pelo tempo de leitura), quero ler, favoritos
SELECT u.nome nome_usuario, 
       l.numpaginas, 
       l.dtinicio, 
       l.dttermino,
       l.favorito,
       l.nome nome_livro
FROM livro l 
JOIN usuario u ON l.fkusuario = u.id
LEFT JOIN quero_ler q ON q.fklivro = l.id
WHERE u.id != '1';

SELECT DATEDIFF(dtinicio, dttermino) AS dias_diferenca FROM livro WHERE id = '1';


INSERT INTO livro (nome, )
SELECT * FROM usuario;
-- q.fklivro quero_ler 
-- JOIN quero_ler q ON q.fklivro = l.id;

describe livro;
select * from livro;

SELECT l.nome as nome_livro, l.autor, l.resenha, u.nome nome_usuario, u.sobrenome
FROM livro as l
JOIN usuario as u ON l.fkusuario = u.id
LEFT JOIN quero_ler q ON q.fklivro = l.id
WHERE u.id != '2';