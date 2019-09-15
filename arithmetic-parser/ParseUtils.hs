
module ParseUtils where

isEq :: String -> String -> Bool
isEq s s_ = s == s_

numbers :: String
numbers = "1234567890"

isDigit :: Char -> Bool
isDigit d = d `elem` numbers

isNumber :: String -> Bool
isNumber n = foldr (&&) True $  map isDigit n

isBoolean :: String -> Bool
isBoolean s = (s == "True") || (s == "False")

isBinaryOp :: String -> Bool
isBinaryOp s = s `elem` ["=", "+", "-", "*", "/", "&", "|"]

isUnaryOp :: String -> Bool
isUnaryOp s = s `elem` ["~", "zero?"]

isOp :: String -> Bool
isOp s = (isBinaryOp s) || (isUnaryOp s)
