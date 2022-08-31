{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}

{-# HLINT ignore "Use <&>" #-}

module Lista2.SomarListas where

somarComCarry :: [Int] -> [Int]
somarComCarry [] = []
somarComCarry (a : as)
  | [] <- as, a >= 10 = [mod a 10, div a 10]
  | (b : bs) <- as, a >= 10 = mod a 10 : somarComCarry ((b + div a 10) : bs)
  | otherwise = a : somarComCarry as

zipAndPad :: [Int] -> [Int] -> [(Int, Int)]
zipAndPad [] [] = []
zipAndPad (a : as) [] = (a, 0) : zipAndPad as []
zipAndPad [] (b : bs) = (0, b) : zipAndPad [] bs
zipAndPad (a : as) (b : bs) = (a, b) : zipAndPad as bs

-- somarListas :: [Int] -> [Int] -> [Int]
somarListas :: [Int] -> [Int] -> [Int]
somarListas [] [] = []
somarListas l1 l2 =
  zipAndPad (reverse l1) (reverse l2)
    |> map (uncurry (+))
    |> somarComCarry
    |> reverse

(|>) :: a -> (a -> r) -> r
(|>) v f = f v

-- Test Only:

main :: IO (Maybe ())
main = do
  somarListas [1, 5, 9] [2, 0, 0]
    |> (==) [3, 5, 9]
    !> print "Caso 1: ERRO"
  somarListas [5, 0] [2, 1, 0]
    |> (==) [2, 6, 0]
    !> print "Caso 2: ERRO"
  somarListas [1, 9, 9, 9] [2]
    |> (==) [2, 0, 0, 1]
    !> print "Caso 3: ERRO"

(?>) :: Bool -> IO b -> IO (Maybe b)
(?>) b f = do
  if b
    then f >>= (return . Just)
    else return Nothing

(!>) :: Bool -> IO b -> IO (Maybe b)
(!>) b f = not b ?> f
