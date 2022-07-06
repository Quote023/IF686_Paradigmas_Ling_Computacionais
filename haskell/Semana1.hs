module Semana1 where

square :: Int -> Int
square x = x * x

allEqual :: Int -> Int -> Int -> Bool
allEqual n m p = (n == m) && (m == p)

maxi :: Int -> Int -> Int
maxi n m
  | n >= m = m
  | otherwise = m

imc :: Int -> Int -> Int
imc peso altura = div peso (square altura)

verificarNumeros :: Int -> Int -> Int -> Bool
verificarNumeros a b c = (a < b) && (b < c)

ehPrimo :: Int -> Bool
ehPrimo n
  | n <= 2 = False
  | even n = n == 2
  | otherwise = ehPrimoI n 3
  where
    ehPrimoI n i
      | mod n i == 0 = False
      | square i > n = True
      | otherwise = ehPrimoI n (i + 2)

ehPrimoEntreSi :: Int -> Int -> Int
ehPrimoEntreSi a 0 = a
ehPrimoEntreSi a b = ehPrimoEntreSi b (rem b a)

all4equal :: Int -> Int -> Int -> Int -> Bool
all4equal a b c d = allEqual a b c && (c == d)

equalCount :: Int -> Int -> Int -> Int
equalCount a b c
  | allEqual a b c = 3
  | a == b || b == c || a == c = 2
  | otherwise = 0

vendas :: Int -> Int
vendas n
  | n == 0 = 12
  | n == 1 = 24
  | n == 2 = 30
  | n == 3 = 30
  | n == 4 = 30
  | otherwise = 0

totalVendas :: Int -> Int
totalVendas 0 = vendas 0
totalVendas n = totalVendas (n - 1) + vendas n

maxVendas :: Int -> Int
maxVendas 0 = vendas 0
maxVendas n = maxi (maxVendas (n -1)) (vendas n)

contarSemanasPorVendas :: Int -> Int -> Int
contarSemanasPorVendas s n
  | n == 0 = contar s 0
  | otherwise = contarSemanasPorVendas s (n -1) + contar s n
  where
    contar s n = if vendas n == s then 1 else 0