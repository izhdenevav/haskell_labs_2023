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

-- maybeInit :: [a] -> Maybe [a]
-- maybeInit [] = Nothing
-- maybeInit [x] = Just []
-- maybeInit (x:xs) = x : maybeInit xs

-- finds first element x in lst, such that (predicate x == True)
-- if no such element exists, returns Nothing
maybeFind :: (a -> Bool) -> [a] -> Maybe a
maybeFind predicate lst = undefined


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
goodBoys = undefined

-- dogs with name longer than 7 symbols
longNamedDogs :: [Dog]
longNamedDogs = undefined

-- among dogs, which is the most popular gender?
mostPopularDogGender :: Gender
mostPopularDogGender = undefined

oldestDog :: Dog
oldestDog = undefined

averageDogAge :: Double
averageDogAge = undefined

-- finds dogs with given breed
dogsByBreed :: DogBreed -> [Dog]
dogsByBreed = undefined

----- data structures
-- task 4.1

-- Создайте тип, который реализует комплексные числа
-- создайте функции, которые реализуют:
-- - сумму, разницу
-- - умножение, деление
-- - взятие сопряженного
-- - взятие абсолютного значения


-- Создайте тип, который образует односвязный список (<=> список имеет голову и хвост, либо является пустым)
-- реализуйте  для него следующие методы:

data MyList a = UndefinedList

fromList :: [a] -> MyList a
fromList = undefined

toList :: MyList a -> [a]
toList = undefined

reverseMyList :: MyList a -> MyList a
reverseMyList = undefined

-- should do the same thing as standard map
mapMyList :: (a -> b) -> MyList a -> MyList b
mapMyList = undefined
