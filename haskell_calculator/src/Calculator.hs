module Calculator 
    ( Operator(..)
    , calculate
    , parseOperator
    ) where

data Operator = Add | Subtract | Multiply | Divide
    deriving (Show, Eq)

calculate :: Double -> Operator -> Double -> Either String Double
calculate x op y = case op of
    Add      -> Right $ x + y
    Subtract -> Right $ x - y
    Multiply -> Right $ x * y
    Divide   -> if y == 0
                then Left "Error: Division by zero"
                else Right $ x / y

parseOperator :: String -> Maybe Operator
parseOperator "+" = Just Add
parseOperator "-" = Just Subtract
parseOperator "*" = Just Multiply
parseOperator "/" = Just Divide
parseOperator _   = Nothing