import Data.List
import Control.Monad.State

type GreekData = [(String, [Integer])]

greekDataA :: GreekData
greekDataA = [ ("alpha", [5, 10])
             , ("beta", [0, 8])
             , ("gamma", [18, 47, 60])
             , ("delta", [42])
             ]

greekDataB :: GreekData
greekDataB = [ ("phi", [53, 13])
             , ("chi", [21, 8, 191])
             , ("psi", [])
             , ("omega", [6, 82, 144])
             ]

headMay :: [a] -> Maybe a
headMay (x : xs) = Just x
headMay [] = Nothing

divMay :: Double -> Double -> Maybe Double
divMay x y | y == 0 = Nothing
           | otherwise = Just (x / y)

maximumMay :: Ord a => [a] -> Maybe a
maximumMay [] = Nothing
--да схитрила да использовала встроенную функцию :зззззз
maximumMay (x : xs) = Just (maximum (x : xs))

-- maximumMay :: Ord a => [a] -> Maybe a
-- maximumMay arr = helper' arr Nothing
--                  where helper' [] acc = acc
--                        helper' (x : xs) acc | Just x > acc = helper' xs (Just x)
--                                             | otherwise = helper' xs acc
                                                 
tailMay :: [a] -> Maybe a
tailMay [x] = Just x
tailMay (x : xs) = tailMay xs 
tailMay [] = Nothing

{-
 tl;dr implement the function WITHOUT do-notation or any monad magic. only pattern-matching, where and let in

 first query the GreekData that is passed in,
 look up the string passed in the second argument,
 and retrieve the corresponding list of Integers. Call this list xs.
 Next calculate the maximum of the tail of xs
 (Don’t use any pattern matching here.
 Use case expressions and the maximumMay and tailMay functions)
 Take the maximum and divide it by the head of the list (using headMay and divMay functions).
 If any of these operations along the way return Nothing, then your function should return Nothing.
 But if everything succeeds, then return the final quotient.
 One hint… you’ll need to use the fromIntegral function to convert your two Integers to Doubles for the final call to divMay.
-}
-- queryGreek :: GreekData -> String -> Maybe Double
-- queryGreek greekData name | fst (greekData !! 0) == name = Just (divMay (maximumMay (snd (greekData !! 0)) headMay (snd (greekData !! 0))))
--                           | fst (greekData !! 1) == name = Just (maximumMay (snd (greekData !! 1)) / headMay (snd (greekData !! 1)))
--                           | fst (greekData !! 2) == name = Just (maximumMay (snd (greekData !! 2)) / headMay (snd (greekData !! 2)))
--                           | fst (greekData !! 3) == name = Just (maximumMay (snd (greekData !! 3)) / headMay (snd (greekData !! 3)))
--                           | otherwise = Nothing
fromJust :: Maybe a -> a
fromJust (Just x) = x

findSecondElementByFirstElement :: String -> [(String, [Integer])] -> [Integer]
findSecondElementByFirstElement name = foldl(\acc (x, y) -> if name == x then y else acc) []

--lookup :: Eq a => a -> [(a,b)] -> Maybe b
--Input: lookup 'c' [('a',0),('b',1),('c',2)]
--Output: Just 2

queryGreek'' :: GreekData -> String -> Maybe Double
queryGreek'' greekData name | not (null array) = divMay (fromIntegral(fromJust(maximumMay array))) (fromIntegral(fromJust(headMay array)))
                            | otherwise = Nothing
                            where array = fromJust (lookup name greekData) 
                                          
queryGreek' :: GreekData -> String -> Maybe Double
queryGreek' greekData name | not (null array) = divMay (fromIntegral(fromJust(maximumMay array))) (fromIntegral(fromJust(headMay array)))
                           | otherwise = Nothing
                           where array = findSecondElementByFirstElement name greekData

queryGreek :: GreekData -> String -> Maybe Double
queryGreek greekData name | fst (greekData!!0) == name = divMay (fromIntegral(fromJust(maximumMay(snd(greekData!!0))))) (fromIntegral(fromJust(headMay(snd(greekData!!0)))))
                          | fst (greekData!!1) == name = divMay (fromIntegral(fromJust(maximumMay(snd(greekData!!1))))) (fromIntegral(fromJust(headMay(snd(greekData!!1)))))
                          | fst (greekData!!2) == name = divMay (fromIntegral(fromJust(maximumMay(snd(greekData!!2))))) (fromIntegral(fromJust(headMay(snd(greekData!!2)))))
                          | fst (greekData!!3) == name = divMay (fromIntegral(fromJust(maximumMay(snd(greekData!!3))))) (fromIntegral(fromJust(headMay(snd(greekData!!3)))))
                          | otherwise = Nothing

-- queryGreek greekDataA "alpha" == Just 2.0

-- Now do the same whole thing, but using do-notation, since Maybe is a Monad

-- aaa x = case x of 
--              []     ->  [1]
--              [x]    ->  [x]
--              (x:xs) ->  xs
-- Input: aaa [1,2,3]
-- Output: [2,3]
-- Input: aaa []
-- Output: [1]
-- Input: aaa [4]
-- Output: [4]


queryGreekPro :: GreekData -> String -> Maybe Double
queryGreekPro greekData name = do
    let array = findSecondElementByFirstElement name greekData
    --or
    let array2 = fromJust (lookup name greekData)
