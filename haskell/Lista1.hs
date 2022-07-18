module Lista1 where

isReplica :: String -> Int -> Char -> Bool
isReplica [] 0 _ = True
isReplica [] n _ = False
isReplica (a : as) n c = a == c && n > 0 && isReplica as (n -1) c

mul2 :: [Int] -> [Int] -> [Int]
mul2 [] [] = []
mul2 as [] = [a * 0 | a <- as]
mul2 [] bs = [b * 0 | b <- bs]
mul2 (a : as) (b : bs) = (a * b) : mul2 as bs

addEspacos :: Int -> String
addEspacos 0 = ""
addEspacos 1 = " "
addEspacos n = " " ++ addEspacos (n -1)

paraDireita :: Int -> String -> String
paraDireita n s = addEspacos n ++ s

sumTo :: Int -> Int
sumTo 0 = 0
sumTo 1 = 1
sumTo n = n + sumTo (n - 1)

btoi :: String -> Int
btoi [] = 0
btoi s = _btoi (reverse s) 0
  where
    _btoi (bit : rest) n = read [bit] * (2 ^ n) + _btoi rest (n + 1)
    _btoi [] _ = 0

decEnigma :: String -> [(Char, Char)] -> String
decEnigma [] _ = ""
decEnigma (a : as) dic = trad a dic : decEnigma as dic
  where
    trad :: Char -> [(Char, Char)] -> Char
    trad p [] = p
    trad p ((x, y) : dic)
      | p == x = y
      | otherwise = trad p dic

split :: String -> Char -> [String]
split [] _ = []
split (a : as) c
  | a == c = [] : next -- ignora o caracter do split e cria uma nova string
  | null next = [a] : next
  | otherwise = (a : head next) : tail next -- junta com a próxima (que pode ser uma string vazia ou o resto da string)
  where
    next = split as c

parse :: String -> [(String, String, String, Double)]
parse [] = []
parse s = agrup (split s ';')
  where
    agrup [] = []
    agrup (d : e : v : as) = let (dia : mes : _) = words d in (dia, mes, e, read v) : agrup as
    agrup _ = []

minMaxCartao :: String -> (Double, Double)
minMaxCartao [] = (0, 0)
minMaxCartao s = _minmax rs (v0, v0)
  where
    ((_, _, _, v0) : rs) = parse s
    _minmax [] mm = mm
    _minmax ((_, _, _, v) : xs) (min, max)
      | v > max = _minmax xs (min, v)
      | v < min = _minmax xs (v, max)
      | otherwise = _minmax xs (min, max)

logMes :: String -> String -> Double
logMes [] _ = 0
logMes _ [] = 0
logMes m s =
  let ps = parse s
      somaMes acc (_, m', _, v) = (if m == m' then v else 0) + acc
   in foldl somaMes 0.0 ps

logMes' :: String -> String -> Double
logMes' [] _ = 0
logMes' _ [] = 0
logMes' m s = _somaMes ps
  where
    ps = parse s
    _somaMes [] = 0.0
    _somaMes ((_, m', _, v) : xs) = (if m == m' then v else 0) + _somaMes xs
