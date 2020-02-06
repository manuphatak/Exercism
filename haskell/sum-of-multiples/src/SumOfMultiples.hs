module SumOfMultiples
  ( sumOfMultiples
  )
where

import qualified Data.Set                      as Set

sumOfMultiples :: [Integer] -> Integer -> Integer
sumOfMultiples factors limit =
  sum
    . Set.unions
    . map (Set.fromDistinctAscList . multiplesUntil limit)
    $ factors

multiplesUntil :: (Ord a, Num a) => a -> a -> [a]
multiplesUntil _     0      = []
multiplesUntil limit factor = takeWhile (< limit) $ iterate (factor +) 0
