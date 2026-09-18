# Diário da investigação

Registro consolidado em 18/09/2026 a partir da conversa de desenvolvimento.

| Marco | Avanço | Limitação / próxima decisão |
|---|---|---|
| Escolha do Online Retail II | Fonte pública definida | Confirmar representação dos campos |
| Exploração no Excel | Identificação de ausências e registros atípicos | Arquivos/imagens ainda não incorporados |
| Formulação de H1 e H2 | Separação entre identificação e quantidade | Não atribuir causalidade |
| Carga no SQL Server | Duas abas reunidas com SourceSheet | Reconciliação ainda sem evidência arquivada |
| JOIN por produto | Primeira comparação de preços | Quantidades diferentes e muitos pares |
| JOIN por produto e quantidade | Maior comparabilidade | Pares repetidos e recorte ordenado persistem |
| Revisão metodológica | Unidade de análise tornou-se questão central | Definir agregação e executar avaliação completa |

## Resultados numéricos citados na conversa

A conversa descreve duas exportações com 100 mil pares e relata diferenças de preço. Os arquivos anexados não ficaram acessíveis nesta organização do repositório; por isso os percentuais não são promovidos a resultados do projeto.

Há ainda uma inconsistência a reconciliar: o relato menciona 87,4% de repetições exatas e 1.274 combinações distintas em 100 mil linhas. Se as duas medidas usam o mesmo conjunto de colunas e a mesma definição de repetição, 1.274 combinações implicariam 98,726% de linhas excedentes. Podem existir definições diferentes, mas isso não foi especificado. É necessário recalcular e explicitar os denominadores.

## Decisões registradas

- Preservar a origem de cada linha.
- Manter os dados originais e documentar filtros por análise.
- Tratar hipóteses como hipóteses.
- Guardar consultas históricas com suas limitações.
- Não declarar implementação de DW, DAX ou dashboard antes de existirem artefatos.
