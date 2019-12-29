module Strain
  ( keep
  , discard
  )
where

keep :: (a -> Bool) -> [a] -> [a]
keep _ [] = []
keep fn (x : xs) | fn x      = x : keep fn xs
                 | otherwise = keep fn xs


discard :: (a -> Bool) -> [a] -> [a]
discard fn = keep $ not . fn
