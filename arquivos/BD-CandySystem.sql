DROP TABLE preparo;
DROP TABLE produto_ingrediente;
DROP TABLE ingrediente;
DROP TABLE tipo_medida;
DROP TABLE pedido_produto;
DROP TABLE produto;
DROP TABLE pedido;
DROP TABLE tipo_pagamento;
DROP TABLE telefone;
DROP TABLE cliente;

CREATE TABLE pedido(
	cod_pedido INTEGER PRIMARY KEY,
	data_hora_criacao TIMESTAMP,
	data_hora_entrega_prevista TIMESTAMP,
	preco_total FLOAT(4),
	fk_cod_tipo_pagamento INTEGER,
	fk_cod_cliente INTEGER
);

CREATE TABLE tipo_pagamento (
    cod_tipo_pagamento INTEGER PRIMARY KEY,
    descricao VARCHAR(50)
);

CREATE TABLE pedido_produto(
	cod_ped_prod INTEGER PRIMARY KEY,
	quantidade INTEGER,
	preco FLOAT,
	fk_cod_pedido INTEGER,
	fk_cod_produto INTEGER
);

CREATE TABLE produto (
    cod_produto INTEGER PRIMARY KEY,
    nome VARCHAR(50),
    preco FLOAT(4)
);

CREATE TABLE preparo (
    cod_preparo INTEGER PRIMARY KEY,
    descricao_passo VARCHAR(100),
    ordem INTEGER,
    fk_cod_produto INTEGER
);

CREATE TABLE produto_ingrediente (
	cod_prod_ingre INTEGER PRIMARY KEY,
	quantidade INTEGER,
    fk_cod_produto INTEGER,
    fk_cod_ingrediente INTEGER
);

CREATE TABLE ingrediente (
    cod_ingrediente INTEGER PRIMARY KEY,
    nome VARCHAR(50),
    fk_cod_tipo_medida INTEGER
);

CREATE TABLE tipo_medida (
    cod_tipo_medida INTEGER PRIMARY KEY,
    descricao VARCHAR(50)
);

CREATE TABLE cliente (
    cod_cliente INTEGER PRIMARY KEY,
    nome VARCHAR(50) 
);

CREATE TABLE telefone (
    cod_telefone INTEGER PRIMARY KEY,
    descricao VARCHAR(50),
	fk_cod_cliente INTEGER
);

INSERT INTO tipo_pagamento VALUES 
	(1, 'PIX'),
	(2, 'PicPay'),
	(3, 'Crédito'),
	(4, 'Débito'),
	(5, 'Dinheiro');
	
INSERT INTO pedido VALUES
	(1,	'2022-05-17 10:11', '2022-05-21 10:11', 100, 1, 1),
	(2,	'2022-05-18 10:11', '2022-05-22 10:11', 50,	5, 2),
	(3,	'2022-05-19 10:11', '2022-05-23 10:11', 150, 3, 3),
	(4,	'2022-05-20 10:11', '2022-05-24 10:11', 100, 3, 4),
	(5,	'2022-05-21 10:11', '2022-05-25 10:11', 50, 2, 5),
	(6,	'2022-06-17 10:11',	'2022-06-21 10:11',	140, 1,	9),
	(7,	'2022-03-06 10:11',	'2022-03-10 10:11',	140, 2,	14),
	(8,	'2022-04-26 10:11',	'2022-04-30 10:11',	168, 3,	17),
	(9,	'2022-06-15 10:11', '2022-06-25 10:11',	300, 5,	2),
	(10, '2022-12-07 10:11', '2022-12-12 10:11', 93, 3,	6),
	(11, '2022-10-13 10:11', '2022-10-15 10:11', 170, 5, 18),
	(12, '2022-11-24 10:11', '2022-11-28 10:11', 47, 1,	20),
	(13, '2022-09-12 10:11', '2022-09-19 10:11', 110, 4, 9),
	(14, '2022-10-20 10:11', '2022-10-30 10:11', 100, 2, 7),
	(15, '2022-04-26 10:11', '2022-04-30 10:11', 20, 3,	17),
	(16, '2022-09-19 10:11', '2022-09-22 10:11', 47, 3, 5),
	(17, '2022-11-15 10:11', '2022-11-24 10:11', 100, 2, 11),
	(18, '2022-08-14 10:11', '2022-08-22 10:11', 70, 3,	19),
	(19, '2022-06-10 10:11', '2022-06-11 10:11', 40, 4, 5),
	(20, '2022-04-06 10:11', '2022-04-25 10:11', 51, 1,	19),
	(21, '2022-10-08 10:11', '2022-10-13 10:11', 150, 1, 9),
	(22, '2022-07-13 10:11', '2022-07-17 10:11', 69, 5,	7),
	(23, '2022-12-01 10:11', '2022-12-15 10:11', 30, 3,	2),
	(24, '2022-06-25 10:11', '2022-06-29 10:11', 64, 1,	13),
	(25, '2022-08-02 10:11', '2022-08-04 10:11', 30, 3,	2),
	(26, '2022-03-18 10:11', '2022-03-19 10:11', 100, 4, 5),
	(27, '2022-08-15 10:11', '2022-08-18 10:11', 24, 1,	10),
	(28, '2022-12-04 10:11', '2022-12-20 10:11', 68, 4,	9),
	(29, '2022-04-20 10:11', '2022-04-27 10:11', 100, 2, 2),
	(30, '2022-06-09 10:11', '2022-06-12 10:11', 40, 5,	3),
	(31, '2022-05-29 10:11', '2022-05-30 10:11', 290, 3, 16);

