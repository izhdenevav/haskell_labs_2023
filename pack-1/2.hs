--1
kolNumbers :: Double -> Int

kolNumbers n = if n < 1 then 1 else 1 + kolNumbers(n / 10)

sumNumbers :: Int -> Int

sumNumbers n = if n < 1 then n else n `mod` 10 + sumNumbers(n `div` 10)

-- analyseNumber :: Int -> Int -> Int 

-- analyseNumber num kol sum | num < 10 = (kol) sum
--                           | otherwise = analyseNumber (num `div` 10) (kol + 1) (sum + num `mod` 10)

--2

conjectureCollatz :: Int -> [Int]

conjectureCollatz n = do
    if n == 0 then error"debil chto li"
    else if n == 1 then []
    else if n `mod` 2 == 0 then n `div` 2 : conjectureCollatz(n `div` 2)
    else n * 3 + 1 : conjectureCollatz(n * 3 + 1)

--3
checkStepen :: Int -> Bool 

checkStepen n = if n `mod` 2 /= 0 then False else if n == 2 then True else checkStepen(n `div` 2) 
