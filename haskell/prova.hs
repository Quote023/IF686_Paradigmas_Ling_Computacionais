import Data.Char

type Urna = (Int, [(String, Int)])

teste :: [Urna]
teste =
  [ (99, [("Cand1", 89), ("Cand2", 93), ("Cand3", 99), ("Cand4", 91)]),
    (98, [("Cand1", 85), ("Cand2", 98), ("Cand3", 89), ("Cand4", 90)]),
    (97, [("Cand1", 97), ("Cand2", 93), ("Cand3", 99), ("Cand4", 92)])
  ]

-- função auxiliar
-- pipe de composição, eu poderia usar o where e criar valores auxiliares ou o compisção com (.) e ($)
-- mas acho assim bonitinho :p
(|>) :: t1 -> (t1 -> t2) -> t2
f |> x = x f

-- 1)

somarVotos :: [(String, Int)] -> (String, Int) -> [(String, Int)]
somarVotos [] (c, v) = [(c, v)]
somarVotos ((c, v) : cs) (c', v')
  | c == c' = (c, v + v') : cs
  | otherwise = (c, v) : somarVotos cs (c', v')

votos :: [Urna] -> [(String, Int)]
votos = foldl (\x a -> x ++ snd a) []

totalize :: [Urna] -> [(String, Int)]
totalize urnas =
  urnas
    |> votos
    |> foldl somarVotos []

-----------

-- 2)

qs :: (a -> a -> Bool) -> [a] -> [a]
qs _ [] = []
qs f (a : as) = qs f [x | x <- as, f x a] ++ [a] ++ qs f [y | y <- as, not (f y a)]

ordena :: [(String, Int)] -> [(String, Int)]
ordena = qs (\a b -> snd a >= snd b)

--- 3)

chunk :: Int -> [a] -> [[a]]
chunk _ [] = []
chunk i as = take i as : chunk i (drop i as)

count :: (Eq t) => [t] -> [(t, Int)]
count [] = []
count xs = foldl insert [] xs
  where
    insert [] y = [(y, 1)]
    insert ((x, c) : as) y
      | x == y = (x, c + 1) : as
      | otherwise = (x, c) : insert as y

removerDup :: Eq a => [a] -> [a]
removerDup [] = []
removerDup xs = foldl insert [] xs
  where
    insert [] y = [y]
    insert (a : as) b
      | a == b = a : as
      | otherwise = a : insert as b

freqCount :: Eq a => [a] -> [a] -> Int
freqCount [] _ = 0
freqCount xs y
  | take (length y) xs == y = 1 + freqCount (drop 1 xs) y
  | otherwise = freqCount (drop 1 xs) y

--"este texto tem um teste"
frequencia :: String -> [(String, Int)]
frequencia [] = []
frequencia as =
  [0 .. (length as)]
    |> foldl (\acc x -> acc ++ chunk 2 (drop x as)) [] -- todas as substrings possiveis
    |> filter (\x -> length x == 2) -- remover substrings que tenham 1 caracter
    |> removerDup -- remover duplicatas
    |> map (\x -> (x, freqCount as x)) -- mapear substring -> frequencia
    |> filter (\x -> snd x > 1) -- remover os que só aparecem 1 vez

-------
-- 4)

data Chaves = No Int String Chaves Chaves | Folha

chaveTeste :: Chaves
chaveTeste = No 6 "te" (No 4 " t" Folha (No 5 "m " Folha Folha)) (No 8 "st" (No 7 "es" Folha Folha) Folha)

bs :: Chaves -> Int -> String
bs Folha _ = ""
bs (No n s t1 t2) x
  | n == x = s
  | x > n = bs t2 x
  | otherwise = bs t1 x

descompacta :: Chaves -> String -> String
descompacta ch = foldl (\acc c -> acc ++ decode c) ""
  where
    decode :: Char -> String
    decode c
      | isDigit c = bs ch (toNumber c)
      | otherwise = [c]

toNumber :: Char -> Int
toNumber c = ord c - ord '0'
