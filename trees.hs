data Tree = Empty | Node Int Tree Tree

  -- function that, if Tree is an empty node, returns -1
  -- else, returns key of that node (and that node only, no need to recurse to child nodes)
-- Second variant: with any one of the types I showed you (Maybe or Either),make this a function that returns
  -- the node key if it's a nonempty node, and "Empty" if it's an empty node
-- Third variant: now, do the above, but- (1) Only using Maybe, and (2) You can't return 'Just <int>' or 'Nothing' - you have to return a value of type int or type string (so I'm making you use two previously learned concepts- type variables, and pattern matching over types)
--getKey :: Tree -> Int
--getKey Empty = -1
--getKey (Node a t1 t2) = a

getKey' :: Tree -> Either Int String
getKey' Empty = Right "Empty"
getKey' (Node a t1 t2) = Left a

getKey'' :: Tree -> Maybe (Int)
getKey'' Empty = Nothing
getKey'' (Node a t1 t2) = Just a

getNormalKey :: Tree -> Int
getNormalKey tree = case (getKey'' tree) of
  Nothing -> error "Empty node"
  Just x -> x