--1vers
    -- let max = maximumMay array
    -- let head = headMay array
    -- case (fromJust max, fromJust head) of
    --     (max, head) -> divMay (fromIntegral max) (fromIntegral head)
--при array == [] вылетает исключение, надо пофиксить

--2vers без исключения на пустом array
    case (array) of
        [] -> Nothing
        (x : xs) -> divMay (fromIntegral (fromJust (maximumMay array))) (fromIntegral (fromJust (headMay array))) 

--3vers как сделать case (max, head) с обработкой пустых значений хммммммммммммммммммммммммммммм потом сделаю мб

--a harder task. rewrite queryGreekPro, but without the do-notation, only using the (>>=) operator and its friends
--in other words, desugarize your notation

--(>>=) :: m a -> (a -> m b) -> m b

-- queryGreekProPlus :: GreekData -> String -> Maybe Double
-- queryGreekProPlus greekData name = 
--     findSecondElementByFirstElement name greekData >>= \array ->
--                                                    maximumMay array >>= \maxValue ->
--                                                    headMay array >>= \firstValue ->
--                                                    case (maxValue, firstValue) of
--                                                         (Just maxVal, Just firstVal) -> 
--                                                             divMay (fromIntegral maxVal) (fromIntegral firstVal)


-- Определите тип `RandState` (напр с помощью  `type RandState = ...`  ).  
-- Замените `_something2` на подходящее выражение (это должен быть seed, т.е. начальное значение генератора псевдо-случайных чисел). 
-- Определите тип `rollDice` так, чтобы `firstPlayerRes` имел тип `Int`. 
-- `rollDice` реализуйте как генератор псевдо-случайных чисел, который дает числа в области значений [1, 6]. 
-- Сама реализация псевдо-случайных чисел не обязательно должна быть сложной, можно, например, 
-- по очереди отдавать числа в таком порядке: [4, 3, 5, 2, 1, 6].  
-- Но изначальный seed должен влиять на результирующую последовательность.

--randomR :: (Random a, RandomGen b) => (a,a) -> b -> (a,b) 
type RandState = State (Int, String) 

rollDice :: RandState Int
rollDice = do
    (randState, str) <- get
    let (newRandState, randomInt) = (randState `mod` 6 + 1, randomInt `mod` 6)
    put (newRandState, str)
    return randomInt

game :: RandState String
game = do
    firstPlayerRes <- rollDice
    secondPlayerRes <- rollDice
    return $ if firstPlayerRes > secondPlayerRes then "First wins" else "Second wins"

--evalState :: State s a -> s -> a
runGame :: String
runGame = evalState game startSeed
  where startSeed = (123, "Start game")

-- see this program as example:
{-
x=foo
y=bar
y=$x
l=l
x=$y
-}

{-
At the end of this program the state is:
x = foo
y = foo
l = l
-}

data Value = Literal String | VariableReference String
data Command = Command { varName :: String, whatToPut :: Value } 

-- you can choose something else!
type InterpreterState = [(String, String)]

-- using get, set and other State functions, interpret the command
interpretOne :: Command -> State InterpreterState ()
interpretOne (Command var value) = do
    interpreterState <- get 
    let updatedInterpreterState = updateState var value interpreterState
    put updatedInterpreterState
    where updateState varName (Literal val) ((name, _) : xs) | varName == name = (varName, val) : xs
                                                             | otherwise = (name, val) : updateState varName (Literal val) xs
          updateState varName (VariableReference varRef) s@((name, val) : xs) | varRef == name = (varName, val) : updateState varName (VariableReference varRef) xs
                                                                              | otherwise = (name, val) : updateState varName (VariableReference varRef) xs 
          updateState _ _ [] = error"WRONG ANSWER"
          

-- you may rewrite this. e.g. you can use fold
-- but if you look at standard library there might be
-- a better alternative for chaining state functions.
-- In other words, executing a list of (State s a)
-- functions is a common task, and it has a standard implementation
interpretMany :: [Command] -> State InterpreterState ()
interpretMany [] = return ()
interpretMany (x:xs) = do
    interpretOne x
    interpretMany xs

-- you can choose other type for result
--execState :: State s a -> s -> s
interpretToState :: [Command] -> [(String, String)]
interpretToState commands = execState (interpretMany commands) emptyState
    where emptyState = []

-- example: "foo=bar" -> Command "foo" (Literal "bar")
-- example: "foo=$bar" -> Command "foo" (VariableReference "bar")

--span :: (a -> Bool) -> [a] -> ([a], [a])
parse :: String -> Command 
parse str = Command varName value
  where (varName, rest) = span (/= '=') str
        value = case rest of
            '=' : rest' | '$' : varRef <- rest' -> VariableReference varRef
                        | otherwise -> Literal rest'
            _ -> error "Invalid input format"

--lines :: String -> [String]
solveState :: String -> [(String, String)]
solveState input = interpretToState (map parse $ lines input)

exampleProgram :: String
exampleProgram = "x=foo\ny=bar\ny=$x\nl=l\nx=$y"

-- one of possible answers. order in list doesn't matter
exampleAns :: [(String, String)]
exampleAns = [("x", "foo"), ("y", "foo"), ("l", "l")]

check :: IO ()
check = do
    let resultState = solveState exampleProgram
    if exampleAns `listEq` resultState
        then putStrLn "OK!"
        else error "something wrong:("
    where listEq l r = leftInRight && rightInLeft
            where leftInRight = all (\x -> x `elem` r) l
                  rightInLeft = all (\x -> x `elem` l) r



