{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}

{-# HLINT ignore "Use <&>" #-}
{-# HLINT ignore "Use when" #-}

module Semana8 where

fileToSum :: IO ()
fileToSum =
  putStrLn "Caminho do Arquivo:"
    >> getLine
    >>= readFile
    >>= return . strToNumList
    >>= return . sum
    >>= (\s -> putStrLn ("soma: " ++ show s))
    >> putStrLn "Usar outro arquivo? [S/N]"
    >> getLine
    >>= (\v -> if v == "S" then fileToSum else return ())

strToNumList :: String -> [Int]
strToNumList str = map read (words str)