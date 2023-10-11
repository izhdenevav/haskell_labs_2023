-- goal:
-- start thinking recursively

-- заметочки:
{-
    В хаскелле принято (как и в математике) вспомогательные функции называть тем же именем, но с апострофом
    пример: f, f', f'', f''' это все валидные имена функций

    Непосредственно про вспомогательные функции:
        иногда для работы вашей функции удобно иметь дополнительную функцию, которая решает более мелкую задачу
        ее можно определить как top-level функцию, например:
    foo x y = (fooHelper x) + y
    fooHelper x = ...

        но haskell way сделать это с помощью where-синтаксиса:
    foo x y = (fooHelper x) + y
        where fooHelper x = ...

        существенный плюс в том, что fooHelper не видно вне этой функции и она не засоряет вам пространство имен
-}

-- Каждую следующую функцию определите самостоятельно, запишите для каждой тип.
-- Считайте, что мы работаем только со списками целых чисел
-- Чтобы узнать тип оригинальной функции, пишите в ghci ":t head"
-- Чтобы почитать документацию, пользуйтесь https://hackage.haskell.org/package/base-4.17.0.0/docs/Prelude.html#v:last
-- Если сможете придумать простую имплементацию через другие собственные функции,
-- определите обоими способами, напр:
{-
last'' = head' . reverse'
-}

head' :: [Int] -> Int
head' [] = error"Debil chto li...."
head' [arr] = [arr]!!0

tail' :: [Int] -> [Int]
tail' [] = error"Debil sovsem uzhe da..."
tail' (a:arr) = arr   

-- last' :: [Int] -> Int
-- last' [arr] = 

-- init' = undefined

length' :: [Int] -> Int
length' [] = 0
length' (_:arr) = 1 + length' arr

null' :: [Int] -> Bool
null' [] = True
null' arr = False

-- reverse' = undefined

-- drop' :: Int -> [Int] -> [Int]
-- drop' num [] = error"Debil chto li sovsem ezhe..."
-- drop' 0 arr = arr
-- drop' (num:arr) = arr

sum' :: [Int] -> Int
sum' [] = 0
sum' (a:arr) = a + sum' arr

product' :: [Int] -> Int
product' [] = 1
product' (a:arr) = a * product' arr

-- elem' :: Int -> [Int] -> Bool
-- elem' num [] = error"Debil ryal"
-- elem' num arr 
