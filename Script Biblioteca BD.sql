DROP SCHEMA IF EXISTS Biblioteca;

CREATE SCHEMA Biblioteca;

USE Biblioteca;

DROP TABLE IF EXISTS Livros;

CREATE TABLE genero(
id_genero INT NOT NULL,
no_genero VARCHAR(30) NOT NULL,
PRIMARY KEY (id_genero)
);

CREATE TABLE autor(
id_autor INT NOT NULL,
no_autor VARCHAR(255) NOT NULL,
nacionalidade VARCHAR(100),
PRIMARY KEY (id_autor)
);

CREATE TABLE editora(
id_editora INT NOT NULL,
no_editora VARCHAR(30) NOT NULL,
PRIMARY KEY (id_editora)
);

CREATE TABLE livro(
id_livro INT NOT NULL,
id_genero INT NOT NULL,
no_livro VARCHAR(255) NOT NULL,
ano_publicacao DATE NOT NULL,
id_editora INT NOT NULL,
dt_aquisicao DATE NOT NULL,
dt_recebimento_doacao DATE,
custo_aquisicao DECIMAL(5,2),
descricao VARCHAR(400) NOT NULL,
registro_ISBN VARCHAR(17),
PRIMARY KEY (id_livro),
FOREIGN KEY (id_genero) REFERENCES genero (id_genero),
FOREIGN KEY (id_editora) REFERENCES editora (id_editora)
);

CREATE TABLE livro_autor(
id_livro INT NOT NULL,
id_autor INT NOT NULL,
PRIMARY KEY (id_livro, id_autor),
FOREIGN KEY (id_livro) REFERENCES livro (id_livro),
FOREIGN KEY (id_autor) REFERENCES autor (id_autor)
);

CREATE TABLE situacao(
id_situacao INT NOT NULL PRIMARY KEY,
no_situacao VARCHAR(10)
);

CREATE TABLE usuario(
id_usuario INT NOT NULL PRIMARY KEY,
no_usuario VARCHAR(255) NOT NULL,
endereco_usuario VARCHAR(255) NOT NULL,
bairro_usuario VARCHAR(50) NOT NULL,
cidade VARCHAR(100) NOT NULL,
estado VARCHAR(100) NOT NULL,
CEP VARCHAR(10) NOT NULL,
id_situacao INT NOT NULL,
telefone VARCHAR(15) NOT NULL,
num_cpf VARCHAR(14) NOT NULL,
UNIQUE INDEX num_cpf_UNIQUE (num_cpf ASC),
FOREIGN KEY (id_situacao) REFERENCES situacao (id_situacao)
);

CREATE TABLE funcao(
id_funcao INT NOT NULL PRIMARY KEY,
no_funcao VARCHAR(30) NOT NULL
);

CREATE TABLE funcionario(
id_funcionario INT NOT NULL,
id_funcao INT NOT NULL,
no_funcionario VARCHAR(255) NOT NULL,
PRIMARY KEY (id_funcionario),
FOREIGN KEY (id_funcao) REFERENCES funcao (id_funcao)
);

CREATE TABLE emprestimo(
id_emprestimo INT NOT NULL,
id_usuario INT NOT NULL,
id_livro INT NOT NULL,
id_funcionario INT NOT NULL,
dt_emprestimo DATETIME NOT NULL,
dt_devolucao DATETIME NOT NULL,
observacao VARCHAR(400) NOT NULL,
primary key (id_emprestimo),
FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario),
FOREIGN KEY (id_livro) REFERENCES livro (id_livro),
FOREIGN KEY (id_funcionario) REFERENCES funcionario (id_funcionario)
);

INSERT INTO genero VALUES (34, "Epopeias");
INSERT INTO genero VALUES (23, "Romance");
INSERT INTO genero VALUES (11, "Terror");
INSERT INTO genero VALUES (7, "Ficção Científica");
INSERT INTO genero VALUES (9, "Fábulas");
INSERT INTO genero VALUES (4, "Comédia");
INSERT INTO genero VALUES (17, "Contos e novelas");

INSERT INTO autor VALUES (2001, "Homero", "Grécia Antiga");
INSERT INTO autor VALUES (2002, "Stephenie Meyer", "Americana");
INSERT INTO autor VALUES (2003, "Stephen King", "Americano");
INSERT INTO autor VALUES (2004, "Christopher Nolan", "Britânico");
INSERT INTO autor VALUES (2005, "Monteiro Lobato", "Brasileiro");
INSERT INTO autor VALUES (2006, "Sarah Andersen","Americana");
INSERT INTO autor VALUES (2007, "Jorge Luís Borges", "Argentino");

