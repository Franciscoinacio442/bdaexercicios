SELECT * FROM sys.databases;
SELECT * FROM sys.schemas
WHERE name NOT LIKE 'db%';
SELECT * FROM Treinos
CREATE DATABASE Datawarehouse
GO
USE Datawarehouse
GO
SELECT * 
FROM INFORMATION_SCHEMA.TABLES
SELECT * FROM Clientes
SELECT * FROM Pedidos

CREATE TABLE Clientes (
    ClienteID INT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL
)

CREATE TABLE Pedidos (
    PedidoID INT PRIMARY KEY,
    ClienteID INT,
    DataPedido DATE,
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
)
INSERT INTO Clientes (ClienteID, Nome)
VALUES 
    (1, 'Francisco'),
    (2, 'Ana'),
    (3, 'João');
    
    INSERT INTO Pedidos (PedidoID, ClienteID, DataPedido)
VALUES 
    (101, 1, '2026-10-28'),
    (102, 2, '2026-10-28');

    ALTER TABLE Pedidos
    ADD PedidoNome VARCHAR(100)

SELECT 
    c.ClienteID, 
    c.Nome AS NomeCliente, 
    p.PedidoID, 
    p.PedidoNome
    FROM Clientes c
RIGHT JOIN Pedidos p ON c.ClienteID = p.ClienteID
---------------------------------------
IF OBJECT_ID('dbo.Pedidos', 'U') IS NOT NULL DROP TABLE dbo.Pedidos;
IF OBJECT_ID('dbo.Clientes', 'U') IS NOT NULL DROP TABLE dbo.Clientes;
IF OBJECT_ID('dbo.Fornecedores', 'U') IS NOT NULL DROP TABLE dbo.Fornecedores;
GO
CREATE TABLE Clientes (
    ClienteID INT PRIMARY KEY,
    Nome VARCHAR(100),
    Cidade VARCHAR(50),
    Pais VARCHAR(50)
)
CREATE TABLE Pedidos (
    PedidoID INT PRIMARY KEY,
    ClienteID INT,
    DataPedido DATE
)
CREATE TABLE Fornecedores (
    FornecedorID INT PRIMARY KEY,
    Nome VARCHAR(100),
    Cidade VARCHAR(50),
    Pais VARCHAR(50)
);

-- Inserção de dados para testar todos os cenários
INSERT INTO Clientes VALUES 
    (1, 'Francisco', 'Lisboa', 'Portugal'),
    (2, 'Ana', 'Porto', 'Portugal'),
    (3, 'João', 'Lisboa', 'Portugal'),        -- Vive na mesma cidade do Francisco
    (4, 'Maria', 'Madrid', 'Espanha');          -- Cliente sem pedidos

INSERT INTO Pedidos VALUES 
    (101, 1, '2026-10-28'),
    (102, 2, '2026-10-28'),
    (103, NULL, '2026-10-29');                  -- Pedido sem cliente associado

INSERT INTO Fornecedores VALUES 
    (501, 'TechSupplier', 'Lisboa', 'Portugal'),-- Cidade coincidente com Clientes
    (502, 'PecasAuto', 'Porto', 'Portugal'),
    (503, 'IberiaGoods', 'Sevilha', 'Espanha');
GO
SELECT 
    c.ClienteID,
    c.Nome ,
    p.PedidoID,
    p.DataPedido
FROM Clientes c
FULL OUTER JOIN Pedidos p ON c.ClienteID = p.ClienteID

-- Exemplo A: Cidades únicas (UNION)
SELECT Cidade FROM Clientes
UNION
SELECT Cidade FROM Fornecedores
ORDER BY Cidade;

-- Exemplo B: Cidades com repetições (UNION ALL)
SELECT Cidade FROM Clientes
UNION ALL
SELECT Cidade FROM Fornecedores
ORDER BY Cidade;

-- Selecionar apenas cidades de Portugal (sem duplicados)
SELECT Cidade FROM Clientes
WHERE Pais = 'Portugal'
UNION
SELECT Cidade COUNT(*) FROM Fornecedores
WHERE Pais = 'Portugal'
ORDER BY Cidade;