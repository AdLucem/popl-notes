quicksort :: (Ord a) => [a] -> [a]  
quicksort [] = []  
quicksort (x:xs) =  (quicksort [a | a <- xs, a <= x]) ++ [x] ++ (quicksort [a | a <- xs, a > x])
