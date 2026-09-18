# Scripts históricos

| Arquivo | Origem e situação |
|---|---|
| 01-carga.sql | Script compartilhado pelo autor; caminhos generalizados e DROP da tabela substituído por bloqueio quando ela existe |
| 02-h1-produto.sql | Primeira comparação; WITH repetido ao colar foi removido, divisão protegida com NULLIF |
| 03-h1-produto-quantidade.sql | Reconstrução da segunda abordagem relatada, acrescentando Quantity ao JOIN |

As adaptações foram feitas na organização documental e não foram executadas no SQL Server. NULLIF retorna variação NULL quando o preço de referência é zero; não exclui a linha.

As duas consultas de H1 preservam o TOP e a multiplicação de pares para documentar o percurso. Empates na ordenação podem alterar quais pares entram no recorte. Não use os percentuais como conclusão populacional.

A solução final por grupos ainda cabe ao autor desenvolver e justificar.
