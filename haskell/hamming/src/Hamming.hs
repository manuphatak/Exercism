module Hamming
  ( distance
  )
where

distance :: String -> String -> Maybe Int
distance xs ys | length xs /= length ys = Nothing
               | otherwise = Just . countIf (uncurry (==)) $ zip xs ys

countIf :: (a -> Bool) -> [a] -> Int
countIf fn = length . filter (not . fn)
