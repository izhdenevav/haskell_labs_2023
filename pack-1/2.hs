--1
kolNumbers :: Double -> Int

kolNumbers n = if n < 1 then 1 else 1 + kolNumbers(n / 10)

sumNumbers :: Int -> Int

sumNumbers n = if n < 1 then n else n `mod` 10 + sumNumbers(n `div` 10)

--2


--3
checkStepen :: Int -> Bool 

checkStepen n = if n `mod` 2 /= 0 then False else if n == 2 then True else checkStepen(n `div` 2) 
