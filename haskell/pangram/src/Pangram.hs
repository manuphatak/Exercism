module Pangram
  ( isPangram
  )
where

import           Data.Char
import           Data.List

isPangram :: String -> Bool
isPangram =
  (['a' .. 'z'] ==)
    . map head
    . group
    . sort
    . map toLower
    . filter isAscii
    . filter isLetter
