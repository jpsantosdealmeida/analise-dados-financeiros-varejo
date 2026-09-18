-- Adaptado do historico; nao reexecutado. Consulte README.md desta pasta.
/* ============================================================
   Online Retail II - Criação de tabela e carga dos dados
   Junta as abas "Year 2009-2010" e "Year 2010-2011" (não a
   "Dinamica", que é apenas uma tabela dinâmica de resumo).
   ============================================================ */

IF OBJECT_ID('dbo.OnlineRetail', 'U') IS NOT NULL
    THROW 50001, 'A tabela ja existe. Use um banco de estudo vazio para esta carga.', 1;
GO

CREATE TABLE dbo.OnlineRetail (
    Id            INT IDENTITY(1,1) PRIMARY KEY,
    Invoice       VARCHAR(20)     NOT NULL,
    StockCode     VARCHAR(20)     NOT NULL,
    Description   VARCHAR(255)    NULL,
    Quantity      INT             NOT NULL,
    InvoiceDate   DATETIME2       NOT NULL,
    Price         DECIMAL(18,4)   NOT NULL,
    CustomerID    INT             NULL,
    Country       VARCHAR(100)    NOT NULL,
    SourceSheet   VARCHAR(20)     NOT NULL  -- '2009-2010' ou '2010-2011'
);
GO

/* ------------------------------------------------------------
   Carga via BULK INSERT a partir dos CSVs exportados das abas.
   Ajuste o caminho abaixo para onde os arquivos .csv estiverem
   no servidor (ou compartilhamento acessível pela instância).
   Os CSVs usam ';' como separador e estão em UTF-8 (com BOM).
   ------------------------------------------------------------ */

-- Tabela de staging para receber as colunas originais (sem SourceSheet)
IF OBJECT_ID('tempdb..#Staging') IS NOT NULL DROP TABLE #Staging;
CREATE TABLE #Staging (
    Invoice       VARCHAR(20),
    StockCode     VARCHAR(20),
    Description   VARCHAR(255),
    Quantity      INT,
    InvoiceDate   DATETIME2,
    Price         DECIMAL(18,4),
    CustomerID    INT,
    Country       VARCHAR(100)
);

-- 1) Carrega 2009-2010
BULK INSERT #Staging
FROM 'C:\DADOS\online_retail_2009_2010.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ';',
    ROWTERMINATOR = '0x0a',
    CODEPAGE = '65001',
    TABLOCK
);

INSERT INTO dbo.OnlineRetail
    (Invoice, StockCode, Description, Quantity, InvoiceDate, Price, CustomerID, Country, SourceSheet)
SELECT Invoice, StockCode, Description, Quantity, InvoiceDate, Price, CustomerID, Country, '2009-2010'
FROM #Staging;

TRUNCATE TABLE #Staging;

-- 2) Carrega 2010-2011
BULK INSERT #Staging
FROM 'C:\DADOS\online_retail_2010_2011.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ';',
    ROWTERMINATOR = '0x0a',
    CODEPAGE = '65001',
    TABLOCK
);

INSERT INTO dbo.OnlineRetail
    (Invoice, StockCode, Description, Quantity, InvoiceDate, Price, CustomerID, Country, SourceSheet)
SELECT Invoice, StockCode, Description, Quantity, InvoiceDate, Price, CustomerID, Country, '2010-2011'
FROM #Staging;

DROP TABLE #Staging;
GO

-- Conferência
SELECT SourceSheet, COUNT(*) AS Linhas
FROM dbo.OnlineRetail
GROUP BY SourceSheet;
GO
