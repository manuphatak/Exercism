module ETL
  ( transform
  )
where

import qualified Data.Map.Strict               as Map
import           Data.Map.Strict                ( Map )
import           Data.Char                      ( toLower )

transform :: Map a String -> Map Char a
transform = Map.foldrWithKey pointsByLetter Map.empty


pointsByLetter :: a -> String -> Map Char a -> Map Char a
pointsByLetter = flip . foldr . foo

foo :: a -> Char -> Map Char a -> Map Char a
foo points char = Map.insert (toLower char) points

