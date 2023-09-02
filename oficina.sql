CREATE DATABASE OficinaMecanica CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE OficinaMecanica;

-- Criação das tabelas com VARCHAR
CREATE TABLE Cliente (
    ID INT PRIMARY KEY,
    Nome VARCHAR(100),
    Telefone VARCHAR(20),
    Endereco VARCHAR(255)
);

CREATE TABLE Veiculo (
    ID INT PRIMARY KEY,
    Marca VARCHAR(50),
    Modelo VARCHAR(50),
    Ano INT,
    Placa VARCHAR(20),
    ClienteID INT,
    FOREIGN KEY (ClienteID) REFERENCES Cliente(ID)
);

CREATE TABLE TipoServico (
    ID INT PRIMARY KEY,
    Nome VARCHAR(100)
);

CREATE TABLE Servico (
    ID INT PRIMARY KEY,
    Descricao VARCHAR(255),
    Preco DECIMAL(10, 2),
    TipoServicoID INT,
    FOREIGN KEY (TipoServicoID) REFERENCES TipoServico(ID)
);

CREATE TABLE Mecanico (
    ID INT PRIMARY KEY,
    Nome VARCHAR(100),
    Especialidade VARCHAR(50)
);

CREATE TABLE Estoque (
    ID INT PRIMARY KEY,
    Nome VARCHAR(100),
    Quantidade INT
);

CREATE TABLE Fornecedor (
    ID INT PRIMARY KEY,
    Nome VARCHAR(100)
);

CREATE TABLE Produto (
    ID INT PRIMARY KEY,
    Nome VARCHAR(100),
    Preco DECIMAL(10, 2),
    EstoqueID INT,
    FornecedorID INT,
    FOREIGN KEY (EstoqueID) REFERENCES Estoque(ID),
    FOREIGN KEY (FornecedorID) REFERENCES Fornecedor(ID)
);

CREATE TABLE OrdemServico (
    ID INT PRIMARY KEY,
    DataEntrada DATETIME,
    DataConclusao DATETIME,
    VeiculoID INT,
    ClienteID INT,
    MecanicoID INT,
    FOREIGN KEY (VeiculoID) REFERENCES Veiculo(ID),
    FOREIGN KEY (ClienteID) REFERENCES Cliente(ID),
    FOREIGN KEY (MecanicoID) REFERENCES Mecanico(ID)
);

CREATE TABLE ItemServico (
    ID INT PRIMARY KEY,
    OrdemServicoID INT,
    ServicoID INT,
    Descricao VARCHAR(255),
    Preco DECIMAL(10, 2),
    FOREIGN KEY (OrdemServicoID) REFERENCES OrdemServico(ID),
    FOREIGN KEY (ServicoID) REFERENCES Servico(ID)
);


-- Inserts para a tabela Cliente
INSERT INTO Cliente (ID, Nome, Telefone, Endereco) VALUES
(1, 'João da Silva', '(69) 1234-5678', 'Rua das Pedras, 123'),
(2, 'Maria Souza', '(69) 9876-5432', 'Avenida das Seringueiras, 456'),
(3, 'Pedro Santos', '(69) 5555-5555', 'Avenida Brasil, 789'),
(4, 'Ana Pereira', '(69) 3333-3333', 'Rua Abilio Freire, 101'),
(5, 'Carlos Lima', '(69) 2222-2222', 'Avenida dos Machados, 999'),
(6, 'Priscilla Abreu', '(69) 4321-1234', 'Rua Manoel Franco, 3337');

INSERT INTO TipoServico (ID, Nome) VALUES
(1, 'Motor'),
(2, 'Elétrica'),
(3, 'Suspensão'),
(4, 'Ar Condicionado'),
(5, 'Transmissão');

