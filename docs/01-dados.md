# Fonte e dicionário de trabalho

[Online Retail II, UCI](https://archive.ics.uci.edu/dataset/502/online+retail+ii) — Chen, D. (2012), [DOI](https://doi.org/10.24432/C5CG6D), licença CC BY 4.0.

O script de carga relatado usa as abas anuais e acrescenta SourceSheet. A aba de resumo “Dinamica” não integra a carga.

| Campo no SQL relatado | Papel |
|---|---|
| Id | Identificador técnico criado na carga; não é chave de negócio |
| Invoice | Fatura/transação; a documentação da UCI associa prefixo C a cancelamento |
| StockCode | Código do item |
| Description | Descrição |
| Quantity | Quantidade registrada na linha |
| InvoiceDate | Data e hora |
| Price | Preço unitário; chamado UnitPrice na documentação da UCI |
| CustomerID | Identificação do cliente, com valores ausentes |
| Country | País |
| SourceSheet | Procedência anual acrescentada na preparação |

A documentação da UCI usa InvoiceNo; o script local utiliza Invoice. Confirmar os cabeçalhos efetivos na exportação.

## Granularidade

Uma linha registra um item em uma transação. Contar linhas não equivale automaticamente a contar pedidos, clientes ou produtos. Invoice + StockCode também não deve ser assumida como chave única sem teste.

## Questões observadas no desenvolvimento

| Observação relatada | O que investigar |
|---|---|
| CustomerID ausente | Cobertura e impacto por pergunta; não inferir ausência de cadastro |
| Quantidades negativas/cancelamentos | Separar cancelamento de evidência de devolução física |
| Price igual a zero | Significado e influência nas comparações/divisões |
| Códigos especiais em StockCode | Conferir códigos e descrições completos antes de classificar |
| País não especificado | Cobertura e comparabilidade geográfica |
| Valores extremos | Evidência, sensibilidade e tratamento |

As interpretações de códigos como P, D e M são apontamentos exploratórios do histórico, não um dicionário oficial confirmado. Não há regra geral de exclusão aprovada.
