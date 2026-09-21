# Análise de Dados Financeiros no Varejo

Investigação de preços, transações e qualidade dos dados.

**Projeto em desenvolvimento · SQL Server · Excel · Análise exploratória**

Como comparar preços de um mesmo produto quando quantidade e identificação do cliente também mudam?

Este projeto registra minha investigação do dataset Online Retail II: das primeiras observações no Excel à preparação dos dados no SQL Server e à revisão das hipóteses. O objetivo é construir uma análise explicável e reproduzível, documentando também as decisões que mudaram durante o caminho.

## Perguntas da investigação

- **H1:** para o mesmo produto e quantidade comparável, registros sem `CustomerID` apresentam preço unitário maior?
- **H2 (reformulada em 21/09/2026):** para o mesmo produto, o preço unitário tende a diminuir em determinadas faixas de quantidade?

As duas hipóteses estão **em investigação**. Ausência de identificação não comprova que o cliente não tinha cadastro, e associação não demonstra causa.

## O que já foi feito

| Etapa | Situação |
|---|---|
| Exploração inicial no Excel | Realizada, conforme registro de desenvolvimento |
| Identificação de campos ausentes, códigos especiais e valores atípicos | Observações documentadas; regras de tratamento em aberto |
| Consolidação de duas abas no SQL Server com `SourceSheet` | Execução relatada; reconciliação da carga pendente |
| Comparação por produto | Consulta histórica disponível |
| Comparação por produto e quantidade | Segunda abordagem documentada |
| H2: mediana e contagem por quantidade para `84077` | Consulta documentada; patamares e contraexemplos relatados |
| Controle de período e identificação; validação de H1/H2 | Em andamento |
| Modelo dimensional, Power BI e DAX | Etapas futuras, condicionadas à necessidade |

**Estado da verificação:** esta versão foi organizada a partir do histórico de desenvolvimento. O banco SQL Server e os resultados completos não foram reexecutados. A planilha de origem está disponível para download na seção abaixo. Nenhuma métrica exploratória é apresentada como conclusão validada.

**Atualização de 21/09/2026:** a análise de H2 avançou para medianas e contagens por quantidade. A hipótese foi reformulada após contraexemplos; período e presença de `CustomerID` são os próximos controles. Detalhes no [diário](docs/03-diario-de-investigacao.md).

## Principal aprendizado até aqui

Um `JOIN` pode gerar muitos pares sem representar muitas observações independentes. Controlar a quantidade melhora a comparabilidade, mas ainda é necessário definir a unidade de análise e lidar com o recorte produzido por `TOP 100000`.

Veja a [evolução da investigação](docs/03-diario-de-investigacao.md) e as [hipóteses e limitações](docs/02-hipoteses-e-metodo.md).

## Dados

Fonte: [Online Retail II — UCI](https://archive.ics.uci.edu/dataset/502/online+retail+ii). São 1.067.371 registros de um varejista online do Reino Unido, de 01/12/2009 a 09/12/2011, com valores ausentes. Preços em libras esterlinas. Esses números descrevem a fonte, não uma carga local validada.

Referência: Chen, D. (2012). *Online Retail II*. UCI Machine Learning Repository. [DOI: 10.24432/C5CG6D](https://doi.org/10.24432/C5CG6D). Dados sob [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/).

### Baixar a base e conhecer sua origem

- **[Baixar a planilha online_retail_II.xlsx](https://github.com/jpsantosdealmeida/analise-dados-financeiros-varejo/releases/download/dados-v1/online_retail_II.xlsx)** — arquivo fornecido pelo autor, anexado sem alterações à [versão de dados](https://github.com/jpsantosdealmeida/analise-dados-financeiros-varejo/releases/tag/dados-v1) (45,6 MB).
- **[Mais informações sobre a base na UCI](https://archive.ics.uci.edu/dataset/502/online+retail+ii)** — descrição, variáveis, referência e download oficial.
- [Fonte e dicionário](docs/01-dados.md) e [integridade do arquivo](data/README.md).

Online Retail II é o nome da base de dados; **Análise de Dados Financeiros no Varejo** é o nome deste projeto.

## Organização

```text
docs/                 contexto, dados, hipóteses, decisões e próximos passos
sql/historico/        scripts recuperados e adaptações identificadas
data/                 orientação para obtenção dos dados
conteudo/             pautas e rascunhos para LinkedIn
.github/              modelos de registro e revisão
```

## Como acompanhar ou reproduzir

1. Leia o [contexto e escopo](docs/00-contexto.md).
2. Baixe a planilha pelo link acima ou diretamente na UCI e preserve uma cópia sem alterações.
3. Consulte as [instruções de reprodução](docs/04-reproducao.md).
4. Leia os comentários dos scripts em [sql/historico](sql/historico/README.md) antes de executar.
5. Registre consultas, filtros e resultados usando o [modelo de investigação](docs/modelo-investigacao.md).

A reprodução completa ainda depende de conferir a exportação dos CSVs e validar a carga. As consultas históricas explicam o percurso; não encerram o teste das hipóteses.

## Próximas entregas

- Reconciliar arquivos de origem e tabela carregada.
- Definir e justificar a unidade de análise.
- Comparar grupos sem multiplicação indevida de pares.
- Avaliar país, período, valores não positivos e códigos especiais.
- Registrar resultados e contraexemplos no conjunto elegível completo.
- Definir métricas e avaliar se Power BI e modelo dimensional agregam valor.

Veja o [roadmap](docs/05-roadmap.md) e as [pautas de conteúdo](conteudo/pautas.md).

## Autoria e referências

Desenvolvimento: [jpsantosdealmeida](https://github.com/jpsantosdealmeida). Organização documental desta versão com apoio de IA; decisões analíticas e validação permanecem sob responsabilidade do autor.

Inspiração de organização: [Projeto de Análise de Dados — Exemplo, de aasouzaconsult](https://github.com/aasouzaconsult/portfolio-dados/tree/master/Projeto%20de%20An%C3%A1lise%20de%20Dados%20-%20Exemplo). A referência orientou a apresentação por etapas. Este estudo utiliza outro conjunto de dados e perguntas próprias; não incorpora o código ou o dashboard da referência.
