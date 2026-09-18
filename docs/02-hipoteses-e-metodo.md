# Hipóteses e método em construção

## H1 — identificação e preço

Para o mesmo produto e quantidade comparável, registros sem CustomerID apresentam Price maior?

Uma comparação adequada precisa declarar população elegível, unidade de análise e representação de preço. País e período são candidatos a controles adicionais. A ausência do ID pode refletir diferentes processos de registro; não estabelece tipo de cliente.

## H2 — quantidade e preço

Para o mesmo produto, quantidades maiores estão associadas a menor preço unitário?

Exemplos visuais motivaram a hipótese, mas não demonstram política de desconto nem relação causal. Também é preciso procurar produtos e períodos em que a relação não aparece ou se inverte.

## Evolução do desenho

1. Comparação por StockCode.
2. Percepção de que Quantity também varia entre grupos.
3. Inclusão de Quantity no JOIN.
4. Identificação de multiplicação de pares e recorte ordenado por TOP.
5. Próxima decisão: escolher uma representação por grupo e justificar a ponderação.

Se um grupo tem 500 linhas e o outro 300 para a mesma chave, o JOIN pode produzir 150.000 pares. Eles compartilham observações de origem; não são 150.000 vendas independentes.

TOP com ORDER BY seleciona o início de uma ordenação. Não equivale a amostragem aleatória. Adicionar DISTINCT não resolve automaticamente o desenho: muda o peso das combinações e pode eliminar repetições legítimas.

## O que falta decidir

- Unidade: linha transacional, produto, produto/quantidade ou outra combinação?
- Representação: média, mediana, moda ou distribuição? Por quê?
- Peso: cada grupo terá o mesmo peso ou peso proporcional às transações?
- Cobertura: quantos grupos aparecem em ambos os lados? Quais ficam de fora?
- País e período: como comparar condições semelhantes?
- Tratamento: quais filtros são adequados a cada hipótese?
- Robustez: como a conclusão muda com escolhas razoáveis diferentes?

## Critério de conclusão

Uma conclusão deverá informar universo, filtros, unidade, denominador, cobertura, consulta versionada e limitações. Evidência contrária e resultados nulos também entram na documentação. H1 e H2 continuam abertas.
