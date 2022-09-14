{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}

{-# HLINT ignore "Use <&>" #-}

module Lista2.ListaDeNovosAlunos where

quickSort :: Ord a => [a] -> [a]
quickSort [] = []
quickSort (x : xs) = quickSort [y | y <- xs, y < x] ++ [x] ++ quickSort [y | y <- xs, y >= x]

bSort :: [String] -> [String]
bSort = quickSort

-- Test Only:

main :: IO (Maybe ())
main = do
  bSort ["zab", "bza", "azb", "baz", "zba"]
    |> (==) ["azb", "baz", "bza", "zab", "zba"]
    !> print "Caso 1: ER"

(|>) :: a -> (a -> r) -> r
(|>) v f = f v

(?>) :: Bool -> IO b -> IO (Maybe b)
(?>) b f = do
  if b
    then f >>= (return . Just)
    else return Nothing

(!>) :: Bool -> IO b -> IO (Maybe b)
(!>) b f = not b ?> f
