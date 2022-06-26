# TRABALHO 01:  Título do Trabalho
Trabalho desenvolvido durante a disciplina de BD1

# Sumário

### 1. COMPONENTES<br>
Vitor Siqueira da Silva: vitor.silva.ifes@gmail.com<br>
Camila Fornaciari Volponi: camilavolponi19@gmail.com<br>

### 2. INTRODUÇÃO E MOTIVAÇÃO<br>
Este documento contém a especificação do projeto do banco de dados CandySystem e motivação da escolha realizada.
<br><br>
A criação do sistema CandySystem visa gerar uma melhoria na qualidade do trabalho de pequenos e médios confeiteiros ou confeitarias. Isso será feito provendo um sistema flexível capaz de auxiliar no gerenciamento de pedidos e produtos, capaz de ser usado por qualquer organização de pequeno e médio porte.
 

### 3. MINI-MUNDO<br>
Uma pessoa deseja possuir um sistema para gerenciar sua empresa de confeitaria, registrando pedidos e produtos. Do produto ele precisa saber o nome, preço e quantidade, onde terá acesso aos ingredientes e aos modos de preparo. Dos ingredientes precisa-se de nome, quantidade e unidade de medida e do modo de preparo precisa-se de cada passo para o preparo do produto e a ordem que será na receita. Além disso, do pedido ele precisa ter a data de entrega e horário previstos, forma de pagamento e ter os dados do cliente registrado, como nome, telefone e endereço.


### 4. PROTOTIPAÇÃO, PERGUNTAS A SEREM RESPONDIDAS E TABELA DE DADOS<br>
#### 4.1 RASCUNHOS BÁSICOS DA INTERFACE (MOCKUPS)<br>