-- Inserts para a tabela Veiculo
INSERT INTO Veiculo (ID, Marca, Modelo, Ano, Placa, ClienteID) VALUES
(1, 'Ford', 'Focus', 2019, 'ABC-1234', 1),
(2, 'Volkswagen', 'Golf', 2020, 'XYZ-5678', 2),
(3, 'Chevrolet', 'Cruze', 2022, 'DEF-9876', 3),
(4, 'Toyota', 'Corolla', 2018, 'GHI-5432', 4),
(5, 'Honda', 'Civic', 2021, 'JKL-2468', 5);

-- Inserts para a tabela Servico
INSERT INTO Servico (ID, Descricao, Preco, TipoServicoID) VALUES
(1, 'Troca de Óleo', 50.00, 1),
(2, 'Revisão Completa', 200.00, 2),
(3, 'Troca de Pastilhas de Freio', 80.00, 3),
(4, 'Alinhamento e Balanceamento', 60.00, 1),
(5, 'Troca de Correia Dentada', 120.00, 2);

-- Inserts para a tabela Mecanico
INSERT INTO Mecanico (ID, Nome, Especialidade) VALUES
(1, 'José Silva', 'Motor'),
(2, 'Ana Santos', 'Elétrica'),
(3, 'Carlos Pereira', 'Suspensão'),
(4, 'Mariana Souza', 'Ar Condicionado'),
(5, 'Rafael Lima', 'Transmissão');

-- Inserts para a tabela Estoque
INSERT INTO Estoque (ID, Nome, Quantidade) VALUES
(1, 'Óleo de Motor', 100),
(2, 'Pastilhas de Freio', 50),
(3, 'Pneu 195/65R15', 30),
(4, 'Filtro de Ar', 3),
(5, 'Vela de Ignição', 2);

-- Inserts para a tabela Fornecedor
INSERT INTO Fornecedor (ID, Nome) VALUES
(1, 'Distribuidora Autopeças ABC'),
(2, 'Pneus Speedy'),
(3, 'Autopeças Excelente'),
(4, 'Autopeças do Sul'),
(5, 'Distribuidora de Óleo Fácil');

-- Inserts para a tabela Produto
INSERT INTO Produto (ID, Nome, Preco, EstoqueID, FornecedorID) VALUES
(1, 'Óleo de Motor', 20.00, 1, 1),
(2, 'Pastilhas de Freio', 50.00, 2, 2),
(3, 'Pneu 195/65R15', 150.00, 3, 3),
(4, 'Filtro de Ar', 10.00, 4, 4),
(5, 'Vela de Ignição', 8.00, 5, 5);


INSERT INTO OrdemServico (ID, DataEntrada, DataConclusao, VeiculoID, ClienteID, MecanicoID) VALUES
(1, '2023-08-29 09:00:00', '2023-08-30 15:30:00', 1, 1, 1),
(2, '2023-08-30 10:15:00', NULL, 2, 2, 2),
(3, '2023-08-31 14:30:00', NULL, 3, 3, 3),
(4, '2023-09-01 11:45:00', NULL, 4, 4, 4),
(5, '2023-09-02 08:30:00', NULL, 5, 5, 5);

INSERT INTO ItemServico (ID, OrdemServicoID, ServicoID, Descricao, Preco) VALUES
(1, 1, 1, 'Troca de Óleo e Filtro', 70.00),
(2, 1, 2, 'Revisão Completa', 200.00),
(3, 2, 1, 'Troca de Óleo', 50.00),
(4, 2, 3, 'Troca de Pastilhas de Freio', 80.00),
(5, 3, 2, 'Revisão de Elétrica', 150.00);

-- Correções

-- Inserts para a tabela Estoque
INSERT INTO Estoque (ID, Nome, Quantidade) VALUES
(6, 'Óleo de Motor', 5),
(7, 'Pastilhas de Freio', 8),
(8, 'Pneu 195/65R15', 3),
(9, 'Filtro de Ar', 10),
(10, 'Vela de Ignição', 12);

