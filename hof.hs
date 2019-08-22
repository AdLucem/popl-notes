map' :: (a -> b) -> [a] -> [b]
map' f [] = []
map' f ls =  (f (head ls)) : (map' f (tail ls))
