{-# LANGUAGE DeriveFoldable #-}

--trees
data Tree a = Empty
              | Leaf a
              | Node (Tree a) a (Tree a)
              deriving Foldable

data Cat = Cat

tree1 :: Tree (Maybe Cat)
tree1 = Node Empty Nothing (Node (Node (Leaf Nothing) Nothing (Node Empty Nothing (Leaf (Just Cat)))) Nothing (Node (Leaf Nothing) Nothing Empty))

--a
findCat :: Tree (Maybe Cat) -> Int
findCat tree = findCat' 0 tree
               where findCat' acc (Just Cat) = acc + 1
                     findCat' acc (Leaf (Just Cat)) = acc + 1
                     findCat' acc (Leaf Nothing) = acc
                     findCat' acc (Node left _ right) = acc + max (findCat' acc left) (findCat' acc right)
                     
--b
wayToCat :: Tree (Maybe Cat) -> String
wayToCat tree = undefined

--чзх

data Suit = Hearts | Tiles | Clovers | Pikes
type Value = Int
data Card = JokerA | JokerB | Card Suit Value

--Card Pikes (-1)

--a
isDeckFull :: [Card] -> Bool
isDeckFull deck = undefined 

--a.2
isOrderRight :: [Card] -> Bool
isOrderRight deck = undefined

--b
--chzh

--Standard library usage, leetcode bs

--a
powerset :: [a] -> [[a]]
powerset set = undefined

--b
IpAdress1 :: String -> Bool
IpAdress1 str = undefined

--b.2
IpAdress2 :: String -> [String]
IpAdress2 str = undefined

--c
Histogram :: [Int] -> [String]
Histogram = undefined

--d
Matrix :: [[Int]] -> [[Int]]
Metrix mtrx = undefined

--e
--chzh

--advanced

--a
tic-tac-toe :: [[Int]] -> Maybe([[Int]], String)
tic-tac-toe field = undefined

--b
permutations :: [Int] -> [[Int]]
permutations = undefined

--c
pi :: Int -> Double
pi = undefined