-- Inserts para a tabela Veiculo
INSERT INTO Veiculo (ID, Marca, Modelo, Ano, Placa, ClienteID) VALUES
(6, 'Renault', 'Clio', 2020, 'MNO-9012', 1),
(7, 'Fiat', 'Palio', 2017, 'QRS-3456', 2),
(8, 'Ford', 'Fiesta', 2021, 'TUV-7890', 3),
(9, 'Chevrolet', 'Onix', 2019, 'XYZ-1234', 4),
(10, 'Volkswagen', 'Polo', 2018, 'ABC-5678', 5);

-- Inserts para a tabela OrdemServico
INSERT INTO OrdemServico (ID, DataEntrada, DataConclusao, ClienteID, VeiculoID, MecanicoID) VALUES
(6, '2023-09-03', '2023-09-04', 1, 6, 1),
(7, '2023-09-04', '2023-09-05', 2, 7, 2),
(8, '2023-09-05', '2023-09-06', 3, 8, 3),
(9, '2023-09-06', '2023-09-07', 4, 9, 4),
(10, '2023-09-07', '2023-09-08', 5, 10, 5);

-- Inserts para a tabela Mecanico
INSERT INTO Mecanico (ID, Nome, Especialidade) VALUES
(6, 'Luiz Ferreira', 'Motor'),
(7, 'Carla Mendes', 'Elétrica'),
(8, 'Antônio Xavier', 'Suspensão'),
(9, 'Rosa Silva', 'Ar Condicionado'),
(10, 'Gustavo Alves', 'Transmissão');

-- Inserts para a tabela Veiculo
INSERT INTO Veiculo (ID, Marca, Modelo, Ano, Placa, ClienteID) VALUES
(11, 'Renault', 'Kwid', 2022, 'DEF-1234', 1),
(12, 'Fiat', 'Uno', 2021, 'GHI-5678', 2),
(13, 'Ford', 'EcoSport', 2023, 'JKL-9012', 3),
(14, 'Chevrolet', 'Spin', 2020, 'MNO-3456', 4),
(15, 'Volkswagen', 'Fox', 2019, 'PQR-7890', 5);

-- Inserts para a tabela Servico
INSERT INTO Servico (ID, Descricao, Preco, TipoServicoID) VALUES
(6, 'Reparo de Freios', 150.00, 1),
(7, 'Manutenção Preventiva', 300.00, 2),
(8, 'Troca de Bateria', 100.00, 3),
(9, 'Reparo de Suspensão', 200.00, 1),
(10, 'Diagnóstico de Motor', 80.00, 2);

-- Inserts para a tabela Mecanico
INSERT INTO Mecanico (ID, Nome, Especialidade) VALUES
(11, 'Fernanda Oliveira', 'Elétrica'),
(12, 'Ricardo Silva', 'Motor'),
(13, 'Camila Sousa', 'Suspensão'),
(14, 'Paulo Costa', 'Ar Condicionado'),
(15, 'Isabela Santos', 'Transmissão');

-- Inserts para a tabela Estoque
INSERT INTO Estoque (ID, Nome, Quantidade) VALUES
(11, 'Pastilhas de Freio', 8),
(12, 'Pneu 195/65R15', 3),
(13, 'Filtro de Ar', 10),
(14, 'Vela de Ignição', 12),
(15, 'Bateria 60Ah', 5);

-- Inserts para a tabela TipoServico
INSERT INTO TipoServico (ID, Nome) VALUES
(11, 'Troca de Peças'),
(12, 'Inspeção'),
(13, 'Manutenção'),
(14, 'Reparo'),
(15, 'Diagnóstico');

-- Inserts para a tabela OrdemServico
INSERT INTO OrdemServico (ID, DataEntrada, DataConclusao, ClienteID, VeiculoID, MecanicoID) VALUES
(11, '2023-09-03', '2023-09-04', 1, 11, 11),
(12, '2023-09-04', '2023-09-05', 2, 12, 12),
(13, '2023-09-05', '2023-09-06', 3, 13, 13);




