# TRABALHO 01:  Título do Trabalho
Trabalho desenvolvido durante a disciplina de BD1

# Sumário

### 1. COMPONENTES<br>
Vitor Siqueira da Silva: vitor.silva.ifes@gmail.com<br>
Camila Fornaciari Volponi: camilavolponi19@gmail.com<br>

### 2. INTRODUÇÃO E MOTIVAÇÃO<br>
Este documento contém a especificação do projeto do banco de dados CandySystem
<br><br>
A criação do sistema CandySystem visa gerar uma melhoria na qualidade do trabalho de pequenos e médios confeiteiros ou confeitarias. Isso será feito provendo um sistema flexível capaz de auxiliar no gerenciamento de pedidos, clientes, funcionários e receitas, capaz de ser usado por qualquer organização de pequeno e médio porte.
 

### 3. MINI-MUNDO<br>
Uma pessoa deseja possuir um sistema para gerenciar sua empresa de confeitaria, registrando pedidos, produtos e funcionários. Para cadastrar sua empresa ele precisa de CNPJ e nome, e informar seu CPF, nome, telefone, e-mail e senha, e ficará automaticamente com o cargo de proprietário. Ele como cargo proprietário, poderá cadastrar outros funcionários com os mesmos atributos que ele, que podem possuir mais de um cargo. <br>
 
Do produto ele precisa saber o nome, preço e quantidade, onde terá acesso aos ingredientes e aos modos de preparo. Dos ingredientes precisa-se de nome, quantidade e unidade de medida e do modo de preparo precisa-se de cada passo para o preparo do produto e a ordem que será na receita. Além disso, do pedido ele precisa ter a data de entrega e horário previstos, forma de pagamento e ter os dados do cliente registrado, como nome, telefone e endereço.


### 4. PROTOTIPAÇÃO, PERGUNTAS A SEREM RESPONDIDAS E TABELA DE DADOS<br>
#### 4.1 RASCUNHOS BÁSICOS DA INTERFACE (MOCKUPS)<br>

![Primeira página do protótipo](https://github.com/V1t0rSS/Trab_BD1_2022/blob/master/images/prot%C3%B3tipo.png?raw=true "Title")
![Arquivo PDF do Protótipo Balsamiq](https://github.com/V1t0rSS/Trab_BD1_2022/blob/master/arquivos/Prototipo.pdf)
#### 4.2 QUAIS PERGUNTAS PODEM SER RESPONDIDAS COM O SISTEMA PROPOSTO?
    a) O sistema proposto poderá fornecer quais tipos de relatórios e informaçes? 
    b) Crie uma lista com os 5 principais relatórios que poderão ser obtidos por meio do sistema proposto!
    
> A Empresa DevCom precisa inicialmente dos seguintes relatórios:
* Relatório que mostre o nome de cada supervisor(a) e a quantidade de empregados supervisionados.
* Relatório relativo aos os supervisores e supervisionados. O resultado deve conter o nome do supervisor e nome do supervisionado além da quantidade total de horas que cada supervisionado tem alocada aos projetos existentes na empresa.
* Relatorio que mostre para cada linha obtida o nome do departamento, o valor individual de cada salario existente no  departamento e a média geral de salarios dentre todos os empregados. Os resultados devem ser apresentados ordenados por departamento.
* Relatório que mostre as informações relacionadas a todos empregados de empresa (sem excluir ninguém). As linhas resultantes devem conter informações sobre: rg, nome, salario do empregado, data de início do salario atual, nomes dos projetos que participa, quantidade de horas e localização nos referidos projetos, numero e nome dos departamentos aos quais está alocado, informações do historico de salário como inicio, fim, e valores de salarios antigos que foram inclusos na referida tabela (caso possuam informações na mesma), além de todas informações relativas aos dependentes. 
>> ##### Observações: <br> a) perceba que este relatório pode conter linhas com alguns dados repetidos (mas não todos). <br>  b) para os empregados que não possuirem alguma destas informações o valor no registro deve aparecer sem informação/nulo. 
* Relatório que obtenha a frequencia absoluta e frequencia relativa da quantidade de cpfs únicos no relatório anterior. Apresente os resultados ordenados de forma decrescente pela frequencia relativa.

 
 
#### 4.3 TABELA DE DADOS DO SISTEMA:
    a) Esta tabela deve conter todos os atributos do sistema e um mínimo de 10 linhas/registros de dados.
    b) Esta tabela tem a intenção de simular um relatório com todos os dados que serão armazenados 
    
![Exemplo de Tabela de dados da Empresa Devcom](https://github.com/discipbd1/trab01/blob/master/arquivos/TabelaEmpresaDevCom_sample.xlsx?raw=true "Tabela - Empresa Devcom")
    
    
### 5. MODELO CONCEITUAL<br>
    A) Utilizar a Notação adequada (Preferencialmente utilizar o BR Modelo 3)
    B) O mínimo de entidades do modelo conceitual pare este trabalho será igual a 3 e o Máximo 5.
        * informe quais são as 3 principais entidades do sistema em densenvolvimento<br>(se houverem mais de 3 entidades, pense na importância da entidade para o sistema)       
    C) Principais fluxos de informação/entidades do sistema (mínimo 3). <br>Dica: normalmente estes fluxos estão associados as tabelas que conterão maior quantidade de dados 
    D) Qualidade e Clareza
        Garantir que a semântica dos atributos seja clara no esquema (nomes coerentes com os dados).
        Criar o esquema de forma a garantir a redução de informação redundante, possibilidade de valores null, 
        e tuplas falsas (Aplicar os conceitos de normalização abordados).   
        
![Alt text](https://github.com/V1t0rSS/Trab_BD1_2022/blob/master/images/modeloConceitual.png)
    

#### 5.1 Validação do Modelo Conceitual
    [Grupo01]: [Nomes dos que participaram na avaliação]
    [Grupo02]: [Nomes dos que participaram na avaliação]

#### 5.2 Descrição dos dados 
    [objeto]: [descrição do objeto]
    
    EXEMPLO:
    CLIENTE: Tabela que armazena as informações relativas ao cliente<br>
    CPF: campo que armazena o número de Cadastro de Pessoa Física para cada cliente da empresa.<br>


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
        a) inclusão das instruções de inserção dos dados nas tabelas criadas pelo script de modelo físico
        (Drop para exclusão de tabelas + create definição de para tabelas e estruturas de dados + insert para dados a serem inseridos)
        b) Criar um novo banco de dados para testar a restauracao 
        (em caso de falha na restauração o grupo não pontuará neste quesito)
        c) formato .SQL

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


