# Reprodução e validação

## Estado atual

Os scripts foram recuperados da conversa, sem acesso ao banco ou aos anexos. Não foram executados nesta organização. A carga no SQL Server foi relatada pelo autor; seus totais ainda precisam ser conciliados e registrados.

## Preparação

1. Baixar o XLSX pelo link de Releases no README ou na fonte UCI. Consulte o [hash do anexo](../data/README.md).
2. Preservar o original e registrar data de obtenção e hash.
3. Exportar separadamente as abas anuais para os dois CSVs esperados pelo script.
4. Confirmar oito colunas na ordem: Invoice, StockCode, Description, Quantity, InvoiceDate, Price, CustomerID, Country.
5. Conferir UTF-8, separador ponto e vírgula, final de linha, formato de data e separador decimal.

A exportação não está automatizada. Descrições com delimitadores/aspas, datas locais e valores vazios precisam ser conferidos; o BULK INSERT histórico não configura um parser CSV com tratamento explícito de aspas.

## Execução

Use um banco de estudo no SQL Server e um cliente que reconheça GO. Confirme versão e ambiente; ainda não foram registrados.

O script histórico foi adaptado para parar se dbo.OnlineRetail já existir, em lugar de apagar a tabela. Ajuste os dois caminhos de CSV para arquivos acessíveis à conta do serviço SQL Server. Um caminho válido no computador do cliente pode não existir no servidor.

Consulte [o índice de SQL](../sql/historico/README.md). As consultas exploratórias podem gerar muitos pares e não devem ser tratadas como análises finais.

## Evidências para aceitar a carga

Comparar CSVs/origem e SQL por SourceSheet:

- Total de linhas, datas mínima e máxima.
- Quantidade de CustomerID ausente.
- Mínimos, máximos e valores não positivos de Quantity e Price.
- Soma de Quantity e soma de Quantity × Price, com definições consistentes.
- Amostras de descrições, datas e registros com campos ausentes.
- Duplicidades: definir chave e significado antes de remover.

Registrar resultados em um relatório com consulta, data, ambiente e divergências. Nenhum item desta lista está marcado como validado sem evidência.
