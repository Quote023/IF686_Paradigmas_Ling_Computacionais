{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}

{-# HLINT ignore "Use when" #-}
{-# HLINT ignore "Use <&>" #-}

module Lista2.EditorDeTexto where

data Cmd
  = Cursor Int
  | Backspace Int
  | Delete Int
  | Insert String
  deriving (Read)

applyCommand :: (String, Int) -> Cmd -> (String, Int)
applyCommand (og, cr) cmd
  | (Insert ns) <- cmd = (bc ++ ns ++ ac, cr)
  | (Backspace i) <- cmd =
    let newb = bc |> reverse |> drop i |> reverse
     in (newb ++ ac, cr - i)
  | (Delete i) <- cmd = (bc ++ drop i ac, cr)
  | (Cursor i) <- cmd = (og, cr + i)
  where
    (bc, ac) = splitAt cr og

editText :: String -> [Cmd] -> String
editText s [] = s
editText s cmds = foldl applyCommand (s, 0) cmds |> fst

(|>) :: a -> (a -> r) -> r
(|>) v f = f v

-- Test Only:

main :: IO (Maybe ())
main = do
  editText "texto magnifico" [Insert "O "]
    |> (==) "O texto magnifico"
    !> print "Caso 1: ER"
  editText "texto magnifico" [Delete 6, Insert "O "]
    |> (==) "O magnifico"
    !> print "Caso 2: ER"
  editText "texto magnifico" [Cursor 6, Backspace 6]
    |> (==) "magnifico"
    !> print "Caso 3: ER"
  editText "This is a test text" [Cursor 7, Insert " not", Cursor 7, Delete 9, Insert "simulation"]
    |> (==) "This is not a simulation"
    !> print "Caso 4: ER"
  editText "This is a test text" [Cursor 7, Insert " not", Cursor 7, Delete 9, Insert "simulation", Cursor (-3), Backspace 4]
    |> (==) "This is a simulation"
    !> print "Caso 5: ER"

(?>) :: Bool -> IO b -> IO (Maybe b)
(?>) b f = do
  if b
    then f >>= (return . Just)
    else return Nothing

(!>) :: Bool -> IO b -> IO (Maybe b)
(!>) b f = not b ?> f
