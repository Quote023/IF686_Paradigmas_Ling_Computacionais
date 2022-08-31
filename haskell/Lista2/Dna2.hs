module Lista2.Dna2 where

data Animal
  = Cisnal
  | Iguanoide
  | Narvale
  | Null
  deriving (Eq, Show)

(|>) :: t1 -> (t1 -> t2) -> t2
(|>) x f = f x

zipAndPad :: String -> String -> [(Char, Char)]
zipAndPad [] [] = []
zipAndPad (a : as) [] = (a, ' ') : zipAndPad as []
zipAndPad [] (b : bs) = (' ', b) : zipAndPad [] bs
zipAndPad (a : as) (b : bs) = (a, b) : zipAndPad as bs

compStr :: String -> String -> Double
compStr s1 s2 =
  s1
    |> zipAndPad s2
    |> map (\(a, b) -> if a == b then 1.0 else 0.0)
    |> sum
    |> (/ fromIntegral (max (length s1) (length s2)))

-- TABELA >>>> > >>>>> | i >= 0.1 && i <= 0.3 | i >= 0.4 && i <= 0.7 |  i >= 0.8
-- P(Cisnal) >>>>>>>>>>|        1.0           |          0.0         |       0.0
-- P(Iguanoide) >>>>>>>|        0.0           |          1.0         |       0.0
-- P(Narvale)>>> >>>>> |        0.0           |          0.0         |       1.0
numToAnimal :: (Ord a, Fractional a) => a -> Animal
numToAnimal i
  | i >= 0.1 && i <= 0.3 = Cisnal
  | i >= 0.4 && i <= 0.7 = Iguanoide
  | i >= 0.8 = Narvale
  | otherwise = Null

sumToAnim :: Double -> [Int] -> [Int]
sumToAnim i [x, y, z]
  | Cisnal <- anim = [x + 1, y, z]
  | Iguanoide <- anim = [x, y + 1, z]
  | Narvale <- anim = [x, y, z + 1]
  | Null <- anim = [x, y, z]
  where
    anim = numToAnimal i
sumToAnim _ n = error "invalido"

dna2 :: [String] -> [String] -> [Int]
dna2 w1 w2 =
  w1
    |> zip w2
    |> map (uncurry compStr)
    |> foldr sumToAnim [0, 0, 0]

main = do
  firstExtract <- words <$> getLine -- equivalente a (read firstExtract :: [String])
  secondExtract <- words <$> getLine
  let result = dna2 firstExtract secondExtract
  print result