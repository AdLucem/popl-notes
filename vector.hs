type Vector = [Float]

data Vector' = Vector' Int [Float]

data Vector'' = Vector'' {dim :: Int, vector :: [Float]}
