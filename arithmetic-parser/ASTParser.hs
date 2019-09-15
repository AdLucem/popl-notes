
module ASTParser where

import Data.String
import ParseUtils

parse :: String -> ParseTree
parse = recurReduce . (map toType) . tokenize
data ParseTree = LBracket | RBracket | Numeric Int |
                 Booleric Bool | Operator Op | Appl Op [ParseTree] deriving (Show)

isEqv :: ParseTree -> ParseTree -> Bool
isEqv LBracket LBracket = True
isEqv RBracket RBracket = True
isEqv (Numeric a) (Numeric b) = True
isEqv (Booleric a) (Booleric b) = True
isEqv (Operator a) (Operator b) = True
isEqv (Appl op ls) (Appl op_ ls_) = True
isEqv a b = False


isExpr :: ParseTree -> Bool
isExpr (Booleric a) = True
isExpr (Numeric a) = True
isExpr (Appl a b) = True
isExpr a = False

data Op = Add | Sub | Mul | Div | And | Or | Not | IsZero
          deriving (Eq)

instance Show Op where
    show Add = "+"
    show Sub = "-"
    show Mul = "*"
    show Div = "/"
    show And = "&"
    show Or = "|"
    show Not = "~"
    show IsZero = "zero?"

toOp :: String -> ParseTree
toOp op = case op of
  "+" -> Operator Add
  "-" -> Operator Sub
  "*" -> Operator Mul
  "/" -> Operator Div
  "&" -> Operator And
  "|" -> Operator Or
  "~" -> Operator Not
  "zero?" -> Operator IsZero
  otherwise -> error "Invalid syntax"

toType :: String -> ParseTree
toType s
  | isNumber s  = Numeric (read s)
  | isBoolean s = Booleric (read s)
  | isEq "(" s  = LBracket
  | isEq ")" s  = RBracket
  | isOp s      = toOp s
  | otherwise   = error "Incorrect syntax!"

isBinaryPrimApp :: [ParseTree] -> Bool
isBinaryPrimApp ls =
  if ((length ls) == 5) then
    let
      preds = [(isEqv LBracket),
               (isEqv (Operator Add)),
               isExpr, isExpr,
               (isEqv RBracket)]
      applyPred f a = f a
      match = zipWith applyPred preds ls
    in
      foldr (&&) True match
  else
    False

binaryPrimApp :: [ParseTree] -> ParseTree
binaryPrimApp ls = Appl op [x, y]
  where
    (Operator op) = ls !! 1
    x  = ls !! 2
    y  = ls !! 3

isUnaryPrimApp :: [ParseTree] -> Bool
isUnaryPrimApp ls =
  if ((length ls) == 4) then
    let
      preds = [(isEqv LBracket),
               (isEqv (Operator Add)),
               isExpr,
               (isEqv RBracket)]
      applyPred f a = f a
      match = zipWith applyPred preds ls
    in
      foldr (&&) True match
  else
    False

unaryPrimApp :: [ParseTree] -> ParseTree
unaryPrimApp ls = Appl op [x]
  where
    (Operator op) = ls !! 1
    x  = ls !! 2
tokenize :: String -> [String]
tokenize = words
windowmap :: Int
          -> ([ParseTree] -> Bool)
          -> ([ParseTree] -> ParseTree)
          -> [ParseTree]
          -> [ParseTree] -- accumulator
          -> [ParseTree]
windowmap n predf f acc [] = acc
windowmap n predf f acc ls =
  let
    window = take n ls
    rest = drop n ls
  in
    if predf window
    then
      windowmap n predf f (acc ++ [f window]) rest
    else
      windowmap n predf f (acc ++ [head ls]) (tail ls)

recurReduce :: [ParseTree] -> ParseTree
recurReduce [a] = a
recurReduce ls =
  let
    map4 = windowmap 4 isUnaryPrimApp unaryPrimApp [] ls
    map5 = windowmap 5 isBinaryPrimApp binaryPrimApp [] map4
  in
    recurReduce map5
