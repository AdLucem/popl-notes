div :: Float -> Float -> Either Float String
div a b = if b /= 0 then Left (a / b) else Right "Divide by zero error"
