module Lista1 where

isReplica :: String -> Int -> Char -> Bool
isReplica [] 0 _ = True
isReplica [] n _ = False
isReplica (a : as) n c = a == c && n > 0 && isReplica as (n -1) c

mul2 :: [Int] -> [Int] -> [Int]
mul2 [] [] = []
mul2 as [] = [a * 0 | a <- as]
mul2 [] bs = [b * 0 | b <- bs]
mul2 (a : as) (b : bs) = (a * b) : mul2 as bs
