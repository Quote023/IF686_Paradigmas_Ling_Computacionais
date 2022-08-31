module Lista2.CalculoSeguro where

import Prelude hiding (Maybe (..))

(|>) :: a -> (a -> r) -> r
(|>) v f = f v

isDigit :: Char -> Bool
isDigit c = c >= '0' && c <= '9'

opTofn :: String -> Int -> Int -> Maybe Int
opTofn "sum" a b = (a + b) |> Just
opTofn "mul" a b = (a * b) |> Just
opTofn "sub" a b = (a - b) |> Just
opTofn "div" a 0 = Nothing
opTofn "div" a b = div a b |> Just
opTofn _ _ _ = Nothing

data Maybe a
  = Just a
  | Nothing
  deriving (Show)

safeCalc :: String -> IO ()
safeCalc [] = print (Nothing :: Maybe Int)
safeCalc str = print (op x y)
  where
    x = (str |> takeWhile isDigit |> read) :: Int
    op = str |> dropWhile isDigit |> takeWhile (not . isDigit) |> opTofn
    y = (str |> dropWhile isDigit |> dropWhile (not . isDigit) |> read) :: Int

main :: IO ()
main = do
  a <- getLine
  safeCalc a
