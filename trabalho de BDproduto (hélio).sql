/* Tabela de produtos que armazena informações sobre os itens disponíveis no estoque */
CREATE TABLE produto (
    ferramentas VARCHAR(30),
    categoria VARCHAR(25),
    ano_de_fabricacao YEAR,
    quantidade_em_estoque NUMERIC,
    fornecedor VARCHAR (30),
    marca VARCHAR(10),
    ID_produto VARCHAR (30) PRIMARY KEY
);
/* Tabela de categorias que descreve as diferentes categorias de produtos */
CREATE TABLE categoria (
    nome VARCHAR(30),
    descricao VARCHAR(30),
    ID_categoria VARCHAR (30) PRIMARY KEY
);
/* Tabela de fornecedores que armazena informações sobre os fornecedores dos produtos */
CREATE TABLE fornecedor (
    endereco VARCHAR(30),
    contato VARCHAR (20),
    email VARCHAR (50),
    nome VARCHAR(30),
    telefone VARCHAR(20),
    ID_fornecedor VARCHAR (30) PRIMARY KEY
);
/* Tabela que registra as entradas de produtos no estoque */
CREATE TABLE entrada_de_estoque (
    ID_entrada VARCHAR (30),
    data_de_entrada DATE,
    quantidade NUMERIC,
    ID_produto VARCHAR (30),
    ID_fornecedor VARCHAR (30) PRIMARY KEY
);
/* Tabela que registra as transferências de produtos */
CREATE TABLE transferencia (
    data_de_saida DATE,
    quantidade NUMERIC,
    ID_saida VARCHAR (30) PRIMARY KEY
);
/* Tabela que registra as vendas de produtos */
CREATE TABLE vendas (
    valor_total NUMERIC,
    quantidade NUMERIC,
    data_da_venda DATE,
    ID_produto VARCHAR (30),
    ID_venda VARCHAR (30) PRIMARY KEY
);
/* Tabela que relaciona produtos a categorias */
CREATE TABLE pertence (
    fk_produto_ID_produto VARCHAR (30),
    fk_categoria_ID_categoria VARCHAR (30)
);
/* Tabela que relaciona produtos a fornecedores */
CREATE TABLE tem (
    fk_produto_ID_produto VARCHAR (30),
    fk_fornecedor_ID_fornecedor VARCHAR (30)
);
/* Tabela que relaciona produtos a entradas de estoque e fornecedores */
CREATE TABLE entrada_produto_entrada_de_estoque_fornecedor (
    fk_produto_ID_produto VARCHAR (30),
    fk_entrada_de_estoque_ID_fornecedor VARCHAR (30),
    fk_fornecedor_ID_fornecedor VARCHAR(30)
);
/* Tabela que relaciona produtos a vendas e transferências */
CREATE TABLE relacionado_produto_vendas_transferencia (
    fk_produto_ID_produto VARCHAR (30),
    fk_vendas_ID_venda VARCHAR (30),
    fk_transferencia_ID_saida VARCHAR (30)
);
 /* Definindo as chaves estrangeiras para manter a integridade referencial */
ALTER TABLE pertence ADD CONSTRAINT FK_pertence_1
    FOREIGN KEY (fk_produto_ID_produto)
    REFERENCES produto (ID_produto)
    ON DELETE RESTRICT;
 
ALTER TABLE pertence ADD CONSTRAINT FK_pertence_2
    FOREIGN KEY (fk_categoria_ID_categoria)
    REFERENCES categoria (ID_categoria)
    ON DELETE RESTRICT;
 
ALTER TABLE tem ADD CONSTRAINT FK_tem_1
    FOREIGN KEY (fk_produto_ID_produto)
    REFERENCES produto (ID_produto)
    ON DELETE RESTRICT;
 
ALTER TABLE tem ADD CONSTRAINT FK_tem_2
    FOREIGN KEY (fk_fornecedor_ID_fornecedor)
    REFERENCES fornecedor (ID_fornecedor)
    ON DELETE RESTRICT;
 
ALTER TABLE entrada_produto_entrada_de_estoque_fornecedor ADD CONSTRAINT FK_entrada_produto_entrada_de_estoque_fornecedor_1
    FOREIGN KEY (fk_produto_ID_produto)
    REFERENCES produto (ID_produto)
    ON DELETE NO ACTION;
 
ALTER TABLE entrada_produto_entrada_de_estoque_fornecedor ADD CONSTRAINT FK_entrada_produto_entrada_de_estoque_fornecedor_2
    FOREIGN KEY (fk_entrada_de_estoque_ID_fornecedor)
    REFERENCES entrada_de_estoque (ID_fornecedor)
    ON DELETE NO ACTION;
 
ALTER TABLE entrada_produto_entrada_de_estoque_fornecedor ADD CONSTRAINT FK_entrada_produto_entrada_de_estoque_fornecedor_3
    FOREIGN KEY (fk_fornecedor_ID_fornecedor)
    REFERENCES fornecedor (ID_fornecedor)
    ON DELETE NO ACTION;
 
ALTER TABLE relacionado_produto_vendas_transferencia ADD CONSTRAINT FK_relacionado_produto_vendas_transferencia_1
    FOREIGN KEY (fk_produto_ID_produto)
    REFERENCES produto (ID_produto)
    ON DELETE NO ACTION;
 
ALTER TABLE relacionado_produto_vendas_transferencia ADD CONSTRAINT FK_relacionado_produto_vendas_transferencia_2
    FOREIGN KEY (fk_vendas_ID_venda)
    REFERENCES vendas (ID_venda)
    ON DELETE NO ACTION;
 
ALTER TABLE relacionado_produto_vendas_transferencia ADD CONSTRAINT FK_relacionado_produto_vendas_transferencia_3
    FOREIGN KEY (fk_transferencia_ID_saida)
    REFERENCES transferencia (ID_saida)
    ON DELETE NO ACTION;
/*Inserindo dados dentro das classes*/
INSERT INTO produto (ferramentas, categoria, ano_de_fabricacao, quantidade_em_estoque, fornecedor, marca, ID_produto)
VALUES ('Martelo', 'F.M', 2022, 50, 'Irmões', 'Martelix', 'P555');

/*Selecionar dados da classse*/
SELECT * FROM produto;
/*Atualizar dados de uma classe*/
UPDATE produto SET quantidade_em_estoque = 15 WHERE ID_produto = 'P555';
/*Deletar atributo de uma classe*/
DELETE FROM produto WHERE ID_produto = 'P555';