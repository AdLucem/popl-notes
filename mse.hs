incr :: Float -> a -> Float
incr n a = n + 1.0

len :: [a] -> Float
len = foldl incr 0.0 

mse :: [Float] -> [Float] -> Float
mse la lb = (foldr (+) 0 $ map (^2) $ zipWith (-) la lb) / (len la)

mseLet :: [Float] -> [Float] -> Float
mseLet la lb =
  let
    n = len la
    diff = zipWith (-) la lb
    diffSq = map (^2) diff
   in
    (foldr (+) 0 diffSq) / n

mseWhere :: [Float] -> [Float] -> Float
mseWhere la lb = (foldr (+) 0 diffSq) / n
  where
      n = len la
      diff = zipWith (-) la lb
      diffSq = map (^2) diff

mseGolf :: [Float] -> [Float] -> Float
mseGolf la lb = (/) (len la) $ foldr (+) 0 $ map (^2) $ zipWith (-) la lb
