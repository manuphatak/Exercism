module Pangram
  ( isPangram
  )
where

import           Data.Char                      ( toLower
                                                , isAscii
                                                , isLetter
                                                )
import           Data.List                      ( group
                                                , sort
                                                )

isPangram :: String -> Bool
isPangram =
  (['a' .. 'z'] ==)
    . map head
    . group
    . sort
    . map toLower
    . filter isAscii
    . filter isLetter
