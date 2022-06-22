# TRABALHO 01:  Título do Trabalho
Trabalho desenvolvido durante a disciplina de BD1

# Sumário

### 1. COMPONENTES<br>
Vitor Siqueira da Silva: vitor.silva.ifes@gmail.com<br>
Camila Fornaciari Volponi: camilavolponi19@gmail.com<br>

### 2. INTRODUÇÃO E MOTIVAÇÃO<br>
Este documento contém a especificação do projeto do banco de dados CandySystem e motivação da escolha realizada.
<br><br>
A criação do sistema CandySystem visa gerar uma melhoria na qualidade do trabalho de pequenos e médios confeiteiros ou confeitarias. Isso será feito provendo um sistema flexível capaz de auxiliar no gerenciamento de pedidos, clientes, funcionários e receitas, capaz de ser usado por qualquer organização de pequeno e médio porte.
 

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
CREATE TABLE pedido (
 cod_pedido INTEGER PRIMARY KEY,
 data_hora_criacao TIMESTAMP,
 data_hora_entrega_prevista TIMESTAMP,
 preco FLOAT(4),
 fk_cod_tipo_pagamento INTEGER,
 fk_CLIENTE_cod_pessoa INTEGER 
);

ALTER TABLE pedido		 
ADD CONSTRAINT fk_tipo_pagamento FOREIGN KEY (fk_cod_tipo_pagamento) REFERENCES tipo_pagamento(cod_tipo_pagamento),
ADD CONSTRAINT fk_cliente FOREIGN KEY (fk_CLIENTE_cod_pessoa) REFERENCES cliente(fk_cod_pessoa);
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
CREATE TABLE pedido_produto (
 cod_ped_prod INTEGER PRIMARY KEY,
 quantidade INTEGER,
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
 fk_cod_pessoa INTEGER PRIMARY KEY,
 fk_cod_endereco INTEGER 
);

ALTER TABLE cliente		 
ADD CONSTRAINT fk_pessoa_cliente FOREIGN KEY(fk_cod_pessoa) REFERENCES pessoa(cod_pessoa);
```

* Criação tabela pessoa
```
CREATE TABLE pessoa (
 cod_pessoa INTEGER PRIMARY KEY,
 nome VARCHAR(50) 
);
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
 (1, 1, 2, 1),
 (2, 2, 3, 3),
 (3, 1, 3, 1),
 (4, 1, 5, 4),
 (5, 1, 5, 5),
 (6, 1, 1, 1),
 (7, 1, 1, 3),
 (8, 5, 4, 5);
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
 (1, null),
 (2, null),
 (3, null),
 (4, null),
 (5, null);
```

* Inserir dados na tabela pessoa
```
INSERT INTO pessoa VALUES
 (1, 'Moises da Silva'),
 (2, 'Camila Volponi'),
 (3, 'Mariazinha Feirreira'),
 (4, 'Vitor da Silva'),
 (5, 'Marcelo da Vitória');
```

### 9	TABELAS E PRINCIPAIS CONSULTAS<br>
    OBS: Incluir para cada tópico as instruções SQL + imagens (print da tela) mostrando os resultados.<br>
#### 9.1	CONSULTAS DAS TABELAS COM TODOS OS DADOS INSERIDOS (Todas) <br>
[Consultas no COLAB](https://colab.research.google.com/drive/1OJhC1kUK6bbt_VKg-hz9nJS60OJidT7u?usp=sharing?raw=true "Title")


># Marco de Entrega 01: Do item 1 até o item 9.1<br>

#### 9.2	CONSULTAS DAS TABELAS COM FILTROS WHERE (Mínimo 4)<br>
#### 9.3	CONSULTAS QUE USAM OPERADORES LÓGICOS, ARITMÉTICOS E TABELAS OU CAMPOS RENOMEADOS (Mínimo 11)
    a) Criar 5 consultas que envolvam os operadores lógicos AND, OR e Not
    b) Criar no mínimo 3 consultas com operadores aritméticos 
    c) Criar no mínimo 3 consultas com operação de renomear nomes de campos ou tabelas

#### 9.4	CONSULTAS QUE USAM OPERADORES LIKE E DATAS (Mínimo 12) <br>
    a) Criar outras 5 consultas que envolvam like ou ilike
    b) Criar uma consulta para cada tipo de função data apresentada.

#### 9.5	INSTRUÇÕES APLICANDO ATUALIZAÇÃO E EXCLUSÃO DE DADOS (Mínimo 6)<br>
    a) Criar minimo 3 de exclusão
    b) Criar minimo 3 de atualização

#### 9.6	CONSULTAS COM INNER JOIN E ORDER BY (Mínimo 6)<br>
    a) Uma junção que envolva todas as tabelas possuindo no mínimo 2 registros no resultado
    b) Outras junções que o grupo considere como sendo as de principal importância para o trabalho

#### 9.7	CONSULTAS COM GROUP BY E FUNÇÕES DE AGRUPAMENTO (Mínimo 6)<br>
    a) Criar minimo 2 envolvendo algum tipo de junção

#### 9.8	CONSULTAS COM LEFT, RIGHT E FULL JOIN (Mínimo 4)<br>
    a) Criar minimo 1 de cada tipo

#### 9.9	CONSULTAS COM SELF JOIN E VIEW (Mínimo 6)<br>
        a) Uma junção que envolva Self Join (caso não ocorra na base justificar e substituir por uma view)
        b) Outras junções com views que o grupo considere como sendo de relevante importância para o trabalho

#### 9.10	SUBCONSULTAS (Mínimo 4)<br>
     a) Criar minimo 1 envolvendo GROUP BY
     b) Criar minimo 1 envolvendo algum tipo de junção

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


