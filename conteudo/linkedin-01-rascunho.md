# Rascunho — revisão do autor antes da publicação

## Texto

Uma consulta pode estar correta em SQL e ainda produzir uma comparação que não responde à pergunta.

No meu projeto com o Online Retail II, comecei investigando se registros sem identificação de cliente apresentavam preços maiores para o mesmo produto.

A primeira comparação usava o código do produto. Então percebi que a quantidade comprada também precisava entrar na discussão: eu podia estar comparando uma unidade com uma compra em volume.

Incluí a quantidade na comparação. Mas surgiu outra questão: o JOIN ainda combinava várias linhas de um grupo com várias do outro.

Num exemplo simples, 500 registros de um lado e 300 do outro podem gerar 150 mil pares. Isso não significa 150 mil vendas independentes.

Também percebi que limitar o resultado com TOP e ordenar pelos produtos não cria uma amostra aleatória.

Minha hipótese continua aberta. O próximo passo é definir qual unidade e qual medida representam melhor cada grupo antes de comparar os preços.

O aprendizado até aqui: antes de interpretar um percentual, preciso conseguir explicar o que cada linha do resultado representa.

Estou documentando esse processo no GitHub, incluindo as tentativas e suas limitações.

https://github.com/jpsantosdealmeida/online-retail-ii-analise

#SQL #AnaliseDeDados #PortfolioDeDados

## Antes de publicar

O exemplo de 500 × 300 é didático, não uma contagem observada. O texto comunica método e aprendizado; não afirma que clientes sem cadastro pagam mais.