INSERT INTO produto VALUES
	(1, 'Cento de brigadeiro', 50),
	(2, 'Bolo de fuba', 30),
	(3, 'Cento de beijinho', 50),
	(4, 'Bolo de chocolate', 30),
	(5, 'Pudim', 20),
	(6, 'Maria mole', 10),
	(7, 'Brownie', 25),
	(8, 'Bolo de cenoura', 30),
	(9, 'Bolo de limão', 30),
	(10, 'Suspiro', 15),
	(11, 'Palha italiana', 5),
	(12, 'Cookie', 6),
	(13, 'Doce de pote', 13),
	(14, 'Bombom', 9),
	(15, 'Trufa', 7),
	(16, 'Pipoca doce jumbo', 17),
	(17, 'Rocambole de prestigio', 50),
	(18, 'Cupcake', 10),
	(19, 'Mousse de maracuja', 20),
	(20, 'Mousse de morango', 20);
	
INSERT INTO preparo VALUES
	(1, 'Bata todos os ingredientes no liquidificador.', 1,	2),
	(2,	'Coloque em uma forma untada e enfarinhada.', 2, 2),
	(3,	'Leve ao forno preaquecido e deixe assar, por cerca de 40 minutos.', 3, 2),
	(4,	'Em uma panela funda, acrescente o leite condensado, a margarina e o achocolatado.', 1, 1),
	(5,	'Cozinhe em fogo médio e mexa até que o brigadeiro comece a desgrudar da panela.', 2, 1),
	(6,	'Deixe esfriar e faça pequenas bolas com a mão passando a massa no chocolate granulado.', 3, 1),
	(7,	'Coloque o leite condensado, o leite e a manteiga numa panela pequena e leve ao fogo baixo. Mexa com uma espátula de silicone até a manteiga derreter.', 1, 3),
	(8,	'Acrescente ½ xícara (chá) do coco ralado e continue mexendo por cerca de 20 minutos, até o doce engrossar, no ponto de enrolar – mexa raspando bem os fundos e lateral da panela com a espátula para não queimar. Atenção para o ponto: incline levemente a panela para verificar, a massa de beijinho deve descolar do fundo da panela.', 2, 3),
	(9,	'Transfira o beijinho para um prato fundo (ou travessa) e deixe esfriar completamente em temperatura ambiente antes de enrolar.', 3, 3),
	(10,	'Abra 23 forminhas de doce (tamanho nº5). Num prato fundo coloque o restante do coco ralado. Para modelar os beijinhos: unte as mãos com um pouco de manteiga e enrole uma porção de beijinho formando uma bolinha. Passe pelo coco ralado seco, cobrindo bem toda a superfície do doce. Coloque o doce numa forminha e espete com um cravo. Repita com o restante.', 4, 3),
	(11,	'Bata no liquidificador os ovos por 5 minutos.', 1, 4),
	(12,	'Acrescente aos poucos os demais ingredientes, exceto o fermento.', 2, 4),
	(13,	'Depois de bater acrescente então o fermento.', 3, 4),
	(14,	'Coloque em uma forma média untada e enfarinhada.', 4, 4),
	(15,	'Leve para assar em forno médio, pré-aquecido por 45 minutos, ou até dourar.', 5, 4),
	(16,	'Leve ao fogo baixo, a margariana com açúcar.', 6, 4),
	(17,	'Acrescentando aos pouco o chocolate.', 7, 4),
	(18,	'Deixe ferver e despeje sobre o bolo ainda quente.', 8, 4),
	(19,	'Primeiro, bata bem os ovos no liquidificador.', 1, 5),
	(20,	'Acrescente o leite condensado e o leite, e bata novamente.', 2, 5),
	(21,	'Para a calda, derreta o açúcar na panela até ficar moreno, acrescente a água e deixe engrossar.', 3, 5),
	(22,	'Coloque em uma forma redonda e despeje a massa do pudim por cima.', 4, 5),
	(23,	'Asse em forno médio por 45 minutos, com a assadeira redonda dentro de uma maior com água.', 5, 5),
	(24,	'Espete um garfo para ver se está bem assado.', 6,5),
	(25,	'Deixe esfriar e desenforme.', 7, 5);
	
