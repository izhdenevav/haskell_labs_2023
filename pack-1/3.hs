head' :: [Int] -> Int
head' [] = error"Debil chto li...."
head' (a:arr) = a

tail' :: [Int] -> [Int]
tail' [] = error"Debil sovsem uzhe da..."
tail' (a:arr) = arr   

length' :: [Int] -> Int
length' [] = 0
length' (a:arr) = 1 + length' arr

null' :: [Int] -> Bool
null' [] = True
null' arr = False

sum' :: [Int] -> Int
sum' [] = 0
sum' (a:arr) = a + sum' arr

product' :: [Int] -> Int
product' [] = 1
product' (a:arr) = a * product' arr

last' :: [Int] -> Int
last' [] = error"Debil sovsem chto li uzhe..." 
last' (a:[]) = a
last' (a:arr) = last' arr

init' :: [Int] -> [Int]
init' [] = error"Ryalno debil..."
init' [a] = []
init' (a:arr) = a : init' arr

reverse' :: [Int] -> [Int]
reverse' [] = []
reverse' (a:arr) = reverse' arr ++ [a] 

drop' :: Int -> [Int] -> [Int]
drop' num [] = []
drop' num (a:arr) | num > 0 = drop' (num - 1) arr
                  | otherwise = arr

elem' :: Int -> [Int] -> Bool
elem' num [] = error"Debil ryal"
elem' num arr = foldl (\ acc x -> if x == num then True else acc) False arr
