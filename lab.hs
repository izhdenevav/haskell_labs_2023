--1 СДЕЛАЛА НА КР ПРОВЕРЯЙТЕ ПОЧТУ

--2

    --1
        --ver1 без list compreh.
dotsInCircle' :: (Double, Double) -> Double -> [(Double, Double)] -> [(Double, Double)]

dotsInCircle' (x, y) r arr = foldl (\ acc (arr_x, arr_y) -> if sqrt((arr_x - x)^2 - (arr_y - y)^2) <= r then acc ++ [(arr_x, arr_y)] else acc) [] arr

        --ver2
dotsInCircle :: (Double, Double) -> Double -> [(Double, Double)] -> [(Double, Double)]

dotsInCircle (x, y) r arr = [(arr_x, arr_y) | (arr_x, arr_y) <- arr, sqrt((arr_x - x)^2 - (arr_y - y)^2) <= r]

--3
    --ver1 без лист компрехеншн
setAnd' :: [Int] -> [Int] -> [Int]

setAnd' arr1 arr2 = foldl (\ acc a -> if elem a arr2 && notElem a acc then acc ++ [a] else acc) [] arr1

    --ver2 с лист компрехеншн 
    --(тут с повторами, если в списке несколько одинаковых элементов, пока не знаю, как с этим разобраться)
setAnd :: [Int] -> [Int] -> [Int]

setAnd arr1 arr2 = [x | x <- arr1, y <- arr2, x == y]
 
--4

    --Сумму цифр числа и количество цифр числа делала в 1 лабе

    --Степень двойки тоже делала уже в 1 лабе

    --4

--sequenceByPred :: (a -> a) -> a -> [a]

--sequenceByPred func arr = 

--6 сделала в 1 лабе

--7

--8

sort :: [Int] -> [Int]

sort (a:a2:arr) | a > a2 = a2 : sort (a : arr)
                | otherwise = a : sort (a2 : arr)

sort arr = arr



