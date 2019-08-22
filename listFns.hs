incr :: Float -> a -> Float
incr n a = n + 1.0

len :: [a] -> Float
len = foldl incr 0.0 

mse :: [Float] -> [Float] -> Float
mse la lb = (foldr (+) 0 $ map (^2) $ zipWith (-) la lb) / (len la)
