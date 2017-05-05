# Haskell

### História
Haskell é uma linguagem de programação puramente funcional, de propósito geral, nomeada em homenagem ao lógico Haskell Curry. Como uma linguagem funcional, a estrutura de controle primária é a função; a linguagem é baseada nas observações de Haskell Curry e seus descendentes intelectuais. Seu último padrão semi-oficial é o Haskell 98, destinado a especificar uma versão mínima e portável da linguagem para o ensino e como base para futuras extensões.
Haskell é a linguagem funcional sobre a qual mais se realizam pesquisas atualmente. Muito utilizada no meio acadêmico. É uma linguagem nova, elaborada em 1987, derivada de outras linguagens funcionais como por exemplo Miranda e ML. Ela se baseia em um estilo de programação em que se enfatiza mais o que deve ser feito (what) em detrimento de como deve ser feito (how). É uma linguagem que possui foco no alcance de soluções para problemas matemáticos, clareza, e de fácil manutenção nos códigos, e possui uma variedade de aplicações e apesar de simples é muito poderosa.
O conceito de avaliação preguiçosa já estava difundido no meio acadêmico desde o final da década de 1970. Esforços nessa área incluíam técnicas de redução de grafo e a possibilidade de uma mudança radical na arquitetura de von Neumann. Após o lançamento de Miranda em 1985, diversas outras linguagens funcionais de semântica não rígida proliferaram, como Lazy ML, Orwell, Alfl, Id, Clean, Ponder e Daisy (um dialeto de Lisp). Mesmo após dois anos, Miranda ainda era a mais usada, mas não estava em domínio público.
Em setembro 1987 foi realizada uma conferência Functional Programming Languages and Computer Architecture (FPCA '87), em Oregon, o consenso foi a criação de um comitê com o objetivo de construir um padrão aberto para tais linguagens. Isso consolidaria as linguagens existentes, servindo como base para pesquisas futuras no desenvolvimento de linguagens. A primeira reunião do comitê foi realizada em janeiro de 1988, e algumas das metas da linguagem foram discutidas. A linguagem deveria ser de fácil ensino, deveria ser completamente descrita através de uma sintaxe e semântica formal, deveria estar disponível livremente. Haskell foi criada da necessidade de unir as outras linguagens do mesmo paradigma em uma só.
Os objetivos principais deste comitê, ao projetar essa nova linguagem, deveria seguir algumas especificações:<br />
•	Ser viável para o ensino, pesquisa e aplicações, incluindo sistema de larga escala;<br />
•	Ser completamente descritiva via publicação no tocante à sua sintaxe e sua semântica;<br />
•	Não ser proprietária, tal que qualquer um pudesse implementá-la e distribuí-la;<br />
•	Basear-se em ideias que envolvessem o senso comum;<br />
•	Deveria reduzir a diversidade desnecessária de outras linguagens funcionais.<br />
A primeira versão de Haskell foi definida em 1 de abril de 1990. Seguiu-se a versão 1.1 em agosto de ano seguinte, a versão 1.2 em março de 1992, a versão 1.3 em maio de 1996 e a versão 1.4 em abril de 1997. Esforços posteriores culminaram no Haskell 98, publicado em janeiro de 1999 e que especifica uma versão mínima, estável e portável da linguagem e a biblioteca para ensino. Esse padrão sofreu uma revisão em janeiro de 2003. 
A linguagem continua evoluindo, sendo as implementações Hugs e GHC consideradas os padrões de facto. A partir de 2006 começou o processo de definição de um sucessor do padrão 98, conhecido informalmente por Haskell′ ("Haskell Prime").

### Características
programação funcional é um paradigma de programação que trata a computação como uma avaliação de funções matemáticas e que evita estados ou dados mutáveis. Ela enfatiza a aplicação de funções, em contraste da programação imperativa, que enfatiza mudanças no estado do programa.
Utiliza o conceito de avaliação preguiçosa  que é uma técnica usada em programação para atrasar a computação até um ponto em que o resultado da computação é considerado suficiente, o necessário. 
Os benefícios da avaliação preguiçosa incluem o aumento do desempenho ao evitar cálculos desnecessários, evitando condições de erro na avaliação de expressões compostas, a habilidade em construir estruturas de dados infinitas e a habilidade de definir estruturas do controle como funções regulares melhor que usando primitivas internas. No oposto de avaliação atrasada está avaliação ansiosa, também conhecido como avaliação rigorosa.
Todas suas funções são consideradas puras, pois possui transparência referencial e é livre de efeitos colaterais.
É uma linguagem fortemente tipada, pois todas as variáveis têm um tipo específico e seus tipos são importantes para a linguagem.
Possui list comprehension que consiste em uma construção sintática para criação de uma lista baseada em listas existentes. Ela segue a forma da notação de definição de conjunto matemática (compreensão de conjunto) como forma distinta para uso de funções de mapa e filtro.

### Aplicações
Os pontos fortes da linguagem Haskell têm sido bem aplicados em alguns projetos. É cada vez mais utilizada em aplicações comerciais. O compilador e interpretador Pugs criado por Audrey Tang é uma versão completa da linguagem Perl 6. Darcs é um sistema de controle de versões baseado em mudanças (change-based) com várias características inovadoras. A Linspire GNU / Linux escolheu Haskell para desenvolvimento das ferramentas do sistema . Xmonad é um gerenciador de janelas "tile-based" para o X Window System escrito inteiramente em Haskell. Bluespec SystemVerilog é uma linguagem feita como uma extensão do Haskell.

### Exemplos
O difundido caso do Programa Olá Mundo pode ser exemplificado em Haskell da seguinte forma:
```sh
olamundo :: IO()
olamundo = putStrLn "Olá, Mundo!"
```
A clássica definição da função fatorial:
```sh
fatorial :: Integer -> Integer
fatorial 0 = 1
fatorial n | n > 0 = n * fatorial (n-1)
```
