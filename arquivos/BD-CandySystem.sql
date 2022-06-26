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
	(6,	'2021-05-21 10:11', '2022-08-25 10:11', 200, 5, 9);

INSERT INTO produto VALUES
	(1, 'Cento de brigadeiro', 50),
	(2, 'Bolo de fuba', 30),
	(3, 'Cento de beijinho', 50),
	(4, 'Bolo de chocolate', 30),
	(5, 'Pudim', 20);
	
INSERT INTO preparo VALUES
	(1, 'Bata todos os ingredientes no liquidificador.', 1,	2),
	(2,	'Coloque em uma forma untada e enfarinhada.', 2, 2),
	(3,	'Leve ao forno preaquecido e deixe assar, por cerca de 40 minutos.', 3, 2),
	(4,	'Em uma panela funda, acrescente o leite condensado, a margarina e o achocolatado.', 1, 1),
	(5,	'Cozinhe em fogo médio e mexa até que o brigadeiro comece a desgrudar da panela.', 2, 1),
	(6,	'Deixe esfriar e faça pequenas bolas com a mão passando a massa no chocolate granulado.', 3, 1);
	
INSERT INTO cliente VALUES
	(1, 'Moises da Silva'),
	(2, 'Camila Volponi'),
	(3, 'Mariazinha Feirreira'),
	(4, 'Vitor da Silva'),
	(5,	'Marcelo da Vitória'),
	(6,'Clara Santos'),
	(7,'Higor Silva'),
	(8,'Gustavo Ferrari '),
	(9,'Mariah Ferrari ');
	
INSERT INTO telefone VALUES
	(1, '27 99999-1111', 1),
	(2, '27 99999-2222', 2),
	(3, '27 99999-3333', 3),
	(4, '27 99999-4444', 4),
	(5, '27 99999-5555', 5),
	(6, '21 99555-6515',1),
	(7, '21 92565-1447',1),
	(8, '27 95545-1552',4),
	(9, '21 94852-1566',9);
	
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
	(11, 'Chocolate granulado', 6);
		
INSERT INTO pedido_produto VALUES
	(1, 1, 50, 2,	1),
	(2, 2, 50, 3,	3),
	(3, 1, 50, 3,	1),
	(4, 1, 30, 5,	4),
	(5, 1, 20, 5,	5),
	(6, 1, 50, 1,	1),
	(7, 1, 50, 1,	3),
	(8, 5, 20, 4,	5),
	(9, 1, 70, 6,	5);

INSERT INTO produto_ingrediente VALUES
	(1, 3,	2,	1),
	(2, 2,	2,	2),
	(3, 2,	2,	3),
	(4, 3,	2,	4),
	(5, 0.5,	2,	5),
	(6, 1,	2,	6),
	(7, 1,	2,	7),
	(8, 1,	1,	8),
	(9, 1,	1,	9),
	(10, 7,	1,	10),
	(11, 1,	1,	11);

ALTER TABLE pedido		 
ADD CONSTRAINT fk_tipo_pagamento FOREIGN KEY (fk_cod_tipo_pagamento) REFERENCES tipo_pagamento(cod_tipo_pagamento),
ADD CONSTRAINT fk_cliente FOREIGN KEY (fk_cod_cliente) REFERENCES cliente(cod_cliente);

ALTER TABLE pedido_produto		 
ADD CONSTRAINT fk_pedido FOREIGN KEY (fk_cod_pedido) REFERENCES pedido(cod_pedido),
ADD CONSTRAINT fk_produto FOREIGN KEY (fk_cod_produto) REFERENCES produto(cod_produto);

ALTER TABLE preparo
ADD CONSTRAINT fk_produto_preparo FOREIGN KEY(fk_cod_produto) REFERENCES produto(cod_produto);

ALTER TABLE telefone		 
ADD CONSTRAINT fk_telefone_cliente FOREIGN KEY(fk_cod_cliente) REFERENCES cliente(cod_cliente);

ALTER TABLE ingrediente		 
ADD CONSTRAINT fk_tipo_medida FOREIGN KEY(fk_cod_tipo_medida) REFERENCES tipo_medida(cod_tipo_medida);

ALTER TABLE produto_ingrediente		 
ADD CONSTRAINT fk_produto_ingre FOREIGN KEY(fk_cod_produto) REFERENCES produto(cod_produto),
ADD CONSTRAINT fk_ingrediente FOREIGN KEY(fk_cod_ingrediente) REFERENCES ingrediente(cod_ingrediente);
