same :: Eq a => [a] -> [a] -> [Bool]  
same la lb = zipWith (==) la lb
