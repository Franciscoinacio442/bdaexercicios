
-- 1. CRIAR E USAR A BASE DE DADOS
CREATE DATABASE nome_da_base_de_dados;
GO

USE nome_da_base_de_dados;
GO


-- 2. CRIAR TABELA "PAI" (COM TODAS AS REGRAS)
CREATE TABLE nome_da_tabela_pai (
    nome_da_coluna_id_pai INT PRIMARY KEY, 
    
    nome_da_coluna_texto VARCHAR(100) NOT NULL, 
    
    nome_da_coluna_unica VARCHAR(100) UNIQUE, 
    
    nome_da_coluna_idade INT CHECK (nome_da_coluna_idade >= 18), 
    
    nome_da_coluna_pais VARCHAR(50) DEFAULT 'nome_do_pais' 
);
GO


-- 3. CRIAR TABELA "FILHA" (COM FOREIGN KEY)
CREATE TABLE nome_da_tabela_filha (
    nome_da_coluna_id_filha INT PRIMARY KEY,
    nome_da_coluna_data DATE,
    
    nome_da_coluna_id_pai INT, 
    
    FOREIGN KEY (nome_da_coluna_id_pai) REFERENCES nome_da_tabela_pai(nome_da_coluna_id_pai)
);
GO
ALTER TABLE nome_da_tabela
ADD nome_da_nova_coluna VARCHAR(100);
GO


-- 4. ADICIONAR VALORES (INSERT)
INSERT INTO nome_da_tabela_pai (nome_da_coluna_id_pai, nome_da_coluna_texto, nome_da_coluna_unica, nome_da_coluna_idade) 
VALUES 
(1, 'valor_texto_1', 'valor_unico_1', 20),
(2, 'valor_texto_2', 'valor_unico_2', 25);
GO

INSERT INTO nome_da_tabela_filha (nome_da_coluna_id_filha, nome_da_coluna_data, nome_da_coluna_id_pai) 
VALUES 
(100, '2026-10-29', 1),
(101, '2026-10-30', 2);
GO


-- 5. ATUALIZAR UM VALOR EXISTENTE (UPDATE)
UPDATE nome_da_tabela_pai
SET nome_da_coluna_texto = 'novo_valor_atualizado'
WHERE nome_da_coluna_id_pai = 1; -- NUNCA esquecer o WHERE!
GO


-- 6. CRIAR ÍNDICE PARA PESQUISAS RÁPIDAS (INDEX)
CREATE INDEX nome_do_indice
ON nome_da_tabela_pai (nome_da_coluna_texto);
GO


-- 7. CRIAR UMA VISTA VIRTUAL (VIEW)
CREATE VIEW nome_da_vista AS
SELECT nome_da_coluna_id_pai, nome_da_coluna_texto
FROM nome_da_tabela_pai
WHERE nome_da_coluna_idade > 20;
GO


-- 8. CRUZAR AS DUAS TABELAS (INNER JOIN)
SELECT 
    p.nome_da_coluna_texto, 
    f.nome_da_coluna_id_filha, 
    f.nome_da_coluna_data
FROM nome_da_tabela_pai p
INNER JOIN nome_da_tabela_filha f ON p.nome_da_coluna_id_pai = f.nome_da_coluna_id_pai;
GO


-- 9. JUNTAR DUAS COLUNAS NUMA SÓ LISTA (UNION)
SELECT nome_da_coluna_texto FROM nome_da_tabela_pai
UNION
SELECT nome_da_coluna_unica FROM nome_da_tabela_pai;
GO