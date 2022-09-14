{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}

{-# HLINT ignore "Use <&>" #-}

module Lista2.ArvoreDeBuscaBinaria1 where

data Tree t
  = Nilt
  | Node t (Tree t) (Tree t)
  deriving (Read)

isBST :: Ord t => Tree t -> Bool
isBST Nilt = False
isBST (Node v left right)
  | Nothing <- minR, Nothing <- maxL = True
  | (Just ml) <- maxL, (Just mr) <- minR = (ml <= v && v <= mr) && isBST left && isBST right
  | (Just ml) <- maxL = ml <= v && isBST left
  | (Just mr) <- minR = mr >= v && isBST right
  where
    maxL = maxTree left
    minR = minTree right

maxTree :: Ord t => Tree t -> Maybe t
maxTree = compTree max

minTree :: Ord t => Tree t -> Maybe t
minTree = compTree min

compTree :: Ord t => (t -> t -> t) -> Tree t -> Maybe t
compTree _ Nilt = Nothing
compTree f (Node v t1 t2)
  | (Just ft1) <- fromT1, (Just ft2) <- fromT2 = Just $ f v (f ft1 ft2)
  | (Just ft1) <- fromT1 = Just $ f v ft1
  | (Just ft2) <- fromT2 = Just $ f v ft2
  | otherwise = Just v
  where
    fromT1 = compTree f t1
    fromT2 = compTree f t2

-- Test Only:

main :: IO (Maybe ())
main = do
  isBST (Node 5 (Node 3 Nilt Nilt) (Node 7 Nilt Nilt))
    |> (==) True
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
