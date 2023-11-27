--import Data.List
--import Data.String

-- pack 5 ' maybe, recursion, structs '

-- task 1 ' quadratic equation '
-- Solve quadratic equation
-- In case it has no roots, return Nothing
quadraticSolver :: Double -> Double -> Double -> Maybe (Double, Double)
quadraticSolver a b c | b^2 - 4 * a * c < 0 = Nothing
                --      | b^2 - 4 * a * c == 0 = -b/(2*a)
                      | otherwise = Just ((-b + sqrt(b^2 - 4 * a * c))/(2*a), (-b - sqrt(b^2 - 4 * a * c))/(2*a))

-- task 2 ' maybe lists stdlib '
-- Implement the following lists functions using Maybe data structure

maybeHead :: [a] -> Maybe a
maybeHead [] = Nothing
maybeHead (x:xs) = Just x

maybeTail :: [a] -> Maybe [a]
maybeTail [] = Nothing
maybeTail (x:xs) = Just xs

maybeInit :: [a] -> Maybe [a]
maybeInit [] = Nothing
maybeInit (x:xs) = Just (maybeInit' xs x)
                   where maybeInit' [] x  = []
                         maybeInit' (x2:xs) x = x : maybeInit' xs x2

-- finds first element x in lst, such that (predicate x == True)
-- if no such element exists, returns Nothing
maybeFind :: (a -> Bool) -> [a] -> Maybe a
maybeFind predicate lst | predicate (head lst) = Just (head lst)
                        | not (predicate (head lst)) && null (tail lst) = Nothing
                        | otherwise = maybeFind predicate (tail lst)


-- task 3 ' pattern matching with data structures '
-- implement undefined functions

data DogBreed = GoldenRetrievers
              | BostonTerriers
              | LabradorRetrievers
              | Poodles
              | BorderCollie
              | Beagle
              | IrishSetter
              | Staffordshire
              | Bull
              | Terrier
    deriving (Show, Eq)

data Gender = Male | Female
    deriving (Show, Eq)

data Dog = Dog { name :: String
               , age :: Int
               , gender :: Gender
               , breed :: DogBreed
               , isGoodBoy :: Bool -- holds for female dogs as well
               } deriving (Show, Eq)

dogs = [ Dog "Leander" 12 Male Beagle False
       , Dog "Ouranos" 1 Male Poodles True
       , Dog "Pegasus" 2 Female Beagle False
       , Dog "Atlas" 8 Female GoldenRetrievers True
       , Dog "Castor" 6 Male LabradorRetrievers True
       , Dog "Apollo" 3 Female Beagle False
       , Dog "Narkissos" 15 Male Beagle True
       , Dog "Dardanos" 7 Female Terrier True
       , Dog "Ajax" 4 Male IrishSetter False
       , Dog "Pyrrhos" 2 Female BorderCollie False
       , Dog "Patroclus" 6 Male Bull True
       , Dog "Iacchus" 4 Female Beagle True ]

-- dogs which are good boys
goodBoys :: [Dog]
goodBoys = filter isGoodBoy dogs

--dogs with name longer than 7 symbols
    --1
lengthNameDog :: Dog -> Int
lengthNameDog (Dog name _ _ _ _) = length name

longNamedDogs :: [Dog]
longNamedDogs = filter ((>7) . lengthNameDog) dogs

    --2
-- r = filter (\dog -> (length $ name dog) > 7) dogs
-- r1 = filter (\(Dog name _ _ _ _) -> length name > 7) dogs
-- r2 = filter (/dog{name} -> length name dog > 7) dogs

--among dogs, which is the most popular gender?

countFemaleDogs :: Int
countFemaleDogs = length (filter (\(Dog _ _ gender _ _) -> gender == Female) dogs)

mostPopularDogGender :: Gender
mostPopularDogGender | length (filter (\(Dog _ _ gender _ _) -> gender == Female) dogs) > length (filter (\(Dog _ _ gender _ _) -> gender == Male) dogs) = Female
                     | otherwise = Male

--oldest dog
--oldestDog :: Dog
--oldestDog = (\(Dog _ age _ _ _) acc -> )

averageDogAge :: Double
averageDogAge = fromIntegral (foldl (\ acc (Dog _ age _ _ _) -> acc + age) 0 dogs) / fromIntegral (length dogs)

-- finds dogs with given breed
dogsByBreed :: DogBreed -> [Dog]
dogsByBreed dogBreed = filter (\(Dog _ _ _ breed _) -> breed == dogBreed) dogs

----- data structures
-- task 4.1

-- Создайте тип, который реализует комплексные числа
data ComplexNumber = ComplexNumber { a :: Double
                                   , b :: Double
                                   } deriving (Show, Eq)

cn1 = ComplexNumber {a = 3.0, b = 1.0}

cn2 = ComplexNumber {a = 5.0, b = -2.0}

-- создайте функции, которые реализуют:

-- - сумму, разницу
sumOfComplexNumbers :: ComplexNumber
sumOfComplexNumbers = ComplexNumber {a = a cn1 + a cn2, b = b cn1 + b cn2}

subOfComplexNumbers :: ComplexNumber
subOfComplexNumbers = ComplexNumber {a = a cn1 - a cn2, b = b cn1 - b cn2}

-- - умножение, деление
multipOfComplexNumbers :: ComplexNumber
multipOfComplexNumbers = ComplexNumber {a = a cn1 * a cn2 + b cn1 * b cn2 * (-1), b = a cn1 * b cn2 + b cn1 * a cn2}

divOfComplexNumbers :: ComplexNumber
divOfComplexNumbers = ComplexNumber {a = (a cn1 * a cn2 - b cn1 * b cn2 * (-1))/(a cn2**2 - b cn2**2 * (-1)), b = (b cn1 * a cn2 - b cn2 * a cn1)/(a cn2**2 - b cn2**2 * (-1))}

-- - взятие сопряженного
conjugateComplexNumber :: ComplexNumber
conjugateComplexNumber = ComplexNumber {a = a cn1, b = -b cn1}

-- - взятие абсолютного значения
absoluteValue :: Double
absoluteValue = sqrt(a cn2**2 + b cn2**2) 

-- Создайте тип, который образует односвязный список (<=> список имеет голову и хвост, либо является пустым)
-- реализуйте  для него следующие методы:

data MyList a = Empty | Node a (MyList a) deriving (Show)

-- data MyList a = MyList { value :: Integer
--                        , next :: MyList a} 

fromList :: [a] -> MyList a
fromList [] = Empty
fromList list = Node (head list) (fromList (tail list))

toList :: MyList a -> [a]
toList Empty = []
toList (Node value next) = value : toList next 

reverseMyList :: MyList a -> MyList a
reverseMyList list = reverseMyList' list Empty
              where reverseMyList' Empty acc = acc
                    reverseMyList' (Node value next) acc = reverseMyList' next (Node value acc)

-- should do the same thing as standard map
mapMyList :: (a -> b) -> MyList a -> MyList b
mapMyList _ Empty = Empty
mapMyList func (Node value next) = Node (func value) (mapMyList func next)
