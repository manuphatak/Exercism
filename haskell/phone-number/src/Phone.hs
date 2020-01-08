module Phone
  ( number
  )
where

import           Data.Char

number :: String -> Maybe String
number xs = case ((,) <$> length <*> id) . filter isDigit $ xs of
  (10, ys      ) -> digits ys
  (11, '1' : ys) -> digits ys
  _              -> Nothing

digits :: String -> Maybe String
digits xs = case splitAt 3 xs of
  (_      , '0' : _) -> Nothing
  (_      , '1' : _) -> Nothing
  ('0' : _, _      ) -> Nothing
  ('1' : _, _      ) -> Nothing
  _                  -> Just xs
