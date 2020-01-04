module Isogram
  ( isIsogram
  )
where

import qualified Data.Text                     as T
import           Data.Text                      ( Text )

isIsogram :: Text -> Bool
isIsogram = not . any hasDuplicate . T.tails . T.toLower . T.filter
  (\c -> c /= '-' && c /= ' ')

hasDuplicate :: Text -> Bool
hasDuplicate text = case T.uncons text of
  Just (t, tail') -> T.foldl (\acc c -> acc || c == t) False tail'
  Nothing         -> False
