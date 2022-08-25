/*ATIVIDADE DE FIXAÇÃO*/

/*1) CRIE UM BANCO DE DADOS CHAMADO PROJETO E CONECTE-SE AO BANCO*/
/*2) FAÇA A SEGUINTE MODELAGEM

SR. JOSÉ QUER MODERNIZAR A SUA OFICINA, E POR ENQUANTO, CADASTRAR OS CARROS QUE ENTRAM
PARA REALIZAR OS SERVIÇOS E OS SEUS RESPECTIVOS DONOS. SR. JOSE MENCIONOU QUE CADA CLIENTE
POSSUI APENAS UM CARRO. UM CARRO POSSUI UMA MARCA SR.JOSE TAMBÉM QUER SABER AS 
CORES DOS CARROS PARA TER IDEIA DE QUAL TINTA COMPRAR, E INFORMAR QUE UM CARRO PODE TER
MAIS DE UMA COR. SR. JOSÉ NECESSITA ARMAZERNAR OS TELEFONES DOS CLIENTES, MAS NÃO QUER 
ELES SEJAM OBRIGATÓRIOS*/

/*CRIANDO O BANDO DE DADOS*/
CREATE DATABASE PROJETO;

/*CONECTANDO NO BANCO DE DADOS*/
USE PROJETO;

/*CRIANDO AS TABELAS*/
CREATE TABLE CARRO(
    ID_CARRO INT NOT NULL,
    PLACA VARCHAR(8) UNIQUE,
    MODELO VARCHAR(20),
    CLIENTE_ID INT
);

CREATE TABLE CLIENTE(
    ID_CLIENTE INT NOT NULL,
    NOME_CLIENTE VARCHAR(50),
    CPF VARCHAR(14) UNIQUE,
    DATA_NASCIMENTO DATE
);

CREATE TABLE TELEFONE(
    ID_TELEFONE INT NOT NULL,
    TIPO VARCHAR(10),
    NUMERO VARCHAR(20),
    CLIENTE_ID INT
);

CREATE TABLE ENDERECO(
    ID_ENDERECO INT NOT NULL,
    ESTADO VARCHAR(50),
    CIDADE VARCHAR(50),
    BAIRRO VARCHAR(50),
    RUA VARCHAR(50),
    NUMERO VARCHAR(5),
    COMPLEMENTO VARCHAR(50),
    PONTO_REFERENCIA VARCHAR(50),
    CLIENTE_ID INT
    
);

CREATE TABLE MARCA(
    ID_MARCA INT NOT NULL,
    NOME_MARCA VARCHAR(30),
    CARRO_ID INT
);

CREATE TABLE COR(
    ID_COR INT NOT NULL,
    NOME_COR VARCHAR(20) UNIQUE
);

CREATE TABLE COR_CARRO(
    ID_COR_CARRO INT NOT NULL,
    COR_ID INT,
    CARRO_ID INT
);

/*ADICIONANDO AS CHAVES PRIMARIAS COM AS CONSTRAINTS*/
/*E ADICINANDO A AUTO INCREMENTAÇÃO*/

ALTER TABLE CARRO ADD CONSTRAINT PK_CARRO PRIMARY KEY(ID_CARRO);
ALTER TABLE CARRO MODIFY ID_CARRO INT AUTO_INCREMENT;

ALTER TABLE CLIENTE ADD CONSTRAINT PK_CLIENTE PRIMARY KEY(ID_CLIENTE);
ALTER TABLE CLIENTE MODIFY ID_CLIENTE INT AUTO_INCREMENT;

ALTER TABLE TELEFONE ADD CONSTRAINT PK_TELEFONE PRIMARY KEY(ID_TELEFONE);
ALTER TABLE TELEFONE MODIFY ID_TELEFONE INT AUTO_INCREMENT;

ALTER TABLE ENDERECO ADD CONSTRAINT PK_ENDERECO PRIMARY KEY(ID_ENDERECO);
ALTER TABLE ENDERECO MODIFY ID_ENDERECO INT AUTO_INCREMENT; 

ALTER TABLE MARCA ADD CONSTRAINT PK_MARCA PRIMARY KEY(ID_MARCA);
ALTER TABLE MARCA MODIFY ID_MARCA INT AUTO_INCREMENT;

ALTER TABLE COR ADD CONSTRAINT PK_COR PRIMARY KEY(ID_COR);
ALTER TABLE COR MODIFY ID_COR INT AUTO_INCREMENT;

ALTER TABLE COR_CARRO ADD CONSTRAINT PK_COR_CARRO PRIMARY KEY(ID_COR_CARRO);
ALTER TABLE COR_CARRO MODIFY ID_COR_CARRO INT AUTO_INCREMENT;

/*CRIANDO AS CHAVES ESTRANGEIRAS PARA FAZER OS RELACIONAMENTOS DAS TABELAS*/

ALTER TABLE CARRO ADD CONSTRAINT FK_CARRO_CLIENTE FOREIGN KEY(CLIENTE_ID)
REFERENCES CLIENTE(ID_CLIENTE);

ALTER TABLE TELEFONE ADD CONSTRAINT FK_TELEFONE_CLIENTE FOREIGN KEY(CLIENTE_ID)
REFERENCES CLIENTE(ID_CLIENTE);

ALTER TABLE MARCA ADD CONSTRAINT FK_MARCA_CARRO FOREIGN KEY(CARRO_ID)
REFERENCES CARRO(ID_CARRO);

ALTER TABLE ENDERECO ADD CONSTRAINT FK_ENDERECO_CLIENTE FOREIGN KEY(CLIENTE_ID)
REFERENCES CLIENTE(ID_CLIENTE);

ALTER TABLE COR_CARRO ADD FOREIGN KEY(COR_ID)
REFERENCES COR(ID_COR);

ALTER TABLE COR_CARRO ADD CONSTRAINT FK_COR_CARRO_CARRO FOREIGN KEY(CARRO_ID)
REFERENCES CARRO(ID_CARRO);


