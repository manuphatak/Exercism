module SumOfMultiples
  ( sumOfMultiples
  )
where

import           Data.List                      ( nub
                                                , unfoldr
                                                )

sumOfMultiples :: [Integer] -> Integer -> Integer
sumOfMultiples factors limit =
  sum . nub . concatMap (multiplesUntil limit) $ factors

multiplesUntil :: (Ord a, Num a) => a -> a -> [a]
multiplesUntil limit factor = unfoldr nextMultiple 0 where
  nextMultiple b =
    if b >= limit - factor then Nothing else Just (b + factor, b + factor)