-- 1. Quantos veículos cada cliente possui?
SELECT c.Nome AS Cliente, COUNT(v.ID) AS TotalVeiculos
FROM Cliente c
LEFT JOIN Veiculo v ON c.ID = v.ClienteID
GROUP BY c.Nome;

-- 2. Qual é o serviço mais caro em média?
SELECT s.Descricao AS Servico, AVG(s.Preco) AS PrecoMedio
FROM Servico s
GROUP BY s.Descricao
ORDER BY PrecoMedio DESC
LIMIT 1;

-- 3. Qual é o mecânico que realizou o maior número de serviços?
SELECT m.Nome AS Mecanico, COUNT(os.ID) AS TotalServicos
FROM Mecanico m
LEFT JOIN OrdemServico os ON m.ID = os.MecanicoID
GROUP BY m.Nome
ORDER BY TotalServicos DESC
LIMIT 1;

-- 4. Quais produtos têm estoque abaixo de um determinado limite (por exemplo, 10 unidades)?
SELECT p.Nome AS Produto, e.Quantidade AS Estoque
FROM Produto p
JOIN Estoque e ON p.EstoqueID = e.ID
WHERE e.Quantidade < 10;


-- 5. Quais clientes têm mais de um veículo na oficina atualmente?
SELECT c.Nome AS Cliente, COUNT(v.ID) AS TotalVeiculos
FROM Cliente c
JOIN Veiculo v ON c.ID = v.ClienteID
GROUP BY c.Nome
HAVING TotalVeiculos > 1;


-- 7. Quais tipos de serviço são mais populares (mais frequentemente solicitados)?
SELECT ts.Nome AS TipoServico, COUNT(s.ID) AS TotalSolicitacoes
FROM TipoServico ts
JOIN Servico s ON ts.ID = s.TipoServicoID
GROUP BY ts.Nome
ORDER BY TotalSolicitacoes DESC;

-- 8. Quais são os veículos que não possuem ordens de serviço associadas?
SELECT v.Marca, v.Modelo, v.Placa
FROM Veiculo v
LEFT JOIN OrdemServico os ON v.ID = os.VeiculoID
WHERE os.ID IS NULL;


-- 9. Quais são os produtos fornecidos por um fornecedor específico?
SELECT p.Nome AS Produto, f.Nome AS Fornecedor
FROM Produto p
JOIN Fornecedor f ON p.FornecedorID = f.ID
WHERE f.Nome = 'Distribuidora Autopeças ABC';

-- 10. Quais serviços foram realizados em um determinado veículo?
SELECT v.Placa AS Veiculo, s.Descricao AS Servico
FROM Veiculo v
JOIN OrdemServico os ON v.ID = os.VeiculoID
JOIN ItemServico iserv ON os.ID = iserv.OrdemServicoID
JOIN Servico s ON iserv.ServicoID = s.ID
WHERE v.Placa = 'ABC-1234';

-- 11. Qual é o total de vendas por fornecedor?
SELECT f.Nome AS Fornecedor, SUM(p.Preco) AS TotalVendas
FROM Fornecedor f
JOIN Produto p ON f.ID = p.FornecedorID
GROUP BY f.Nome;

-- 12. Quais são os clientes que não realizaram ordens de serviço?
SELECT c.Nome AS Cliente
FROM Cliente c
LEFT JOIN OrdemServico os ON c.ID = os.ClienteID
WHERE os.ID IS NULL;

-- 13. Quais são os veículos que não têm histórico de serviços?
SELECT v.Marca, v.Modelo, v.Placa
FROM Veiculo v
LEFT JOIN OrdemServico os ON v.ID = os.VeiculoID
WHERE os.ID IS NULL;

-- 14. Quais são os mecânicos que realizaram serviços em um determinado período?
SELECT m.Nome AS Mecanico, COUNT(os.ID) AS TotalServicos
FROM Mecanico m
LEFT JOIN OrdemServico os ON m.ID = os.MecanicoID
WHERE os.DataEntrada BETWEEN '2023-08-29' AND '2023-09-02'
GROUP BY m.Nome;

