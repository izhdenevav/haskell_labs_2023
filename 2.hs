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

--ver1

conjectureCollatz :: Int -> ([Int], Int, Int)
conjectureCollatz num | num > 0 = conjectureCollatz' num [num] 0 0
                      | otherwise = error"debil chto li"

conjectureCollatz' :: Int -> [Int] -> Int -> Int -> ([Int], Int, Int)
conjectureCollatz' 1 aсс cnt max = (aсс, cnt, max)
conjectureCollatz' num acc cnt max | even num = conjectureCollatz' (div num 2) (acc ++ [div num 2]) (cnt + 1) (maximum acc)
                                   | otherwise = conjectureCollatz' (num * 3 + 1) (acc ++ [num * 3 + 1]) (cnt + 1) (maximum acc)

--ver2

myCollatz :: Int -> ([Int], Int, Int)
myCollatz num | num > 0 = myCollatz' num ([num], 0, 0)
              | otherwise = error"debil chto li"

myCollatz' :: Int -> ([Int], Int, Int) -> ([Int], Int, Int)
myCollatz' 1 acc = acc
myCollatz' num acc@(arr, cnt, max) | even num = myCollatz' (div num 2) ((arr ++ [div num 2]), (cnt + 1), (maximum arr))
                                   | otherwise = myCollatz' (num * 3 + 1) ((arr ++ [num * 3 + 1]), (cnt + 1), (maximum arr))

--3
checkStepen :: Int -> Bool 

checkStepen n | n `mod` 2 /= 0 = False
              | n == 2 = True 
              | otherwise = checkStepen(n `div` 2) 
