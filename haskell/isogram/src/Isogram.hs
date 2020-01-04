module Isogram
  ( isIsogram
  )
where

import           Data.List
import           Data.Char

isIsogram :: String -> Bool
isIsogram = not . any hasDuplicate . tails . map toLower . filter isLetter
 where
  hasDuplicate []       = False
  hasDuplicate (x : xs) = x `elem` xs

