{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}

{-# HLINT ignore "Use foldr" #-}
{-# HLINT ignore "Use map" #-}
module Semana4 where

-- Tuplas

bhaskara :: Float -> Float -> Float -> (Float, Float)
bhaskara a b c
  | delta >= 0 = ((- b + delta) / (2 * a), (- b - delta) / (2 * a))
  | otherwise = (0, 0)
  where
    delta = b ^ 2 - 4 * a * c

menorMaior3 :: Int -> Int -> Int -> (Int, Int)
menorMaior3 a b c
  | a > b && b > c = (a, c)
  | a > c && c > b = (a, b)
  | b > c && c > a = (b, a)
  | b > a && a > c = (b, c)
  | c > a && a > b = (c, b)
  | otherwise = (c, a)

ordenaTripla :: (Int, Int, Int) -> (Int, Int, Int)
ordenaTripla (a, b, c)
  | a >= men && a <= mai = (men, a, mai)
  | b >= men && b <= mai = (men, b, mai)
  | c >= men && c <= mai = (men, c, mai)
  | otherwise = (men, c, mai)
  where
    (men, mai) = menorMaior3 a b c

type Ponto = (Float, Float)

type Reta = (Ponto, Ponto)

fsCoord :: Ponto -> Float
fsCoord (x, _) = x

sndCoord :: Ponto -> Float
sndCoord (_, y) = y

ehVertical :: Reta -> Bool
ehVertical (p1, p2) = fsCoord p1 - fsCoord p2 == 0

quaseZero :: Float -> Bool
quaseZero f = abs f < 1e-6

ehVertical' :: Reta -> Bool
ehVertical' ((x, _), (x', _)) = quaseZero (x - x')

doubleList xs = [x * 2 | x <- xs]

type Pessoa = String

type Livro = String

type BancoBiblioteca = [(Pessoa, Livro)]

baseExemplo :: BancoBiblioteca
baseExemplo =
  [ ("Sergio", "O Senhor dos Aneis"),
    ("Andre", "Duna"),
    ("Fernando", "Jonathan Strange & Mr.Norrell"),
    ("Fernando", "A Game of Thrones")
  ]

filtrar :: (a -> Bool) -> [a] -> [a]
filtrar f xs = [x | x <- xs, f x]

tornarEm :: (t -> a) -> [t] -> [a]
tornarEm f xs = [f x | x <- xs]

(|>) :: a -> (a -> r) -> r
(|>) v f = f v

($.) :: (a -> b -> r) -> b -> a -> r
($.) f a b = f b a

($$.) :: (a -> b -> c -> r) -> b -> c -> a -> r
($$.) f a b c = f c a b

testp2 =
  baseExemplo
    |> ($$.) devolver "Joao" "A Sociedade do Anel"
    |> ($$.) emprestar "Joao" "As Duas Torres"
    |> ($.) livros "Joao"

livros :: BancoBiblioteca -> Pessoa -> [Livro]
livros db p = [l | (p', l) <- db, p == p']

livros' :: BancoBiblioteca -> Pessoa -> [Livro]
livros' db p = db |> filtrar (\(p', _) -> p' == p) |> tornarEm snd

emprestimos :: BancoBiblioteca -> Livro -> [Pessoa]
emprestimos db l = [p | (p, l') <- db, l == l']

emprestimos' :: BancoBiblioteca -> Livro -> [Pessoa]
emprestimos' db l = db |> filtrar (\(l', _) -> l' == l) |> tornarEm fst

emprestado :: BancoBiblioteca -> Livro -> Bool
emprestado db l = not (null (emprestimos db l))

emprestado' :: BancoBiblioteca -> Livro -> Bool
emprestado' db l = emprestimos db l |> null |> not

qtdEmprestimos :: BancoBiblioteca -> Pessoa -> Int
qtdEmprestimos db p = livros db p |> length

qtdEmprestimos' :: BancoBiblioteca -> Pessoa -> Int
qtdEmprestimos' db p = length (livros db p)

emprestar :: BancoBiblioteca -> Pessoa -> Livro -> BancoBiblioteca
emprestar db p l
  | jaEmprestado = db
  | otherwise = (p, l) : db
  where
    jaEmprestado = emprestado db l

devolver :: BancoBiblioteca -> Pessoa -> Livro -> BancoBiblioteca
devolver db p l = [(p', l') | (p', l') <- db, (p /= p') && (l' /= l)]

devolver' :: BancoBiblioteca -> Pessoa -> Livro -> BancoBiblioteca
devolver' db p l = db |> filtrar (\(p', l') -> (p /= p') && (l' /= l))

-- Polimorfismo

qslc :: Ord a => [a] -> [a]
qslc [] = []
qslc (x : xs) = qslc [y | y <- xs, y < x] ++ [x] ++ qslc [y | y <- xs, y >= x]

unirListas :: [[t]] -> [t]
unirListas [] = []
unirListas (a : as) = a ++ unirListas as

contar :: Eq a => [a] -> a -> Int
contar xs c = length [x | x <- xs, x == c]

removerElem :: Eq t => [t] -> t -> [t]
removerElem [] _ = []
removerElem (x : xs) c
  | x == c = xs
  | otherwise = x : removerElem xs c

removerDup :: Eq a => [a] -> [a]
removerDup [] = []
removerDup (x : xs) = x : xs |> ($.) removerElem x |> removerDup

agrupar :: Eq t => [[t]] -> [(t, Int)]
agrupar [] = []
agrupar xs = flat |> removerDup |> contarRep
  where
    flat = xs |> unirListas
    contarRep [] = []
    contarRep (y : ys) = (y, contar flat y) : contarRep ys