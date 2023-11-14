{-# LANGUAGE RankNTypes #-}
--{-# LANGUAGE OverloadedStrings #-}
import Data.Text(pack, unpack, replace)
import Data.Char

--str 
    --1

printf :: String -> [a] -> Show a => String
printf str args = foldl (\ acc arg -> unpack $ replace (pack "%s") (pack (show arg)) (pack acc)) str args

--math
    --1
decToBinary :: Integer -> String

decToBinary num = decToBinary' num ""
                  where decToBinary' num str | num > 0 = decToBinary' (div num 2) (str ++ show (mod num 2))
                                             | otherwise = reverse str

    --2
-- nToDec :: String -> Int -> Int

-- nToDec num base = nToDec' num base 0
--                   where nToDec' :: String -> Int -> Int -> Int
--                         nToDec' num base acc | length num > 1 = nToDec' (tail num) base ((acc + (ord (head num) - 48) * base) * base)
--                                              | length num == 1 = div acc base + (ord (head num) - 48)
--                                              | otherwise = acc

nToDec :: String -> Int -> Int

symbolToInteger :: Char -> Int
symbolToInteger sym | ord sym > 64 && ord sym < 91 = ord sym - 55
                    | ord sym > 96 && ord sym < 123 = ord sym - 87
                    | ord sym > 47 && ord sym < 58 = ord sym - 48
                    | otherwise = error"патамушта понабирают всяких"

nToDec "" base = 0
nToDec num base = foldl (\ acc c -> (acc + symbolToInteger c) * base) 0 (init num) + symbolToInteger (last num)

    --3
stringToInt :: String -> Int

stringToInt str = foldl (\ acc c -> (acc + symbolToInteger c) * 10) 0 (init str) + symbolToInteger (last str);

    --4
--findMissingNumber :: [Integer] -> Integer -> Integer
--findMissingNumber seq n = foldl (\ acc x -> if elem x seq then acc else x) 0 [1..n]

-- findMissingNumber :: [Integer] -> Integer -> Integer
-- findMissingNumber seq n = head [x | x <- [1..n], notElem x seq]

findMissingNumber :: [Int] -> Int
findMissingNumber seq | sum [1..maximum seq] /= sum seq = sum [1..maximum  seq] - sum seq
                      | otherwise = length seq + 1

--different
    --1

checkSequence :: [Char] -> Bool
checkSequence seq = checkSequence' seq []
                    where checkSequence' :: [Char] -> [Char] -> Bool
                          checkSequence' [] [] = True
                          checkSequence' [] stack = False
                          checkSequence' seq@(x:xs) stack | x == ')' && null stack = False
                                                          | x == ')' && not (null stack) = checkSequence' xs (pop stack)
                                                          | x == '(' = checkSequence' xs (push stack)
                                                          | otherwise = checkSequence' xs stack

push :: [Char] -> [Char]
push stack = '(' : stack

pop :: [Char] -> [Char]
pop = drop 1

