module Lista2.Dna1 where

data Tree t
  = Node t (Tree t) (Tree t)
  | Nilt
  deriving (Read, Show)

tree2List :: Tree a -> [a]
tree2List Nilt = []
tree2List (Node t t1 t2) = tree2List t1 ++ [t] ++ tree2List t2

dna1 :: Tree Int -> [String]
dna1 = group 8 . map (numToC . (`mod` 5)) . tree2List

group :: Int -> [a] -> [[a]]
group n [] = []
group n xs = a : group n as
  where
    (a, as) = splitAt n xs

numToC :: Int -> Char
numToC 0 = 'E'
numToC 1 = 'M'
numToC 2 = 'A'
numToC 3 = 'C'
numToC 4 = 'S'
numToC n = error ("caracter invalido " ++ show n)
