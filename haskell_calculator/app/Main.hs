module Main where

import Calculator
import System.IO
import Text.Read (readMaybe)

main :: IO ()
main = do
    putStrLn "Welcome to Haskell Calculator!"
    calculator

calculator :: IO ()
calculator = do
    putStr "Enter first number: "
    hFlush stdout
    num1Str <- getLine
    case readMaybe num1Str of
        Nothing -> do
            putStrLn "Invalid number"
            calculator
        Just n1 -> do
            putStr "Enter operator (+, -, *, /): "
            hFlush stdout
            opStr <- getLine
            case parseOperator opStr of
                Nothing -> do
                    putStrLn "Invalid operator"
                    calculator
                Just op -> do
                    putStr "Enter second number: "
                    hFlush stdout
                    num2Str <- getLine
                    case readMaybe num2Str of
                        Nothing -> do
                            putStrLn "Invalid number"
                            calculator
                        Just n2 -> do
                            case calculate n1 op n2 of
                                Left err -> putStrLn err
                                Right result -> putStrLn $ "Result: " ++ show result
                            putStr "Continue? (y/n): "
                            hFlush stdout
                            cont <- getLine
                            if cont == "y" then calculator else putStrLn "Goodbye!"