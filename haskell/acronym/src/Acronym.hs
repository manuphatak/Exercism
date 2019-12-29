module Acronym
  ( abbreviate
  )
where

import           Data.Char

abbreviate :: String -> String
abbreviate = map (toUpper . head) . words . clean

-- >>> clean "HyperText"
-- "Hyper Text"
--
-- >>> clean "metal-oxide"
-- "metal oxide"
--
-- >>> clean "The Road _Not_ Taken"
-- "The Road Not Taken"
--
-- >>> clean "Halley's"
-- "Halleys"
--
clean :: String -> String
clean [] = []
clean (x : x' : xs) | isLower x && isUpper x' = x : ' ' : clean (x' : xs)
clean (x : xs) | x == '-'               = ' ' : clean xs
               | isLetter x || x == ' ' = x : clean xs
               | otherwise              = clean xs
