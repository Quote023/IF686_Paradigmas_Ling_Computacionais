module Semana10_2 where

substr :: String -> String -> Bool
substr [] _ = True
substr xss@(x : xs) ys = take len toTest == xss || substr xss (drop len toTest)
  where
    len = length xss
    toTest = dropWhile (/= x) ys