module Main where

import Semana6 (Shape (Circle), area)

main :: IO ()
main = do
  print (area (Circle 2))