![Primeira página do protótipo](https://github.com/V1t0rSS/Trab_BD1_2022/blob/master/images/prot%C3%B3tipo.png?raw=true "Title")
[Arquivo PDF do Protótipo Balsamiq](https://github.com/V1t0rSS/Trab_BD1_2022/blob/master/arquivos/Prototipo.pdf)

#### 4.2 QUAIS PERGUNTAS PODEM SER RESPONDIDAS COM O SISTEMA PROPOSTO?
    
> A CandySystem precisa inicialmente dos seguintes relatórios:
* Relatório contendo o nome e os pedidos feitos por um determinado cliente.
* Relatório contendo a lista completa de todos os pedidos feitos em um determinado período de tempo, independente do cliente que os realizou.
* Relatório contendo quais pedidos foram feitos em um determinado período de tempo por um determinado cliente.
* Relatório de quais são os produtos que estão em um pedido de um determinado cliente.
* Relatório contendo nome, tipo de medida e quantidade dos ingredientes de um determinado produto.
* Relatório contendo os passos do preparo de um produto, em ordem.
 
#### 4.3 TABELA DE DADOS DO SISTEMA:    
[Tabela unificada CandySystem](https://github.com/V1t0rSS/Trab_BD1_2022/blob/master/arquivos/Tabela%20unificada%20com%2010%20linhas.xlsx?raw=true "Title")
    
    
### 5. MODELO CONCEITUAL<br>
![Alt text](https://github.com/V1t0rSS/Trab_BD1_2022/blob/master/images/modeloConceitual.png)
    

#### 5.1 Validação do Modelo Conceitual
    Grupo01: Giovanni Sencioles e Emanuel Norjosa Luz
    Grupo02: Ana Gabriella Gomes de Almeida Ferreira e Pedro Aguiar Alves

#### 5.2 Descrição dos dados 
    [objeto]: [descrição do objeto]
    
    TIPO_PAGAMENTO: Tabela que armazena as informações relativas aos tipo de pagamento.<br>
    codTipoPagamento: Campo que armazena o código único dos tipos de pagamento.<br>
    descricao: Campo que armazena o nome do tipo de pagamento.<br>
   
    Composto_por: Relacionamento entre a tabela TIPO_PAGAMENTO e PEDIDO.<br>
    
    PEDIDO: Tabela que armazena as informações relativas aos tipo de pagamento.<br>
    codPedido: Campo que armazena o código único dos pedidos.<br>
    dataHoraCriacao: Campo que armazena a data e hora da criação do pedido.<br>
    dataHoraEntregaPrevista: Campo que armazena a data e hora da entrega prevista do pedido.<br>
    
    Contem: Relacionamento entre a tabela PEDIDO e CLIENTE.<br>
    
    CLIENTE: Tabela que armazena as informações relativas aos clientes.<br>
    codCliente: Campo que armazena o código único dos clientes.<br>
    nome: Campo que armazena o nome das pessoas.<br>
    
    Possui: Relacionamento entre a tabela CLIENTE e TARELA.<br>
    
    TELEFONE: Tabela que armazena as informações relativas aos clientes.<br>
    codTelefone: Campo que armazena o código único dos telefones.<br>
    descriacao: Campo que armazena o número de telefone.<br>
    
    Especificado_por: Relacionamento entre a tabela PEDIDO e PRODUTO.<br>
    quantidade: Atributo no relecionamento, para gravar a quantidade de produtos em um pedido.<br>
    preco: Atributo no relecionamento, para gravar o preço de produtos em um pedido.<br>
    
    PRODUTO: Tabela armazena as informações relativas aos produtos.<br>
    codProduto: Campo que armazena o código único dos produtos.<br>
    nome: Campo que armazena o nome dos produtos.<br>
    preco: Campo que armazena o preco do produto.<br>
    
    Composto_por: Relacionamento entre a tabela PRODUTO e PREPARO.<br>
    
    PREPARO: Tabela armazena as informações relativas aos modo de preparo de um produto.<br>
    codPreparo: Campo que armazena o código único dos modos de preparos.<br>
    descricaoDoPasso: Campo que armazena a descrição do passo.<br>
    ordem: Campo que armazena o código único dos pedidos.<br>
    
    Composto_por: Relacionamento entre a tabela PRODUTO e INGREDIENTE.<br>
    quantidade: Atributo no relecionamento, para gravar a quantidade de ingredientes em um produto.
    
    INGREDIENTE: Tabela armazena as informações relativas aos ingrediente de um ou mais produtos.<br>
    codIngrediente: Campo que armazena o código único dos ingredientes.<br>
    nome: Campo que armazena o nome do ingrediente.<br>
    
    Composto_por: Relacionamento entre a tabela INGREDIENTE e TIPO_MEDIDA.<br>
    
    TIPO_MEDIDA: Tabela armazena as informações relativas aos tipo de medida.<br>
    codTipoMedida: Campo que armazena o código único dos tipos de medida.<br>
    descricao: Campo que armazena o nome do tipo de medida.<br>


### 6	MODELO LÓGICO<br>
![Alt text](https://github.com/V1t0rSS/Trab_BD1_2022/blob/master/images/modeloLogico.png)
 
### 7	MODELO FÍSICO<br>

* Criação tabela pedido
 
```
CREATE TABLE pedido(
	cod_pedido INTEGER PRIMARY KEY,
	data_hora_criacao TIMESTAMP,
	data_hora_entrega_prevista TIMESTAMP,
	preco_total FLOAT(4),
	fk_cod_tipo_pagamento INTEGER,
	fk_cod_cliente INTEGER
);

ALTER TABLE pedido		 
ADD CONSTRAINT fk_tipo_pagamento FOREIGN KEY (fk_cod_tipo_pagamento) REFERENCES tipo_pagamento(cod_tipo_pagamento),
ADD CONSTRAINT fk_cliente FOREIGN KEY (fk_cod_cliente) REFERENCES cliente(cod_cliente);
```

* Criação tabela tipo_pagamento
```
CREATE TABLE tipo_pagamento (
 cod_tipo_pagamento INTEGER PRIMARY KEY,
 descricao VARCHAR(50) 
);
```

* Criação tabela pedido_produto
``` 
CREATE TABLE pedido_produto(
	cod_ped_prod INTEGER PRIMARY KEY,
	quantidade INTEGER,
	preco FLOAT,
	fk_cod_pedido INTEGER,
	fk_cod_produto INTEGER
);

ALTER TABLE pedido_produto		 
ADD CONSTRAINT fk_pedido FOREIGN KEY (fk_cod_pedido) REFERENCES pedido(cod_pedido),
ADD CONSTRAINT fk_produto FOREIGN KEY (fk_cod_produto) REFERENCES produto(cod_produto);
```

* Criação tabela produto 
``` 
CREATE TABLE produto (
 cod_produto INTEGER PRIMARY KEY,
 nome VARCHAR(50),
 preco FLOAT(4) 
);
```

* Criação tabela preparo
```
CREATE TABLE preparo (
 cod_preparo INTEGER PRIMARY KEY,
 descricao_passo VARCHAR(100),
 ordem INTEGER,
 fk_cod_produto INTEGER 
);

ALTER TABLE preparo
ADD CONSTRAINT fk_produto_preparo FOREIGN KEY(fk_cod_produto) REFERENCES produto(cod_produto);
```

* Criação tabela produto_ingrediente
```
CREATE TABLE produto_ingrediente (
 cod_prod_ingre INTEGER PRIMARY KEY,
 quantidade INTEGER,
 fk_cod_produto INTEGER,
 fk_cod_ingrediente INTEGER
);

ALTER TABLE produto_ingrediente		 
ADD CONSTRAINT fk_produto_ingre FOREIGN KEY(fk_cod_produto) REFERENCES produto(cod_produto),
ADD CONSTRAINT fk_ingrediente FOREIGN KEY(fk_cod_ingrediente) REFERENCES ingrediente(cod_ingrediente);
```
 
* Criação tabela ingrediente
``` 
CREATE TABLE ingrediente (
 cod_ingrediente INTEGER PRIMARY KEY,
 nome VARCHAR(50),
 fk_cod_tipo_medida INTEGER 
);

ALTER TABLE ingrediente		 
ADD CONSTRAINT fk_tipo_medida FOREIGN KEY(fk_cod_tipo_medida) REFERENCES tipo_medida(cod_tipo_medida);
```

* Criação tabela tipo_medida 
```
CREATE TABLE tipo_medida (
 cod_tipo_medida INTEGER PRIMARY KEY,
 descricao VARCHAR(50) 
);
```

* Criação tabela cliente
``` 
CREATE TABLE cliente (
    cod_cliente INTEGER PRIMARY KEY,
    nome VARCHAR(50) 
);
```

* Criação tabela telefone
```
CREATE TABLE telefone (
    cod_telefone INTEGER PRIMARY KEY,
    descricao VARCHAR(50),
	   fk_cod_cliente INTEGER
);

ALTER TABLE telefone		 
ADD CONSTRAINT fk_telefone_cliente FOREIGN KEY(fk_cod_cliente) REFERENCES cliente(cod_cliente);
```

### 8	INSERT APLICADO NAS TABELAS DO BANCO DE DADOS<br>
* Inserir dados na tabela pedido
```
INSERT INTO pedido VALUES
 (1, '2022-05-17 10:11', '2022-05-21 10:11', 100, 1, 1),
 (2, '2022-05-18 10:11', '2022-05-22 10:11', 50, 5, 2),
 (3, '2022-05-19 10:11', '2022-05-23 10:11', 150, 3, 3),
 (4, '2022-05-20 10:11', '2022-05-24 10:11', 100, 3, 4),
 (5, '2022-05-21 10:11', '2022-05-25 10:11', 50, 2, 5);
```

* Inserir dados na tabela tipo_pagamento
```
INSERT INTO tipo_pagamento VALUES 
 (1, 'PIX'),
 (2, 'PicPay'),
 (3, 'Crédito'),
 (4, 'Débito'),
 (5, 'Dinheiro');
```

* Inserir dados na tabela pedido_produto
``` 
INSERT INTO pedido_produto VALUES
 (1, 1, 50, 2, 1),
 (2, 2, 50, 3, 3),
 (3, 1, 50, 3, 1),
 (4, 1, 30, 5, 4),
 (5, 1, 20, 5, 5),
 (6, 1, 50, 1, 1),
 (7, 1, 50, 1, 3),
 (8, 5, 20, 4, 5);
```

* Inserir dados na tabela produto 
``` 
INSERT INTO produto VALUES
 (1, 'Cento de brigadeiro', 50),
 (2, 'Bolo de fuba', 30),
 (3, 'Cento de beijinho', 50),
 (4, 'Bolo de chocolate', 30),
 (5, 'Pudim', 20);
```

* Inserir dados na tabela preparo
```
INSERT INTO preparo VALUES
 (1, 'Bata todos os ingredientes no liquidificador.', 1, 2),
 (2, 'Coloque em uma forma untada e enfarinhada.', 2, 2),
 (3, 'Leve ao forno preaquecido e deixe assar, por cerca de 40 minutos.', 3, 2),
 (4, 'Em uma panela funda, acrescente o leite condensado, a margarina e o achocolatado.', 1, 1),
 (5, 'Cozinhe em fogo médio e mexa até que o brigadeiro comece a desgrudar da panela.', 2, 1),
 (6, 'Deixe esfriar e faça pequenas bolas com a mão passando a massa no chocolate granulado.', 3, 1);
```

* Inserir dados na tabela produto_ingrediente
```
INSERT INTO produto_ingrediente VALUES
 (1, 3, 2, 1),
 (2, 2, 2, 2),
 (3, 2, 2, 3),
 (4, 3, 2, 4),
 (5, 0.5, 2, 5),
 (6, 1, 2, 6),
 (7, 1, 2, 7),
 (8, 1, 1, 8),
 (9, 1, 1, 9),
 (10, 7, 1, 10),
 (11, 1, 1, 11);
```
 
* Inserir dados na tabela ingrediente
``` 
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
```

* Inserir dados na tabela tipo_medida 
```
INSERT INTO tipo_medida VALUES
 (1, 'Unidade'),
 (2, 'Xicara'),
 (3, 'Colher de sopa'),
 (4, 'Copo'),
 (5, 'Caixa'),
 (6, 'A gosto');
```

* Inserir dados na tabela cliente
``` 
INSERT INTO cliente VALUES
 (1, 'Moises da Silva'),
 (2, 'Camila Volponi'),
 (3, 'Mariazinha Feirreira'),
 (4, 'Vitor da Silva'),
 (5, 'Marcelo da Vitória');
```

* Inserir dados na tabela telefone
```
INSERT INTO telefone VALUES
 (1, '27 99999-1111', 1),
 (2, '27 99999-2222', 2),
 (3, '27 99999-3333', 3),
 (4, '27 99999-4444', 4),
 (5, '27 99999-5555', 5);
```
[Arquivo em sql - DROP/CREATE/INSERT](https://github.com/VitorSSilva21/Trab_BD1_2022/blob/master/arquivos/BD-CandySystem.sql?raw=true "Title")

### 9	TABELAS E PRINCIPAIS CONSULTAS<br>
#### 9.1	CONSULTAS DAS TABELAS COM TODOS OS DADOS INSERIDOS<br>
[Consultas no COLAB - 9.1](https://colab.research.google.com/drive/1OJhC1kUK6bbt_VKg-hz9nJS60OJidT7u?usp=sharing?raw=true "Title")

#### 9.2	CONSULTAS DAS TABELAS COM FILTROS WHERE<br>
[Consultas no COLAB - 9.2](https://colab.research.google.com/drive/1dNiBibPb6vurhAvR5YxppJmfPXLmLFy9?usp=sharing?usp=sharing?raw=true "Title")

```
SELECT * FROM pedido
WHERE data_hora_entrega_prevista > '2022-05-23'
```
![Alt text](https://github.com/VitorSSilva21/Trab_BD1_2022/blob/master/images/topicos%209.2%20ao%209.10/9.2/9.2-select1.png)

```
SELECT * FROM pedido
WHERE preco_total < 100
```
![Alt text](https://github.com/VitorSSilva21/Trab_BD1_2022/blob/master/images/topicos%209.2%20ao%209.10/9.2/9.2-select2.png)

```
SELECT * FROM produto
WHERE preco = 50
```
![Alt text](https://github.com/VitorSSilva21/Trab_BD1_2022/blob/master/images/topicos%209.2%20ao%209.10/9.2/9.2-select3.png)

```
SELECT * FROM preparo
WHERE fk_cod_produto = 2
```
![Alt text](https://github.com/VitorSSilva21/Trab_BD1_2022/blob/master/images/topicos%209.2%20ao%209.10/9.2/9.2-select4.png)

#### 9.3	CONSULTAS QUE USAM OPERADORES LÓGICOS, ARITMÉTICOS E TABELAS OU CAMPOS RENOMEADOS <br>
[Consultas no COLAB - 9.3](https://colab.research.google.com/drive/1942GfBfeyVaW_pVip5UW0IM9Bk-bsKBZ?usp=sharing?raw=true "Title")

```
SELECT * FROM cliente 
WHERE nome = 'Camila Volponi' OR nome = 'Vitor da Silva'
```
![Alt text](https://github.com/VitorSSilva21/Trab_BD1_2022/blob/master/images/topicos%209.2%20ao%209.10/9.3/9.3-select1.png)

```
SELECT * FROM produto
WHERE (NOT preco=50)
```
![Alt text](https://github.com/VitorSSilva21/Trab_BD1_2022/blob/master/images/topicos%209.2%20ao%209.10/9.3/9.3-select2.png)

```
SELECT * FROM pedido
WHERE (data_hora_criacao>'2022-05-19' AND data_hora_entrega_prevista>'2022-05-23')
```
![Alt text](https://github.com/VitorSSilva21/Trab_BD1_2022/blob/master/images/topicos%209.2%20ao%209.10/9.3/9.3-select3.png)

```
SELECT * FROM produto_ingrediente
WHERE (quantidade>1 AND fk_cod_produto=2)
```
![Alt text](https://github.com/VitorSSilva21/Trab_BD1_2022/blob/master/images/topicos%209.2%20ao%209.10/9.3/9.3-select4.png)

```
SELECT * FROM pedido_produto
WHERE (quantidade>1 OR preco=50)
```
![Alt text](https://github.com/VitorSSilva21/Trab_BD1_2022/blob/master/images/topicos%209.2%20ao%209.10/9.3/9.3-select5.png)

```
SELECT nome, preco, (preco*0.8) AS preco_com_desconto FROM produto
```
![Alt text](https://github.com/VitorSSilva21/Trab_BD1_2022/blob/master/images/topicos%209.2%20ao%209.10/9.3/9.3-select6.png)

```
SELECT cod_ped_prod, quantidade, preco, quantidade*preco AS valor_total_por_produto FROM pedido_produto
```
![Alt text](https://github.com/VitorSSilva21/Trab_BD1_2022/blob/master/images/topicos%209.2%20ao%209.10/9.3/9.3-select7.png)

```
SELECT cod_ped_prod, quantidade*2 AS quantidade_dobrada, preco*2 AS preco_dobrada FROM pedido_produto
WHERE cod_ped_prod=2
```
![Alt text](https://github.com/VitorSSilva21/Trab_BD1_2022/blob/master/images/topicos%209.2%20ao%209.10/9.3/9.3-select8.png)

```
SELECT cod_pedido AS numero_pedido, fk_cod_cliente AS cliente, fk_cod_tipo_pagamento AS pagamento_credito FROM pedido AS pedido_credito
WHERE fk_cod_tipo_pagamento=3
```
![Alt text](https://github.com/VitorSSilva21/Trab_BD1_2022/blob/master/images/topicos%209.2%20ao%209.10/9.3/9.3-select9.png)

```
SELECT cod_pedido AS numero_pedido, fk_cod_cliente AS cliente, preco_total AS total_igual_50 FROM pedido 
WHERE preco_total=50
```
![Alt text](https://github.com/VitorSSilva21/Trab_BD1_2022/blob/master/images/topicos%209.2%20ao%209.10/9.3/9.3-select10.png)

```
SELECT cod_produto AS numero_produto, nome AS nome_produto, preco AS preco_abaixo_40 FROM produto
WHERE preco<40
```
![Alt text](https://github.com/VitorSSilva21/Trab_BD1_2022/blob/master/images/topicos%209.2%20ao%209.10/9.3/9.3-select11.png)


#### 9.4	CONSULTAS QUE USAM OPERADORES LIKE E DATAS <br>
[Consultas no COLAB - 9.4](https://colab.research.google.com/drive/1IS5huMMTbUdI84mEn8GMc25M9Zq_m-mH?usp=sharing?raw=true "Title")

```
select * from cliente 
where nome like 'M%';
```
![Alt text](https://github.com/VitorSSilva21/Trab_BD1_2022/blob/master/images/topicos%209.2%20ao%209.10/9.4/9.4-select1.png)

```
select * from cliente
where nome like '%a';
```
![Alt text](https://github.com/VitorSSilva21/Trab_BD1_2022/blob/master/images/topicos%209.2%20ao%209.10/9.4/9.4-select2.png)

```
select * from cliente
where nome ilike '%si%';
```
![Alt text](https://github.com/VitorSSilva21/Trab_BD1_2022/blob/master/images/topicos%209.2%20ao%209.10/9.4/9.4-select3.png)

```
select * from produto 
where nome like '_ento%';
```
![Alt text](https://github.com/VitorSSilva21/Trab_BD1_2022/blob/master/images/topicos%209.2%20ao%209.10/9.4/9.4-select4.png)

```
select * from produto
where nome like '_____d%';
```
![Alt text](https://github.com/VitorSSilva21/Trab_BD1_2022/blob/master/images/topicos%209.2%20ao%209.10/9.4/9.4-select5.png)

```
select * from tipo_pagamento where descricao ilike 'p_%y'
```
![Alt text](https://github.com/VitorSSilva21/Trab_BD1_2022/blob/master/images/topicos%209.2%20ao%209.10/9.4/9.4-select6.png)

```
select * from ingrediente
where nome ilike 'f%o' or nome like '%ó'
```
![Alt text](https://github.com/VitorSSilva21/Trab_BD1_2022/blob/master/images/topicos%209.2%20ao%209.10/9.4/9.4-select7.png)

```
select data_hora_criacao, current_date as data_atual, current_date - data_hora_criacao as tempo_desde_pedido from pedido;
```
![Alt text](https://github.com/VitorSSilva21/Trab_BD1_2022/blob/master/images/topicos%209.2%20ao%209.10/9.4/9.4-select8.png)

```
select data_hora_criacao, now() as data_atual, now() - data_hora_criacao as tempo_desde_pedido from pedido;
```
![Alt text](https://github.com/VitorSSilva21/Trab_BD1_2022/blob/master/images/topicos%209.2%20ao%209.10/9.4/9.4-select9.png)

```
select data_hora_criacao, now() as data_atual, age(data_hora_criacao) from pedido;
```
![Alt text](https://github.com/VitorSSilva21/Trab_BD1_2022/blob/master/images/topicos%209.2%20ao%209.10/9.4/9.4-select10.png)

```
select data_hora_entrega_prevista, now() as data_hora_agora, age(data_hora_entrega_prevista) as tempo_entrega_atrasada from pedido;
```
![Alt text](https://github.com/VitorSSilva21/Trab_BD1_2022/blob/master/images/topicos%209.2%20ao%209.10/9.4/9.4-select11.png)

```
select cod_pedido, data_hora_entrega_prevista, extract('day' from data_hora_entrega_prevista) as dia_entregas from pedido;
```
![Alt text](https://github.com/VitorSSilva21/Trab_BD1_2022/blob/master/images/topicos%209.2%20ao%209.10/9.4/9.4-select12.png)

#### 9.5	INSTRUÇÕES APLICANDO ATUALIZAÇÃO E EXCLUSÃO DE DADOS<br>
[Consultas no COLAB - 9.5](https://colab.research.google.com/drive/1h4hulfm60yyMqPPG_WQOSMkcw10b2qWT?usp=sharing?raw=true "Title")
```
delete from cliente 
where cod_cliente > 6

delete from telefone 
where cod_telefone = 7;

delete cascade from cliente
where cod_cliente = 9;

update produto 
set preco = 70
where cod_produto = 5

update telefone 
set descricao = '21 99555-4596'
where cod_telefone = 6

update tipo_medida 
set descricao = 'Porção'
where cod_tipo_medida = 1

```


#### 9.6	CONSULTAS COM INNER JOIN E ORDER BY<br>
[Consultas no COLAB - 9.6](https://colab.research.google.com/drive/1Kz7MayLSaMfWQkr3a8QKjztMmP64176j?usp=sharing?raw=true "Title")
```
SELECT 	cliente.nome AS nome_cliente, 
                          telefone.descricao AS telefone_cliente, 
                          pedido.preco_total, 
                          pedido.data_hora_entrega_prevista, 
                          tipo_pagamento.descricao AS tipo_pagamento, 
                          produto.nome AS nome_produto, 
                          produto.preco AS preco_produto,
                          pedido_produto.quantidade AS quantidade_produto_no_pedido,
                          preparo.ordem AS ordem_passo,
                          preparo.descricao_passo AS passo,
                          ingrediente.nome AS ingrediente,
                          produto_ingrediente.quantidade AS quantidade_ingredientes,
                          tipo_medida.descricao AS tipo_medida
                  FROM pedido
                  INNER JOIN cliente ON (cliente.cod_cliente = pedido.fk_cod_cliente)
                  INNER JOIN telefone ON (cliente.cod_cliente = telefone.fk_cod_cliente)
                  INNER JOIN tipo_pagamento ON (tipo_pagamento.cod_tipo_pagamento = pedido.fk_cod_tipo_pagamento)
                  INNER JOIN pedido_produto ON (pedido.cod_pedido = pedido_produto.fk_cod_pedido)
                  INNER JOIN produto ON (pedido_produto.fk_cod_produto = produto.cod_produto)
                  INNER JOIN preparo ON (produto.cod_produto = preparo.fk_cod_produto)
                  INNER JOIN produto_ingrediente ON (produto.cod_produto = produto_ingrediente.fk_cod_produto)
                  INNER JOIN ingrediente ON (produto_ingrediente.fk_cod_ingrediente = ingrediente.cod_ingrediente)
                  INNER JOIN tipo_medida ON (ingrediente.fk_cod_tipo_medida = tipo_medida.cod_tipo_medida)
                  WHERE cliente.cod_cliente = 1
                  ORDER BY cliente.nome
```
![Alt text](https://github.com/VitorSSilva21/Trab_BD1_2022/blob/master/images/topicos%209.2%20ao%209.10/9.6/9.6-select1.png)
```
SELECT  produto.nome as nome_produto,
                          ingrediente.nome as nome_ingrediente,
                          produto_ingrediente.quantidade AS quantidade_ingrediente,
                          tipo_medida.descricao as tipo_medida
                  FROM produto
                  INNER JOIN produto_ingrediente ON (produto.cod_produto = produto_ingrediente.fk_cod_produto)
                  INNER JOIN ingrediente ON (produto_ingrediente.fk_cod_ingrediente = ingrediente.cod_ingrediente)
                  INNER JOIN tipo_medida ON (ingrediente.fk_cod_tipo_medida = tipo_medida.cod_tipo_medida)
                  ORDER BY produto.nome
```
![Alt text](https://github.com/VitorSSilva21/Trab_BD1_2022/blob/master/images/topicos%209.2%20ao%209.10/9.6/9.6-select2.png)

```
SELECT  produto.nome as nome_produto,
                          preparo.ordem,
                          preparo.descricao_passo as passo
                  FROM produto
                  INNER JOIN preparo ON (produto.cod_produto = preparo.fk_cod_produto)
                  ORDER BY produto.nome,ordem
```
![Alt text](https://github.com/VitorSSilva21/Trab_BD1_2022/blob/master/images/topicos%209.2%20ao%209.10/9.6/9.6-select3.png)

```
SELECT  cliente.nome as nome_cliente,
                          telefone.descricao as telefone,
                          produto.nome as produto,
                          pedido.data_hora_entrega_prevista,
                          pedido.preco_total as valor_total_pedido,
                          tipo_pagamento.descricao as tipo_pagamento
                  FROM pedido
                  INNER JOIN cliente ON (pedido.fk_cod_cliente = cliente.cod_cliente)
                  INNER JOIN telefone ON (cliente.cod_cliente = telefone.fk_cod_cliente)
                  INNER JOIN tipo_pagamento ON (tipo_pagamento.cod_tipo_pagamento = pedido.fk_cod_tipo_pagamento)
                  INNER JOIN pedido_produto ON (pedido.cod_pedido = pedido_produto.fk_cod_pedido)
                  INNER JOIN produto ON (produto.cod_produto = pedido_produto.fk_cod_produto)
                  ORDER BY cliente.nome
```
![Alt text](https://github.com/VitorSSilva21/Trab_BD1_2022/blob/master/images/topicos%209.2%20ao%209.10/9.6/9.6-select4.png)

```
SELECT  cliente.nome as nome_cliente,
                          telefone.descricao as numero_telefone
                  FROM cliente
                  INNER JOIN telefone ON (telefone.fk_cod_cliente = cliente.cod_cliente)
                  ORDER BY cliente.nome
```
![Alt text](https://github.com/VitorSSilva21/Trab_BD1_2022/blob/master/images/topicos%209.2%20ao%209.10/9.6/9.6-select5.png)

```
SELECT  cliente.nome as nome_cliente,
                          pedido.cod_pedido as numero_pedido,
                          produto.nome as nome_produto
                  FROM cliente
                  INNER JOIN pedido ON (pedido.fk_cod_cliente = cliente.cod_cliente)
                  INNER JOIN pedido_produto ON (pedido.cod_pedido = pedido_produto.fk_cod_pedido)
                  INNER JOIN produto ON (produto.cod_produto = pedido_produto.fk_cod_produto)
                  ORDER BY cliente.nome
```
![Alt text](https://github.com/VitorSSilva21/Trab_BD1_2022/blob/master/images/topicos%209.2%20ao%209.10/9.6/9.6-select6.png)

#### 9.7	CONSULTAS COM GROUP BY E FUNÇÕES DE AGRUPAMENTO<br>
[Consultas no COLAB - 9.7](https://colab.research.google.com/drive/1vZfDT5thmpoBE70Mz6RdlyPIipsMfxGV?usp=sharing?raw=true "Title")


```
SELECT 	fk_cod_pedido AS numero_pedido, 
                          SUM(quantidade*preco) AS valor_total_pedido
                  FROM pedido_produto
                  GROUP BY fk_cod_pedido
                  ORDER BY fk_cod_pedido
```
![Alt text](https://github.com/VitorSSilva21/Trab_BD1_2022/blob/master/images/topicos%209.2%20ao%209.10/9.7/9.7-select1.png)

```
SELECT COUNT(cod_cliente) AS quantidade_cliente_no_sistema
                  FROM cliente
```
![Alt text](https://github.com/VitorSSilva21/Trab_BD1_2022/blob/master/images/topicos%209.2%20ao%209.10/9.7/9.7-select2.png)

```
SELECT 	tipo_pagamento.descricao as tipo_pagamento,
                          COUNT(pedido.fk_cod_tipo_pagamento) AS quantidade_utilizada_forma_pagamento
                  FROM pedido
                  INNER JOIN tipo_pagamento ON (tipo_pagamento.cod_tipo_pagamento = pedido.fk_cod_tipo_pagamento)
                  GROUP BY tipo_pagamento.descricao
```
![Alt text](https://github.com/VitorSSilva21/Trab_BD1_2022/blob/master/images/topicos%209.2%20ao%209.10/9.7/9.7-select3.png)

```
SELECT 	produto.nome AS nome_produto,
                          COUNT(produto_ingrediente.fk_cod_ingrediente) AS quantidade_ingredientes_no_produto
                  FROM produto
                  INNER JOIN produto_ingrediente ON (produto.cod_produto = produto_ingrediente.fk_cod_produto)
                  GROUP BY produto.nome
                  ORDER BY produto.nome
```
![Alt text](https://github.com/VitorSSilva21/Trab_BD1_2022/blob/master/images/topicos%209.2%20ao%209.10/9.7/9.7-select4.png)

```
SELECT AVG(preco_total) AS media_preco_pedidos FROM pedido
```
![Alt text](https://github.com/VitorSSilva21/Trab_BD1_2022/blob/master/images/topicos%209.2%20ao%209.10/9.7/9.7-select5.png)

```
SELECT 	pedido.cod_pedido AS numero_pedido,
                      cliente.nome AS nome_cliente,
                      COUNT(pedido_produto.fk_cod_produto) AS quantidade_produto_no_pedido
                  FROM pedido
                  INNER JOIN cliente ON (pedido.fk_cod_cliente = cliente.cod_cliente)
                  INNER JOIN pedido_produto ON (pedido.cod_pedido = pedido_produto.fk_cod_pedido)
                  GROUP BY pedido.cod_pedido, cliente.nome
                  ORDER BY pedido.cod_pedido
```
![Alt text](https://github.com/VitorSSilva21/Trab_BD1_2022/blob/master/images/topicos%209.2%20ao%209.10/9.7/9.7-select6.png)

#### 9.8	CONSULTAS COM LEFT, RIGHT E FULL JOIN <br>
[Consultas no COLAB - 9.8](https://colab.research.google.com/drive/1Hcm0Vt3MAxPxVZBcYJkyvFLpTajzbYgd?usp=sharing?raw=true "Title")

```
select cliente.nome as nome_cliente,pedido.cod_pedido from cliente
                  left join pedido on (cliente.cod_cliente = pedido.fk_cod_cliente)
```
![Alt text](https://github.com/VitorSSilva21/Trab_BD1_2022/blob/master/images/topicos%209.2%20ao%209.10/9.8/9.8-select1.png)

```
select produto.nome as nome_produto, pedido_produto.fk_cod_pedido as pedido from pedido_produto
                  right join produto on (produto.cod_produto = pedido_produto.fk_cod_pedido)
                  order by pedido;
```
![Alt text](https://github.com/VitorSSilva21/Trab_BD1_2022/blob/master/images/topicos%209.2%20ao%209.10/9.8/9.8-select2.png)

```
select cliente.nome, telefone.descricao, pedido.cod_pedido from cliente 
                  full join telefone on (cliente.cod_cliente = telefone.fk_cod_cliente)
                  full join pedido on (cliente.cod_cliente = pedido.fk_cod_cliente)
```
![Alt text](https://github.com/VitorSSilva21/Trab_BD1_2022/blob/master/images/topicos%209.2%20ao%209.10/9.8/9.8-select3.png)

```
select produto.nome, preparo.descricao_passo from produto 
                   left join preparo on (produto.cod_produto = preparo.fk_cod_produto)
```
![Alt text](https://github.com/VitorSSilva21/Trab_BD1_2022/blob/master/images/topicos%209.2%20ao%209.10/9.8/9.8-select4.png)

#### 9.9	CONSULTAS COM SELF JOIN E VIEW <br>
        a) Dentro do escopo do nosso trabalho não existem autorelações ou qualquer tabela que poderia assumir esse papel em uma seleção. Só existe um tipo de usuário do sistema e as tabelas que se relacionam com o produto ou os pedidos não fariam sentido se relacionando com elas mesmas.
[Consultas no COLAB - 9.9](https://colab.research.google.com/drive/1DWi7mOg6zdhu82ZpnroiaZ3hKHA4DUrf?usp=sharing?raw=true "Title")

```
CREATE VIEW cliente_pedido AS
                  SELECT pedido.cod_pedido AS numero_pedido,
                          cliente.nome AS nome_cliente
                  FROM pedido
                  INNER JOIN cliente ON (pedido.fk_cod_cliente = cliente.cod_cliente)
```
```
SELECT * FROM cliente_pedido
```
![Alt text](https://github.com/VitorSSilva21/Trab_BD1_2022/blob/master/images/topicos%209.2%20ao%209.10/9.9/9.9-select1.png)

```
CREATE VIEW produto_em_pedido AS
                  SELECT pedido.cod_pedido as numero_pedido,
                        produto.nome as nome_produto
                  FROM pedido
                  INNER JOIN pedido_produto ON (pedido.cod_pedido = pedido_produto.fk_cod_pedido)
                  INNER JOIN produto ON (produto.cod_produto = pedido_produto.fk_cod_produto)
                  ORDER BY pedido.cod_pedido
```
```
SELECT * FROM produto_em_pedido
```
![Alt text](https://github.com/VitorSSilva21/Trab_BD1_2022/blob/master/images/topicos%209.2%20ao%209.10/9.9/9.9-select2.png)

```
CREATE VIEW ingrediente_em_produto AS
                  SELECT 	produto.nome AS nome_produto, 
                      ingrediente.nome AS nome_ingrediente, 
                      tipo_medida.descricao AS tipo_medida
                  FROM produto
                  INNER JOIN produto_ingrediente ON (produto.cod_produto = produto_ingrediente.fk_cod_produto)
                  INNER JOIN ingrediente ON (produto_ingrediente.fk_cod_ingrediente = ingrediente.cod_ingrediente)
                  INNER JOIN tipo_medida ON (ingrediente.fk_cod_tipo_medida = tipo_medida.cod_tipo_medida)
```
```
SELECT * FROM ingrediente_em_produto
```
![Alt text](https://github.com/VitorSSilva21/Trab_BD1_2022/blob/master/images/topicos%209.2%20ao%209.10/9.9/9.9-select3.png)

```
CREATE VIEW preparo_em_produto AS
                  SELECT 	produto.nome, 
                      preparo.ordem,
                      preparo.descricao_passo
                  FROM produto
                  INNER JOIN preparo ON (produto.cod_produto = preparo.fk_cod_produto) 
```
```
SELECT * FROM preparo_em_produto
```
![Alt text](https://github.com/VitorSSilva21/Trab_BD1_2022/blob/master/images/topicos%209.2%20ao%209.10/9.9/9.9-select4.png)

```
CREATE VIEW telefone_em_cliente AS
                  SELECT 	cliente.nome AS nome_cliente,
                      telefone.descricao AS numero_telefone
                  FROM cliente
                  INNER JOIN telefone ON (cliente.cod_cliente = telefone.fk_cod_cliente)
                  ORDER BY cliente.nome
```
```
SELECT * FROM telefone_em_cliente
```
![Alt text](https://github.com/VitorSSilva21/Trab_BD1_2022/blob/master/images/topicos%209.2%20ao%209.10/9.9/9.9-select5.png)

```
CREATE VIEW pedido_pagamento AS
                  SELECT 	pedido.cod_pedido AS numero_pedido,
                      pedido.data_hora_entrega_prevista,
                      pedido.preco_total AS valor_total_pedido,
                      tipo_pagamento.descricao AS tipo_pagamento
                  FROM pedido
                  INNER JOIN tipo_pagamento ON (tipo_pagamento.cod_tipo_pagamento = pedido.fk_cod_tipo_pagamento)
                  ORDER BY pedido.cod_pedido
```
```
SELECT * FROM pedido_pagamento
```
![Alt text](https://github.com/VitorSSilva21/Trab_BD1_2022/blob/master/images/topicos%209.2%20ao%209.10/9.9/9.9-select6.png)

#### 9.10	SUBCONSULTAS <br>
[Consultas no COLAB - 9.10](https://colab.research.google.com/drive/1kLvbrXyN2v_YGV2uhMFI3nMFIOb0B24R?usp=sharing?raw=true "Title")

```
select cod_ped_prod, preco from pedido_produto 
where preco < (select avg(pedido_produto.preco) from pedido_produto);
```
![Alt text](https://github.com/VitorSSilva21/Trab_BD1_2022/blob/master/images/topicos%209.2%20ao%209.10/9.10/9.10-select1.png)

```
SELECT 	ingrediente.nome AS nome_ingrediente, 
                          tipo_medida.descricao AS tipo_medida
                  FROM ingrediente
                  INNER JOIN tipo_medida ON (ingrediente.fk_cod_tipo_medida = tipo_medida.cod_tipo_medida) 
                  WHERE tipo_medida.descricao NOT IN (SELECT tipo_medida.descricao FROM tipo_medida WHERE tipo_medida.descricao = 'Unidade' OR tipo_medida.descricao = 'Colher de sopa');
```
![Alt text](https://github.com/VitorSSilva21/Trab_BD1_2022/blob/master/images/topicos%209.2%20ao%209.10/9.10/9.10-select2.png)

```
SELECT 	produto.cod_produto,
                      sum(pedido.preco_total) AS preco_total_lucrado
                  FROM pedido 
                  INNER JOIN pedido_produto ON (pedido.cod_pedido = pedido_produto.fk_cod_pedido)
                  INNER JOIN produto ON (pedido_produto.fk_cod_produto = produto.cod_produto)
                  WHERE pedido.preco_total IN (SELECT pedido.preco_total FROM pedido WHERE pedido.preco_total > 50) 
                  GROUP BY produto.cod_produto
                  ORDER BY produto.cod_produto
```
![Alt text](https://github.com/VitorSSilva21/Trab_BD1_2022/blob/master/images/topicos%209.2%20ao%209.10/9.10/9.10-select3.png)

```
select pedido.cod_pedido, pedido.preco_total, produto.preco 
                  from pedido 
                  inner join (select distinct produto.preco from pedido_produto
                              inner join produto on (pedido_produto.fk_cod_produto = produto.cod_produto)) as produto
                  on (pedido.preco_total = produto.preco);
```
![Alt text](https://github.com/VitorSSilva21/Trab_BD1_2022/blob/master/images/topicos%209.2%20ao%209.10/9.10/9.10-select4.png)

```
select (count(fk_cod_ingrediente)) as ing_por_produto
                  from produto_ingrediente 
                  group by fk_cod_produto
                  having count(fk_cod_ingrediente) < (
                    select (count(fk_cod_ingrediente))
                    from produto_ingrediente 
                    group by fk_cod_produto
                    limit(1))
```
![Alt text](https://github.com/VitorSSilva21/Trab_BD1_2022/blob/master/images/topicos%209.2%20ao%209.10/9.10/9.10-select5.png)


># Marco de Entrega 02: Do item 9.2 até o ítem 9.10<br>

### 10 RELATÓRIOS E GRÁFICOS

#### a) análises e resultados provenientes do banco de dados desenvolvido (usar modelo disponível)
#### b) link com exemplo de relatórios será disponiblizado pelo professor no AVA
#### OBS: Esta é uma atividade de grande relevância no contexto do trabalho. Mantenha o foco nos 5 principais relatórios/resultados visando obter o melhor resultado possível.

    

### 11	AJUSTES DA DOCUMENTAÇÃO, CRIAÇÃO DOS SLIDES E VÍDEO PARA APRESENTAÇAO FINAL <br>

#### a) Modelo (pecha kucha)<br>
#### b) Tempo de apresentação 6:40 

># Marco de Entrega 03: Itens 10 e 11<br>
<br>
<br>
<br> 



### 12 FORMATACAO NO GIT:<br> 
https://help.github.com/articles/basic-writing-and-formatting-syntax/
<comentario no git>
    
##### About Formatting
    https://help.github.com/articles/about-writing-and-formatting-on-github/
    
##### Basic Formatting in Git
    
    https://help.github.com/articles/basic-writing-and-formatting-syntax/#referencing-issues-and-pull-requests
    
    
##### Working with advanced formatting
    https://help.github.com/articles/working-with-advanced-formatting/
#### Mastering Markdown
    https://guides.github.com/features/mastering-markdown/

    
### OBSERVAÇÕES IMPORTANTES

#### Todos os arquivos que fazem parte do projeto (Imagens, pdfs, arquivos fonte, etc..), devem estar presentes no GIT. Os arquivos do projeto vigente não devem ser armazenados em quaisquer outras plataformas.
1. <strong>Caso existam arquivos com conteúdos sigilosos<strong>, comunicar o professor que definirá em conjunto com o grupo a melhor forma de armazenamento do arquivo.

#### Todos os grupos deverão fazer Fork deste repositório e dar permissões administrativas ao usuário do git "profmoisesomena", para acompanhamento do trabalho.

#### Os usuários criados no GIT devem possuir o nome de identificação do aluno (não serão aceitos nomes como Eu123, meuprojeto, pro456, etc). Em caso de dúvida comunicar o professor.


Link para BrModelo:<br>
http://www.sis4.com/brModelo/download.html
<br>


Link para curso de GIT<br>
![https://www.youtube.com/curso_git](https://www.youtube.com/playlist?list=PLo7sFyCeiGUdIyEmHdfbuD2eR4XPDqnN2?raw=true "Title")


