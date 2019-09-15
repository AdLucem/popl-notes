m :: Int
m = 10

m' :: Float
m' = 10.1

incr :: (Integral a, Fractional b) => a -> b
incr n = fromIntegral n