INSERT INTO cliente VALUES
	(1, 'Moises da Silva'),
	(2, 'Camila Volponi'),
	(3, 'Mariazinha Feirreira'),
	(4, 'Vitor da Silva'),
	(5,	'Marcelo da Vitória'),
	(6,'Clara Santos'),
	(7,'Higor Silva'),
	(8,'Gustavo Ferrari'),
	(9,'Mariah Ferrari'),
	(10, 'Carol Soares'),
	(11, 'Otávio Almeida'),
	(12, 'Priscila Dias'),
	(13, 'Leila Barros'),
	(14, 'Lais Barros'),
	(15, 'Leticia Lima'),
	(16, 'Hellen Canejo'),
	(17, 'Irís Branco'),
	(18, 'Cecília Chaves'),
	(19, 'Romeu Resende'),
	(20, 'Michele Meira');
	
INSERT INTO telefone VALUES
	(1, '27 99999-1111', 1),
	(2, '27 99999-2222', 2),
	(3, '27 99999-3333', 3),
	(4, '27 99999-4444', 4),
	(5, '27 99999-5555', 5),
	(6, '21 99555-6515', 1),
	(7, '21 92565-1447', 1),
	(8, '27 95545-1552', 4),
	(9, '21 94852-1566', 9),
	(10, '22 94852-1566', 10),
	(11, '23 94852-1566', 11),
	(12, '24 94852-1566', 12),
	(13, '25 94852-1566', 16),
	(14, '26 94852-1566', 14),
	(15, '27 94852-1566', 15),
	(16, '28 94852-1566', 2),
	(17, '29 94852-1566', 20),
	(18, '30 94852-1566', 18),
	(19, '31 94852-1566', 9),
	(20, '32 94852-1566', 19);
	
INSERT INTO tipo_medida VALUES
	(1, 'Unidade'),
	(2, 'Xicara'),
	(3, 'Colher de sopa'),
	(4, 'Copo'),
	(5, 'Caixa'),
	(6, 'A gosto');

INSERT INTO ingrediente VALUES	
	(1, 'Ovo', 1),
	(2, 'Açucar', 2),
	(3, 'Fubá', 2),
	(4, 'Farinha de trigo', 3),
	(5, 'Óleo', 4),
	(6, 'Leite', 4),
	(7, 'Fermento em pó', 3),
	(8, 'Leite condesado', 5),
	(9, 'Margarina sem sal', 3),
	(10, 'Achocolatado', 3),
	(11, 'Chocolate granulado', 6),
	(12, 'Coco seco ralado', 2),
	(13, 'Manteiga', 3),
	(14, 'Cravos-da-índia', 1),
	(15, 'Açucar Refinado', 3),
	(16, 'Água', 2),
	(17, 'Açucar Mascavo', 2),
	(18, 'Chocolate meio amargo', 8),
	(19, 'Essência de bounilha', 7),
	(20, 'Clara do ovo', 1),
	(21, 'Gelatina em pó', 1),
	(22, 'Milho de pipoca', 1);
		
