-- По аналогии с монадой Either, которая может содержать либо результат вычисления, либо описание ошибки, 
-- создайте тип данных TEither (как "tripple either"), который реализует вычисление, которое:
-- (1) либо закончилось успешно (как Right)
-- (2) либо закончилось с провалом (как Left)
-- (3) либо закончилось с некритическим провалом, и содержит и описание ошибки, и промежуточный результат

-- задание творческое -- вы сами должны придумать реализации Monad, Applicative и Functor

data TEither a b = TLeft a | TError String b | TRight b  deriving Show 

instance Functor (TEither a) where
    fmap _ (TLeft a) = TLeft a
    fmap f (TError err a) = TError err (f a)
    fmap f (TRight b) = TRight (f b)

instance Applicative (TEither a) where
  pure = TRight
  TLeft _ <*> TLeft a = TLeft a
  TError err f <*> a = fmap f a 
  TRight f <*> TRight b = TRight (f b)

instance Monad (TEither a) where
  TLeft a >>= _ = TLeft a
  TError err a >>= f = f a
  TRight b >>= f = f b

