{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}

{-# HLINT ignore "Use <&>" #-}

module Lista2.FatoresPrimos where

(|>) :: a -> (a -> r) -> r
(|>) v f = f v

divisores :: Integral a => a -> [a]
divisores n = [x | x <- [1 .. n], mod n x == 0]

isPrime :: Integral a => a -> Bool
isPrime n = divisores n == [1, n]

fatPrime :: Int -> [(Int, Int)]
fatPrime n = [(x, qtd x) | x <- divisores n |> filter isPrime]
  where
    qtd x = [1 ..] |> takeWhile (\m -> (x ^ m) `elem` divisores n) |> last

-- Test Only:

main :: IO (Maybe ())
main = do
  fatPrime 27
    |> (==) [(3, 3)]
    !> print "Caso 1: ERRO"
  fatPrime 50
    |> (==) [(2, 1), (5, 2)]
    !> print "Caso 2: ERRO"
  fatPrime 100
    |> (==) [(2, 2), (5, 2)]
    !> print "Caso 3: ERRO"

(?>) :: Bool -> IO b -> IO (Maybe b)
(?>) b f = do
  if b
    then f >>= (return . Just)
    else return Nothing

(!>) :: Bool -> IO b -> IO (Maybe b)
(!>) b f = not b ?> f
