{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}

{-# HLINT ignore "Use newtype instead of data" #-}
{-# HLINT ignore "Use any" #-}

module Semana7_2 where

primes :: [Int]
primes = calc_primes [2 ..]
  where
    calc_primes (x : xs) = x : calc_primes ([y | y <- xs, mod y x /= 0])
    calc_primes [] = []

data Set t = Set [t]
  deriving (Show)

contains :: Eq t => t -> [t] -> Bool
contains a (b : bs) = a == b || contains a bs
contains _ [] = False

containsAll :: Eq t => [t] -> [t] -> Bool
containsAll as bs = foldr (\a acc -> acc && contains a bs) True as

instance Eq t => Eq (Set t) where
  (==) (Set as) (Set bs) = all (`elem` as) bs && all (`elem` bs) as
