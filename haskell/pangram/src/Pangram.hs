module Pangram
  ( isPangram
  , isPangram'
  )
where

import           Data.Char                      ( toLower
                                                , isAscii
                                                , isLetter
                                                )
import qualified Data.Set                      as Set
import           Data.Set                       ( Set )


isPangram :: String -> Bool
isPangram = containsEachLetter . lowercaseAsciiLetters where
  lowercaseAsciiLetters :: String -> String
  lowercaseAsciiLetters = map toLower . filter isAscii . filter isLetter
  containsEachLetter :: String -> Bool
  containsEachLetter set = all (`elem` set) ['a' .. 'z']

isPangram' :: String -> Bool
isPangram' = containsEachLetter . setOfLetters where
  setOfLetters :: String -> Set Char
  setOfLetters = Set.fromList . map toLower
  containsEachLetter :: Set Char -> Bool
  containsEachLetter set = all (`Set.member` set) ['a' .. 'z']

