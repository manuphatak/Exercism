{-# LANGUAGE TupleSections #-}

module CollatzConjecture
  ( collatz
  )
where

collatz :: Integer -> Maybe Integer
collatz n = fst <$> (conjectureCount . (0, )) n

conjectureCount :: (Enum a, Eq b, Integral b) => (a, b) -> Maybe (a, b)
conjectureCount (count, n) | n < 0     = Nothing
                           | n == 1    = Just (count, n)
                           | even n    = conjectureCount (succ count, n `div` 2)
                           | otherwise = conjectureCount (succ count, 3 * n + 1)
