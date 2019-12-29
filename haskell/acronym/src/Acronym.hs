module Acronym
  ( abbreviate
  )
where

import           Data.List
import           Data.Char

abbreviate :: String -> String
abbreviate =
  let validChars c = isLetter c || c == ' ' || c == '-'
      wordGroup a b = isLetter a && isLower b
  in  filter isLetter
        . map (toUpper . head)
        . (=<<) (groupBy wordGroup)
        . words
        . filter validChars
