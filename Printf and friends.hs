--import Data.Text(pack, unpack, replace, foldl)
import Data.Char

--str 
    --1
-- printf :: String -> [String] -> String

-- printf str arr | str `isPrefixOf` "%s" = undefined

-- replacedoubleslash :: String -> String -> String

-- replacedoubleslash s s_rep = unpack $ replace (pack "%s") (pack s_rep) (pack s)

-- str = "djfjjgfj//djjje"

-- str2 = replacedoubleslash str

-- printf :: String -> [String] -> String

-- printf str arr | str `isPrefixOf` "%s" = 

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

nToDec "" base = 0
nToDec num base = foldl (\ acc c -> (acc + (ord c - 48)) * base) 0 (init num) + ord (last num) - 48; 

    --3
stringToInt :: String -> Int

stringToInt str = foldl (\ acc c -> (acc + (ord c - 48)) * 10) 0 (init str) + ord (last str) - 48;

    --4
--findMissingNumber :: [Integer] -> Integer -> Integer

--findMissingNumber seq n = foldl (\ acc x -> if elem x seq then acc else x) 0 [1..n]

findMissingNumber :: [Integer] -> Integer -> Integer
findMissingNumber seq n = head [x | x <- [1..n], notElem x seq]
