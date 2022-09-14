{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}

{-# HLINT ignore "Use <&>" #-}
{-# HLINT ignore "Use when" #-}
module Main where

import Data.Char (ord)
import Semana7_2 (Set (..))
import Semana8

main :: IO ()
main = fileToSum
