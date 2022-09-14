{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}

{-# HLINT ignore "Use sum" #-}
{-# HLINT ignore "Redundant lambda" #-}
{-# HLINT ignore "Redundant map" #-}

module Semana5 where

import Semana4 (baseExemplo, livros, unirListas)

-- Função de Alta ordem

sumList :: Num a => [a] -> a
sumList = foldl (+) 0

isCrescent :: (Int -> Int) -> Int -> Bool
isCrescent f 0 = True
isCrescent f 1 = f 1 >= f 0
isCrescent f n = f n >= f (n - 1) && isCrescent f (n -2)

takeW :: (a -> Bool) -> [a] -> [a]
takeW _ [] = []
takeW f (a : as)
  | f a = a : takeW f as
  | otherwise = []

dropW :: (a -> Bool) -> [a] -> [a]
dropW _ [] = []
dropW f (a : as)
  | f a = dropW f as
  | otherwise = a : as

(|>) :: a -> (a -> r) -> r
(|>) v f = f v

($.) = \f a b -> f b a

test =
  baseExemplo
    |> ($.) livros "Fernando"
    |> map id

insere :: Ord t => t -> [t] -> [t]
insere x [] = [x]
insere x (a : as)
  | x <= a = x : a : as
  | otherwise = a : insere x as

sort :: [Int] -> [Int]
sort = foldl (insere $.) []

-- 2 3 1
-- [1]
-- [1,3]
-- [1,2,3]