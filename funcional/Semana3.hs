{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}

{-# HLINT ignore "Use map" #-}
{-# HLINT ignore "Use foldr" #-}
{-# HLINT ignore "Use list comprehension" #-}

module Semana3 where

import Semana2

double :: [Int] -> [Int]
double [] = []
double (a : as) = (a * 2) : double as

member :: [Int] -> Int -> Bool
member [] e = False
member (a : as) e = (a == e) || member as e

digits :: String -> String
digits [] = ""
digits (c : cs)
  | ehDigito c = c : digits cs
  | otherwise = digits cs

digits' :: String -> String
digits' [] = ""
digits' (c : cs) = (if ehDigito c then [c] else []) ++ digits cs

sumPairs :: [Int] -> [Int] -> [Int]
sumPairs (a : as) (b : bs) = (a + b) : sumPairs as bs
sumPairs _ _ = []

pegarEl :: [Int] -> Int -> Int
pegarEl ar n = case pegarCaudaEm ar n of
  [] -> 0
  (a : as) -> a

pegarCaudaEm :: [Int] -> Int -> [Int]
pegarCaudaEm ar n = pegarCaudaEmI ar n 0
  where
    pegarCaudaEmI [] n i = []
    pegarCaudaEmI (a : as) n i = if n == i then as else pegarCaudaEmI as n (i + 1)

menoresQue :: [Int] -> Int -> [Int]
menoresQue [] n = []
menoresQue (a : as) n
  | a < n = a : menoresQue as n
  | otherwise = menoresQue as n

maioresOuIguaisQue :: [Int] -> Int -> [Int]
maioresOuIguaisQue [] n = []
maioresOuIguaisQue (a : as) n
  | a >= n = a : maioresOuIguaisQue as n
  | otherwise = maioresOuIguaisQue as n

quicksort :: [Int] -> [Int]
quicksort [] = []
quicksort (pivo : resto) =
  quicksort (menoresQue resto pivo) ++ [pivo] ++ quicksort (maioresOuIguaisQue resto pivo)

somarDigitos :: Int -> Int
somarDigitos i = somarDigitosStr (show i)

somarDigitosStr :: String -> Int
somarDigitosStr [] = 0
somarDigitosStr (a : as) = read [a] + somarDigitosStr as

filtro :: [t] -> (t -> Bool) -> [t]
filtro [] op = []
filtro (a : as) op
  | op a = a : filtro as op
  | otherwise = filtro as op

ordenarPelaSoma :: [Int] -> [Int]
ordenarPelaSoma [] = []
ordenarPelaSoma ar = pVal (qsTupla (montarPos ar))
  where
    montarPos [] = []
    montarPos (b : bs) = (b, somarDigitos b) : montarPos bs
    meq x (_, s) = s < x
    maq x (_, s) = s >= x
    qsTupla [] = []
    qsTupla ((pv, ps) : r) = qsTupla (filtro r (meq ps)) ++ [(pv, ps)] ++ qsTupla (filtro r (maq ps))
    pVal [] = []
    pVal ((val, _) : r) = val : pVal r
