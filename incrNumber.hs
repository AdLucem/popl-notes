addStars :: String -> String
addStars s = "**" ++ s ++ "**"

main = do
  putStrLn "Number:"
  n <- getLine
  let n' = addStars n
  putStrLn n'
