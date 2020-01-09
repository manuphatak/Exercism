module Pangram
  ( isPangram
  )
where

import           Data.Char                      ( toLower
                                                , isAscii
                                                , isLetter
                                                )
import qualified Data.Set                      as Set

isPangram :: String -> Bool
isPangram =
  (==) (Set.fromDistinctAscList ['a' .. 'z'])
    . Set.fromList
    . map toLower
    . filter isAscii
    . filter isLetter
