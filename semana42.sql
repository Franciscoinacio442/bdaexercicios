CREATE DATABASE Datawarehouse;
GO

USE Datawarehouse;
GO
CREATE TABLE Clientes (
    ClienteID INT NOT NULL,
    Nome NVARCHAR(100) NOT NULL,
    Email NVARCHAR(150) NOT NULL,

    CONSTRAINT PK_Clientes
        PRIMARY KEY (ClienteID)
);
GO

CREATE TABLE Pedidos (
    PedidoID INT NOT NULL,
    ClienteID INT NOT NULL,
    DataPedido DATE NOT NULL,

    CONSTRAINT PK_Pedidos
        PRIMARY KEY (PedidoID),

    CONSTRAINT FK_Pedidos_Clientes
        FOREIGN KEY (ClienteID)
        REFERENCES Clientes (ClienteID)
);
GO

INSERT INTO Clientes (ClienteID, Nome, Email)
VALUES
    (1, 'Ana Silva', 'ana@email.com'),
    (2, 'Bruno Costa', 'bruno@email.com');

INSERT INTO Pedidos (PedidoID, ClienteID, DataPedido)
VALUES
    (101, 1, '2026-10-20'),
    (102, 2, '2026-10-21');
GO

SELECT TABLE_SCHEMA, TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES

SELECT *
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Clientes'

SELECT * FROM Clientes;