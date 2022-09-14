{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}

{-# HLINT ignore "Use <&>" #-}

module Lista2.Calculadora where

type Comando = String

type Valor = Int

executa1 :: Valor -> (Comando, Valor) -> Valor
executa1 og ("Multiplica", v) = og * v
executa1 og ("Soma", v) = og + v
executa1 og ("Subtrai", v) = og - v
executa1 _ ("Divide", 0) = -666
executa1 og ("Divide", v) = div og v
executa1 _ (c, _) = error ("Comando Inválido " ++ c)

executa :: [(Comando, Valor)] -> Int
executa = foldl executa1 0

-- Test Only:

main :: IO (Maybe ())
main = do
  executa [("Multiplica", 2), ("Soma", 5), ("Subtrai", 3)]
    |> (==) 2
    !> print "Caso 1: ERRO"
  executa [("Multiplica", 2), ("Soma", 5), ("Divide", 0)]
    |> (==) (-666)
    !> print "Caso 2: ERRO"

(|>) :: a -> (a -> r) -> r
(|>) v f = f v

(?>) :: Bool -> IO b -> IO (Maybe b)
(?>) b f = do
  if b
    then f >>= (return . Just)
    else return Nothing

(!>) :: Bool -> IO b -> IO (Maybe b)
(!>) b f = not b ?> f
