module Semana6 where

data Shape
  = Circle Float
  | Rectangle Float Float
  | Square Float

area :: Shape -> Float
area (Circle r) = pi * r * r
area (Rectangle b h) = b * h
area (Square s) = s * s

data Expr
  = Lit Int
  | Add Expr Expr
  | Sub Expr Expr

showExpr :: Expr -> String
showExpr (Lit i) = show i
showExpr (Add a b) = "(" ++ showExpr a ++ " + " ++ showExpr b ++ ")"
showExpr (Sub a b) = "(" ++ showExpr a ++ " - " ++ showExpr b ++ ")"

showExpr' :: Expr -> String
showExpr' (Lit i) = show i
showExpr' x
  | (Add a b) <- x = _formatOp (showExpr a) (showExpr b) "+"
  | (Sub a b) <- x = _formatOp (showExpr a) (showExpr b) "-"
  where
    _formatOp s1 s2 op = "(" ++ s1 ++ " " ++ op ++ " " ++ s2 ++ ")"

data List t = Nil | Cons t (List t) deriving (Show)

toList :: List t -> [t]
toList Nil = []
toList (Cons h t) = h : toList t

fromList :: [t] -> List t
fromList = foldr Cons Nil

data Tree t
  = NilT
  | Node t (Tree t) (Tree t)
  deriving (Show)

depth :: Tree t -> Int
depth NilT = 1
depth (Node a t1 t2) = 1 + max (depth t1) (depth t2)

--descobri isso
depth' :: Tree t -> Int
depth' t
  | NilT <- t = 0
  | (Node a t1 t2) <- t = 1 + max (depth t1) (depth t2)

collapse :: Tree t -> [t]
collapse NilT = []
collapse (Node a t1 t2) = a : collapse t1 ++ collapse t2

mapTree :: (t -> u) -> Tree t -> Tree u
mapTree _ NilT = NilT
mapTree f (Node a t1 t2) = Node (f a) (mapTree f t1) (mapTree f t2)
