module CollatzConjecture
  ( collatz
  )
where

import           Data.List

collatz :: Integer -> Maybe Integer
collatz n | n < 1     = Nothing
          | otherwise = indexOf 1 . iterate conjecture $ n


conjecture :: Integral a => a -> a
conjecture n | even n    = n `div` 2
             | otherwise = 3 * n + 1

indexOf :: Eq a => a -> [a] -> Maybe Integer
indexOf needle haystack = toInteger <$> elemIndex needle haystack


