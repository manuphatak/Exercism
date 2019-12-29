module PerfectNumbers
  ( classify
  , Classification(..)
  )
where

data Classification = Deficient | Perfect | Abundant deriving (Eq, Show)

classify :: Int -> Maybe Classification

classify n
  | n <= 0
  = Nothing
  | otherwise
  = let factors = [ i | i <- [1 .. n `div` 2], n `rem` i == 0 ]
    in  case sum factors `compare` n of
          LT -> Just Deficient
          EQ -> Just Perfect
          GT -> Just Abundant

