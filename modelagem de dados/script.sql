CREATE DATABASE palavraresta;

USE palavra;

CREATE TABLE usuario (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(50),
	email VARCHAR(50),
	senha VARCHAR(50)
);

CREATE TABLE livro (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(50),
	autor VARCHAR (150),
	numpaginas INT,
	imagem VARCHAR (1000),
	situacao VARCHAR(50),
	dtinicio DATE,
	dttermino DATE
);

CREATE TABLE escritalivre (
	id INT PRIMARY KEY AUTO_INCREMENT,
	palavra VARCHAR (45),
	texto1 TEXT,
	texto2 TEXT,
	dt DATE
);