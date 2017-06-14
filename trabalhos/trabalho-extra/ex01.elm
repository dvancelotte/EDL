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

aprovado: Aluno -> Bool
aprovado m = (media m) >= 7 

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
turma = [ ("Marcos",0,1), ("Anthony",10,8), ("Alan",7,10), ("João",5,0) ]   -- 50 alunos
 
-- a) LISTA COM AS MÉDIAS DOS ALUNOS DE "turma" ([5.5, 9, ...])
 
medias: List Float
medias = List.map media turma

 -- b) LISTA COM OS NOMES DOS ALUNOS DE "turma" APROVADOS (["Maria", ...])
 

mediaaprovadas = List.map nome (List.filter aprovado turma) 


main = text (toString mediaaprovadas) 
