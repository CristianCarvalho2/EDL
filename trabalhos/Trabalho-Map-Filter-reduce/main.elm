import Html exposing (text)

-- Considere uma turma de 50 alunos.
-- Cada aluno possui duas notas.
-- O aluno que ficou com média maior ou igual a sete é considerado aprovado.

-- Considere as seguintes definições em Elm para os tipos Aluno e Turma:

type alias Aluno = (String, Float, Float) -- Aluno é um tipo tupla com o nome e as duas notas
type alias Turma = List Aluno             -- Turma é um tipo lista de alunos

-- O nome ou a média de um aluno pode ser obtido através das seguintes funções:

media: Aluno -> Float
media (_,n1,n2) = (n1+n2)/2     -- o nome é ignorado

mediaAp: Aluno -> Bool
mediaAp (_,n1,n2) = (((n1+n2)/2) >= 7)



nome: Aluno -> String
nome (nm,_,_) = nm              -- as notas são ignoradas



-- Por fim, considere as assinaturas para as funções map, filter, e fold a seguir:

--List.map: (a->b) -> (List a) -> (List b)
  -- mapeia uma lista de a's para uma lista de b's com uma função de a para b

--List.filter: (a->Bool) -> (List a) -> (List a)
  -- filtra uma lista de a's para uma nova lista de a's com uma função de a para Bool

--List.foldl : (a->b->b) -> b -> List a -> b
  -- reduz uma lista de a's para um valor do tipo b
        -- usa um valor inicial do tipo b
        -- usa uma função de acumulacao que
            -- recebe um elemento da lista de a
            -- recebe o atual valor acumulado
            -- retorna um novo valor acumulado

-- Usando as definições acima, forneça a implementação para os três trechos marcados com <...>:

turma: Turma
turma = [ ("Joao",7,4), ("Maria",10,8), ("Jose",7,9), ("Ana",5,4), ("Caio",6,6), ("Breno",7,8), ("Leticia",10,9), ("Beatriz",5,6), ("Elisa",7,10),("Davi",6,8), ("Fabiana",6,4), ("Carol",7,8), ("Bruno",7,9), ("Guilherme",2,5), ("Pedro",7,9), ("Monalisa",8,8), ("Luana",5,9), ("Renato",7,8), ("Elsa",6,6),("Luke skywalker",10,10), ("James Bond",10,9), ("Ingrid",4,10), ("Daniela",9,8), ("Roger",6,5), ("Horacio",9,9), ("Reinaldo",5,9), ("Luan",8,9), ("joana",3,8), ("Jurema",6,10),("Grazielle",8,8), ("Gabriel",8,9), ("Jean",10,7), ("Gabriela",7,7), ("Amanda",7,9), ("Arnaldo",5,5), ("Rosa",8,8), ("Samantha",6,6), ("Elvis",9,7), ("Bernardo",8,7),("Matheus",5,3), ("Ronaldo",8,9), ("Thiago",8,7), ("Jamile",7,7), ("Larissa",7,9), ("Anita",5,5), ("Marcele",8,8), ("Vanessa",6,9), ("Milton",9,7), ("Iuri",4,7),("Roberto",5,3)]       -- 50 alunos

-- a) LISTA COM AS MÉDIAS DOS ALUNOS DE "turma" ([5.5, 9, ...])

medias: List Float
medias = List.map media turma



-- b) LISTA COM OS NOMES DOS ALUNOS DE "turma" APROVADOS (["Maria", ...])
mediasAp = List.filter mediaAp turma

aprovados: List String
aprovados = List.map nome mediasAp


-- c) MÉDIA FINAL DOS ALUNOS DE "turma" (média de todas as médias)
--total: Float
--total = ...
soma: Float -> Float -> Float
soma x y = (x + y)
m1 = List.foldl soma 0 medias

total = m1 / 50


--main = text (toString medias)
--main = text (toString aprovados)
main = text (toString total)
