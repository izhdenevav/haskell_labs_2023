--1
kolNumbers :: Double -> Int

kolNumbers n = if n < 1 then 1 else 1 + kolNumbers(n / 10)

sumNumbers :: Int -> Int

sumNumbers n = if n < 1 then n else n `mod` 10 + sumNumbers(n `div` 10)

analyseNumber :: Int -> (Int, Int)

analyseNumber num = analyseNumber' num (1, 0)
              where analyseNumber' num acc | num < 10 = (fst acc, snd acc + num)
                                           | otherwise = analyseNumber' (num `div` 10) ((fst acc + 1), (snd acc + num `mod` 10))

dec2bin :: Int -> [Int]
dec2bin x = dec2bin' x []
        where dec2bin' x acc | x == 0 = acc
                             | otherwise = dec2bin'(x `div` 2) (x `mod` 2 : acc)

--2

-- conjectureCollatz :: Int -> ([Int], Int, Int) 
-- conjectureCollatz num | num > 0 = conjectureCollatz' num ([], 0, 0)
--                       | otherwise = error"debil chto li"

-- conjectureCollatz' 1 acc = acc
-- conjectureCollatz' num acc | num `mod` 2 == 0 = conjectureCollatz' (num `div` 2) ((num `div` 2 : fst acc), (snd acc + 1), (maximum fst acc))
--                            | otherwise = conjectureCollatz' (num * 3 + 1) ((num * 3 + 1 : fst acc), (snd acc + 1), (maximum fst acc))

--3
checkStepen :: Int -> Bool 

checkStepen n | n `mod` 2 /= 0 = False
              | n == 2 = True 
              | otherwise = checkStepen(n `div` 2) 
