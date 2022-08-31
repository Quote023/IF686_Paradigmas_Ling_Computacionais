-- Primeira Prova de Paradigmas de Linguagens Computacionais --
-- 1/2018 - 03/05/2018
--
-- Nome:

-- 1) Na copa do mundo de futebol, os grupos contém 4 times, e avançam para a fase seguinte os que tem maior número de pontos, sendo 3 pontos por uma vitória, 1 por um empate, e zero por uma derrota.
-- Vamos representar os times e jogos com os tipo de dado e sinonimo de tipos abaixo:

data Time
  = Australia
  | Dinamarca
  | Franca
  | Peru
  | Argentina
  | Croacia
  | Islandia
  | Nigeria
  deriving (Eq, Show)

type Jogo = (Time, Int, Time, Int)

-- Por exemplo: Australia 3 x 1 Dinamarca será representado por (Australia, 3, Dinamarca, 1)

-- a) (2.0) Defina uma função que, dado um time e uma lista de jogos, informe quantos gols aquele time fez.
gols :: Time -> [Jogo] -> Int
gols t = foldr sumIfTime 0
  where
    sumIfTime (t1, g1, t2, g2) acc
      | t1 == t = acc + g1
      | t2 == t = acc + g2
      | otherwise = acc

-- b) (2.0) Defina uma função que, dado um time e uma lista de jogos, qual o seu saldo de gols naquele conjunto de jogos (gols feitos - gols tomados).
saldo :: Time -> [Jogo] -> Int
saldo t = foldr sumIfTime 0
  where
    sumIfTime (t1, g1, t2, g2) acc
      | t1 == t = acc + g1 - g2
      | t2 == t = acc + g2 - g1
      | otherwise = acc

-- c) (2.0) Defina uma função que, dado um time e uma lista de jogos, informe quantos pontos ele obteve naquele conjunto de jogos.
pontos :: Time -> [Jogo] -> Int
pontos t = foldr sumPontos 0
  where
    getPontos g1 g2
      | g1 > g2 = 3
      | g1 == g2 = 1
      | otherwise = 0
    sumPontos (t1, g1, t2, g2) acc
      | t1 == t = acc + getPontos g1 g2
      | t2 == t = acc + getPontos g2 g1
      | otherwise = acc

-- d) (1.0) Defina um tipo de dados para caracterizar um Grupo, que contém o nome do grupo (os grupos vão da letra 'A' à Letra 'H') e 4 times.
data ChaveGrupo = A | B | C | D | E | F | G | H

data Grupo = Grupo ChaveGrupo Time Time Time Time

-- e) (3.0)  Feito isso, defina uma função que, dado um Grupo e uma lista de jogos, retorne o par de times que estão classificados.
--    Os classificados são: os dois com maior número de pontos; em caso de empate, usa-se o saldo de gols; em caso de continuar empate usa-se o número de gols feitos (há regras adicionais, mas vamos implementar apenas essas 3).
-- exemplos de grupos são: Grupo C: Australia, Dinamarca, Franca, Peru;
--                         Grupo D: Argentina, Croacia, Islandia, Nigeria.

qs :: (a -> a -> Bool) -> [a] -> [a]
qs _ [] = []
qs f (a : as) = qs f [x | x <- as, f x a] ++ [a] ++ qs f [y | y <- as, not (f y a)]

(|>) :: a -> (a -> r) -> r
(|>) v f = f v

classificados :: Grupo -> [Jogo] -> (Time, Time)
classificados (Grupo _ t1 t2 t3 t4) j =
  [t1, t2, t3, t4]
    |> map (\t -> (t, pontos t j, saldo t j, gols t j))
    |> qs gte
    |> take 2
    |> (\[(t1, _, _, _), (t2, _, _, _)] -> (t1, t2))
  where
    gte (t1, p1, s1, g1) (t2, p2, s2, g2)
      | p1 > p2 = True
      | p2 > p1 = False
      | s1 > s2 = True
      | s2 > s1 = False
      | g1 > g2 = True
      | g2 > g1 = False
      | otherwise = False

-- você deve definir e testar vários conjuntos de jogos para validar sua implementacao.
jogos1 :: [Jogo]
jogos1 =
  [ (Australia, 1, Dinamarca, 3),
    (Franca, 2, Peru, 0),
    (Australia, 0, Franca, 2),
    (Dinamarca, 0, Peru, 0),
    (Dinamarca, 0, Franca, 1),
    (Australia, 0, Peru, 0),
    (Argentina, 1, Croacia, 0),
    (Islandia, 0, Nigeria, 1),
    (Argentina, 1, Islandia, 0),
    (Argentina, 1, Nigeria, 1),
    (Croacia, 0, Islandia, 0),
    (Croacia, 1, Nigeria, 2)
  ]

gc = Grupo C Australia Dinamarca Franca Peru

gd = Grupo D Argentina Croacia Islandia Nigeria