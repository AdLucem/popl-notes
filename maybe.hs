div :: Float -> Float -> Maybe (Float)
div a b = if b /= 0  then Just (a / b) else Nothing