INSERT INTO editora VALUES (5515, "Sextante");
INSERT INTO editora VALUES (5545, "Companhia das Letras");
INSERT INTO editora VALUES (5522, "Editorial Record");
INSERT INTO editora VALUES (5513, "Darkside Books");
INSERT INTO editora VALUES (5537, "Editora Globo");
INSERT INTO editora VALUES (5565, "Intrínseca");
INSERT INTO editora VALUES (5541, "Saraiva");

INSERT INTO livro (id_livro, id_genero, no_livro, ano_publicacao, id_editora, dt_aquisicao, descricao, registro_ISBN) VALUES (6141, 34, "Ilíada", "1000-01-01", 5515, "2018-09-12", "Ilíada é um poema épico que foi escrito no século IX a.C., pelo poeta grego Homero. O poema desenvolve-se em torno da Guerra de Troia, que provavelmente se deu no século XIII a.C. Homero descreve com detalhes o mundo grego da época apesar de não ter sido testemunha dos fatos, pois viveu quatro séculos depois.", "8563560948");
INSERT INTO livro (id_livro, id_genero, no_livro, ano_publicacao, id_editora, dt_aquisicao, custo_aquisicao, descricao, registro_ISBN) VALUES (6199, 23, "Sol da Meia-Noite", "2020-08-04", 5565, "2021-03-19", "55.90", "No aguardado Sol da meia-noite, vamos testemunhar o nascimento desse amor pelo olhar de Edward, mergulhando em um universo novo, sombrio e surpreendente, cheio de revelações. Conhecer Bella foi o que aconteceu de mais irritante e instigante em todos os anos de Edward como vampiro.", "6555600292");
INSERT INTO livro (id_livro, id_genero, no_livro, ano_publicacao, id_editora, dt_aquisicao, custo_aquisicao, descricao, registro_ISBN) VALUES (6154, 11, "It - A Coisa", "1986-09-15", 5545, "2019-07-14", "64.90", "Durante as férias de 1958, em uma pacata cidadezinha chamada Derry, um grupo de sete amigos começa a ver coisas estranhas. Um conta que viu um palhaço, outro que viu uma múmia. Finalmente, acabam descobrindo que estavam todos vendo a mesma coisa: um ser sobrenatural e maligno que pode assumir várias formas.", "‎978-8581051529");
INSERT INTO livro (id_livro, id_genero, no_livro, ano_publicacao, id_editora, dt_aquisicao, custo_aquisicao, descricao, registro_ISBN) VALUES (6187, 7, "Interestelar", "2016-03-17", 5522, "2020-05-27", "44.90", "Interestelar é a crônica de um grupo de exploradores que se aproveita de um recém-descoberto buraco de minhoca para ultrapassar os limites das viagens espaciais tripuladas e assim conquistar as grandes distâncias de uma jornada interestelar.", "978-8583110545");
INSERT INTO livro (id_livro, id_genero, no_livro, ano_publicacao, id_editora, dt_aquisicao, custo_aquisicao, descricao, registro_ISBN) VALUES (6195, 9, "Fábulas", "1922-01-01", 5537, "2021-05-21", "17.79", "Monteiro Lobato demonstra neste livro Fábulas uma visão bem peculiar da sua visão de mundo, selecionando contos que demonstrem o quanto o mundo pode ser injusto e como ele só é comandado e regido pela força.", "8525045837");
INSERT INTO livro (id_livro, id_genero, no_livro, ano_publicacao, id_editora, dt_aquisicao, custo_aquisicao, descricao, registro_ISBN) VALUES (6123, 4, "A louca dos gatos", "2018-08-27", 5513, "2021-12-24", "30.99", "A terceira coletânea da cartunista Sarah Andersen traz novas tiras que retratam os desafios de ser um jovem adulto num mundo cada vez mais instável.", "9788554512385");
INSERT INTO livro (id_livro, id_genero, no_livro, ano_publicacao, id_editora, dt_aquisicao, custo_aquisicao, descricao, registro_ISBN) VALUES (6101, 17, "Contos de fadas dos irmãos Grimm", "2020-07-29", 5541, "2022-08-16", "14.20", "Dois irmãos saem pela Alemanha coletando histórias fantásticas e criam algumas das histórias mais fascinantes que a sua mãe contava para você na infância. O fim da história você já sabe. Donzela que foge em tranças, mocinha que dorme um sono profundo e bichos que dão lição de moral.", "8594318901");

