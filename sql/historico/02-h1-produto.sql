-- HISTORICO: gera pares e recorte ordenado; nao e teste conclusivo de H1.
-- Ajustes: WITH repetido removido e NULLIF para divisao por zero.
WITH nulo AS (
	
SELECT
	stockcode
   ,quantity
   ,price
   ,customerid
   ,country
FROM
	onlineRetail
WHERE
--	stockcode = '17129D' AND
	sourcesheet = '2009-2010'
	AND CustomerID IS NULL
	AND Quantity > 0
 )
SELECT TOP 100000
    A.CustomerID 
   ,A.StockCode
   ,A.Quantity AS quantidade_A
   ,A.Price	   AS preco_A
   ,A.Country  AS pais_A
   ,B.CustomerID
   ,B.StockCode 
   ,B.Quantity AS quantidade_B
   ,B.Price    AS preco_B
   ,B.Country  AS pais_B
   ,ROUND((B.Price - A.Price) / NULLIF(A.Price, 0) * 100,1)  AS variacao
FROM
	onlineRetail A 
JOIN
	nulo B ON A.StockCode = B.StockCode
WHERE
	A.Quantity > 0
	AND A.sourcesheet = '2009-2010'
	AND A.CustomerID IS NOT NULL
ORDER BY
	A.StockCode
   ,B.StockCode
   ,A.Quantity ASC
   ,B.Quantity ASC
