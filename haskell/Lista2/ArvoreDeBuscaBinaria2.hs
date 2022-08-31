module Lista2.ArvoreDeBuscaBinaria2 where

data Tree t
  = Nilt
  | Node t (Tree t) (Tree t)
  deriving (Read, Show)

insertList :: Ord t => Tree t -> [t] -> Tree t
insertList Nilt [] = Nilt
insertList Nilt (a : as) = insertList (Node a Nilt Nilt) as
insertList (Node a t1 t2) xss = Node a (insertList t1 st) (insertList t2 gt)
  where
    gt = [y | y <- xss, y >= a]
    st = [y | y <- xss, y < a]