INSERT INTO livro_autor VALUES (6141, 2001);
INSERT INTO livro_autor VALUES (6199, 2002);
INSERT INTO livro_autor VALUES (6154, 2003);
INSERT INTO livro_autor VALUES (6187, 2004);
INSERT INTO livro_autor VALUES (6195, 2005);
INSERT INTO livro_autor VALUES (6123, 2006);
INSERT INTO livro_autor VALUES (6101, 2007);

INSERT INTO situacao VALUES (1, "Ativo");
INSERT INTO situacao VALUES (2, "Suspenso");
INSERT INTO situacao VALUES (3, "Cancelado");     

INSERT INTO usuario VALUES (98761234, "Alef BRANCO Da Silva Ribeiro Rolinha", "Rua Monteiro Lobato, 555", "Libélula", "Juiz de Fora", "Minas Gerais", "92650-444", 1,"(32) 96555-9754", "320.955.322-00");
INSERT INTO usuario VALUES (12795039, "Emanuelle Pereira de Freitas", "Rua Avenida Brasil, 1620", "Santa Efigênia", "Belo Horizonte", "Minas Gerais", "30140-091", 1,"(31) 93261-7429", "302.651.987-12");
INSERT INTO usuario VALUES (29384590, "Harry Potter Carioca", "Rua Saldanha Marinho, 5", "Frigideira Santos", "Curitiba", "Paraná", "80730-000", 2,"(41) 3323-3333", "670.942.583-56");
INSERT INTO usuario VALUES (32348957, "Elce Benedicte Bonfim", "Rua Professor Pedro Viriato Parigot de Souza, 2748", "Mossunguê", "Curitiba", "Paraná", "81200-100", 1,"(41) 93151-5252", "965.172.803-59");
INSERT INTO usuario VALUES (45678903, "Kauanne da Silva Araujo", "Rua Princesa Isabel, 245", "Velha", "Blumenau", "Santa Catarina", "89036-290", 3, "(47) 93035-2662", "265.903.748-56");
INSERT INTO usuario VALUES (14585164, "Fernando Pereira Guerra", "Avenida Lavandisca, 262", "Moema", "Tietê", "São Paulo", "04523-012", 2,"(11) 95051-6866", "347.126.059-52");
INSERT INTO usuario VALUES (12547895, "Antônio dos Santos Bitencurt", "Alameda Couto Magalhães, 2845", "Ribeirinha", "Goiânia", "Goiás", "74823-030", 1,"(62) 93609-1506", "264.019.538-71");


INSERT INTO funcao VALUES (7781, "Bibliotecário");
INSERT INTO funcao VALUES (7782, "Coordenador");

INSERT INTO funcionario VALUES (5551920, 7781, "Dante Maximiano Perez Sobrinho");
INSERT INTO funcionario VALUES (5553456, 7781, "Luzia Maia Gomes");
INSERT INTO funcionario VALUES (5556873, 7781, "Fátima Matos Neto");
INSERT INTO funcionario VALUES (5556753, 7782, "Emanuel Rafael Gusmão");
INSERT INTO funcionario VALUES (5555782, 7781, "Luciano Alexandre Valentin");
INSERT INTO funcionario VALUES (5553781, 7781, "Adriano Leon Carmona");
INSERT INTO funcionario VALUES (5553579, 7782, "Anderson Barros");

INSERT INTO emprestimo VALUES (411202, 12795039, 6154, 5553456, "2023-04-03 09:22:45", "2023-04-13 09:27:32", "Nenhuma avaria no livro.");
INSERT INTO emprestimo VALUES (411654, 29384590, 6199, 5553456, "2023-04-03 15:57:02", "2023-04-13 13:11:53", "Nenhuma avaria no livro.");
INSERT INTO emprestimo VALUES (411655, 29384590, 6101, 5553456, "2023-04-03 15:57:02", "2023-04-13 13:11:53", "Nenhuma avaria no livro.");
INSERT INTO emprestimo VALUES (411357, 12547895, 6195, 5553579, "2023-04-12 17:10:44", "2023-04-13 10:30:22", "Capa rasgada.");
INSERT INTO emprestimo VALUES (411951, 14585164, 6187, 5553456, "2023-04-14 15:57:02", "2023-04-17 09:55:32", "Nenhuma avaria no livro");
INSERT INTO emprestimo VALUES (411852, 32348957, 6123, 5553456, "2023-04-11 08:10:02", "2023-04-14 17:00:10", "Livro Riscado");

