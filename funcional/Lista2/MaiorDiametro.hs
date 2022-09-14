module Lista2.MaiorDiametro where

data Tree t
  = Nilt
  | Node t (Tree t) (Tree t)
  deriving (Read)

depth :: Tree t -> Int
depth Nilt = 0
depth (Node a t1 t2) = 1 + max (depth t1) (depth t2)

maiorDiametro :: Ord t => Tree t -> Int
maiorDiametro Nilt = 0
maiorDiametro (Node _ t1 t2) = max (1 + depth t1 + depth t2) (max (maiorDiametro t1) (maiorDiametro t2))
