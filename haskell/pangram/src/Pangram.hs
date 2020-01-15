module Pangram
  ( isPangram
  )
where

import           Data.Char                      ( toLower )

isPangram :: String -> Bool
isPangram = containsEachLetter . map toLower where
  containsEachLetter :: String -> Bool
  containsEachLetter set = all (`elem` set) ['a' .. 'z']
