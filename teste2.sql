-- 1. MODELO
CREATE SCHEMA [22513721];
GO

CREATE TABLE [22513721].proprietarios (
  proprietario_id INT IDENTITY(1,1) PRIMARY KEY,
  nome            VARCHAR(100) NOT NULL,
  morada          VARCHAR(200) NOT NULL,
  telefone        VARCHAR(20)
);

CREATE TABLE [22513721].viaturas (
  viatura_id      INT IDENTITY(1,1) PRIMARY KEY,
  matricula       VARCHAR(10) NOT NULL UNIQUE,
  marca           VARCHAR(50) NOT NULL,
  modelo          VARCHAR(50) NOT NULL,
  ano             SMALLINT    NOT NULL,
  proprietario_id INT NULL,   -- NULL = viatura sem dono
  CONSTRAINT FK_viaturas_proprietarios
    FOREIGN KEY (proprietario_id) REFERENCES [22513721].proprietarios(proprietario_id)
);
GO

-- Demonstrar que foram criadas
SELECT TABLE_SCHEMA, TABLE_NAME FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_SCHEMA = '22513721';

SELECT TABLE_NAME, COLUMN_NAME, DATA_TYPE, IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = '22513721'
ORDER BY TABLE_NAME, ORDINAL_POSITION;