INSERT INTO pedido_produto VALUES
	(1,	1, 50, 2, 1),
	(2,	2, 100, 3, 3),
	(3,	1, 50, 3, 1),
	(4,	1, 30, 5, 4),
	(5,	1, 20, 5, 5),
	(6,	1, 50, 1, 1),
	(7,	1, 50, 1, 3),
	(8,	5, 100, 4, 5),
	(9,	1, 30, 6, 8),
	(10, 2,	100, 6, 1),
	(11, 1,	10, 6, 6),
	(12, 5,	100, 7, 20),
	(13, 2, 40, 7, 19),
	(14, 1, 7, 8, 15),
	(15, 3, 51, 8, 16),
	(16, 2, 100, 8, 3),
	(17, 1, 10, 8, 18),
	(18, 50, 300, 9, 12),
	(19, 1, 30, 10, 9),
	(20, 1, 20, 10, 5),
	(21, 1, 20, 10, 19),
	(22, 1, 13, 10, 13),
	(23, 1, 10, 10, 6),
	(24, 10, 170, 11, 16),
	(25, 2, 40, 12, 5),
	(26, 1, 7, 12, 15),
	(27, 2, 50, 13, 7),
	(28, 1, 30, 13, 8),
	(29, 3, 30, 13, 18),
	(30, 2, 100, 14, 17),
	(31, 1, 20, 15, 19),
	(32, 2, 26, 16, 13),
	(33, 3, 21, 16, 15),
	(34, 2, 100, 17, 17),
	(35, 2, 60, 18, 2),
	(36, 1, 10, 18, 6),
	(37, 2, 40, 19, 19),
	(38, 3, 51, 20, 16),
	(39, 6, 150, 21, 7),
	(40, 1, 30, 22, 4),
	(41, 1, 9, 22, 14),
	(42, 1, 30, 22, 8),
	(43, 1, 30, 23, 9),
	(44, 2, 30, 24, 10),
	(45, 2, 34, 24, 16),
	(46, 3, 30, 25, 6),
	(47, 2, 100, 26, 1),
	(48, 4, 24, 27, 12),
	(49, 1, 50, 28, 17),
	(50, 2, 18, 28, 14),
	(51, 2, 100, 29, 17),
	(52, 4, 40, 30, 6),
	(53, 1, 30, 31, 2),
	(54, 5, 250, 31, 3),
	(55, 2, 10, 31, 11);

INSERT INTO produto_ingrediente VALUES
	(1,3,2,1),
	(2,2,2,2),
	(3,2,2,3),
	(4,3,2,4),
	(5,0.5,2,5),
	(6,1,2,6),
	(7,1,2,7),
	(8,1,1,8),
	(9,1,1,9),
	(10,7,1,10),
	(11,1,1,10),
	(12,1,1,11),
	(13,1,3,8),
	(14,1,3,12),
	(15,0.75,3,6),
	(16,1,3,13),
	(17,23,3,14),
	(18,1,4,5),
	(19,1,4,6),
	(20,2,4,4),
	(21,1,4,10),
	(22,1,4,1),
	(23,2,4,1),
	(24,1,4,7),
	(25,1,4,9),
	(26,3,4,10),
	(27,1,4,15),
	(28,1,5,8),
	(29,1,5,6),
	(30,3,5,1),
	(31,1,5,2),
	(32,0.5,5,16),
	(33,2,12,13),
	(34,0.75,12,2),
	(35,0.5,12,17),
	(36,1,12,1),
	(37,1.75,12,4),
	(38,1,12,7),
	(39,300,12,18),
	(40,1,12,19),
	(41,1,12,10),
	(42,1,10,20),
	(43,10,10,2),
	(44,1,6,21),
	(45,1,6,16),
	(46,0.5,6,2),
	(47,1,6,16),
	(48,5,16,5),
	(49,5,16,22),
	(50,5,16,2),
	(51,3,16,16),
	(52,1,16,10);

ALTER TABLE pedido		 
ADD CONSTRAINT fk_tipo_pagamento FOREIGN KEY (fk_cod_tipo_pagamento) REFERENCES tipo_pagamento(cod_tipo_pagamento) ON DELETE CASCADE,
ADD CONSTRAINT fk_cliente FOREIGN KEY (fk_cod_cliente) REFERENCES cliente(cod_cliente) ON DELETE CASCADE;

ALTER TABLE pedido_produto		 
ADD CONSTRAINT fk_pedido FOREIGN KEY (fk_cod_pedido) REFERENCES pedido(cod_pedido) ON DELETE CASCADE,
ADD CONSTRAINT fk_produto FOREIGN KEY (fk_cod_produto) REFERENCES produto(cod_produto) ON DELETE CASCADE;

ALTER TABLE preparo
ADD CONSTRAINT fk_produto_preparo FOREIGN KEY(fk_cod_produto) REFERENCES produto(cod_produto);

ALTER TABLE telefone		 
ADD CONSTRAINT fk_telefone_cliente FOREIGN KEY(fk_cod_cliente) REFERENCES cliente(cod_cliente) ON DELETE CASCADE;

ALTER TABLE ingrediente		 
ADD CONSTRAINT fk_tipo_medida FOREIGN KEY(fk_cod_tipo_medida) REFERENCES tipo_medida(cod_tipo_medida);

ALTER TABLE produto_ingrediente		 
ADD CONSTRAINT fk_produto_ingre FOREIGN KEY(fk_cod_produto) REFERENCES produto(cod_produto),
ADD CONSTRAINT fk_ingrediente FOREIGN KEY(fk_cod_ingrediente) REFERENCES ingrediente(cod_ingrediente);
