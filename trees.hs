data Tree = Empty | Node Int Tree Tree

  -- function that, if Tree is an empty node, returns -1
  -- else, returns key of that node (and that node only, no need to recurse to child nodes)
-- with any one of the types I showed you (Maybe or Either),make this a function that returns
  -- the node key if it's a nonempty node, and "Empty" if it's an empty node

getKey :: Tree -> Int
getKey Empty = -1
getKey (Node a _ _) = a
