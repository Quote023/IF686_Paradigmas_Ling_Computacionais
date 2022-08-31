module Lista2.CalculadoraArbore where

data Ops = SUM | MUL | SUB
  deriving (Read)

opToFn :: Ops -> Int -> Int -> Int
opToFn SUM = (+)
opToFn MUL = (*)
opToFn SUB = (-)

data IntTree
  = Nilt Int
  | Node Ops IntTree IntTree
  deriving (Read)

evalTree :: IntTree -> Int
evalTree (Nilt i) = i
evalTree (Node op t1 t2) = opToFn op (evalTree t1) (evalTree t2)

main :: IO ()
main = do
  s <- getLine
  let result = evalTree (read s)
  print result
