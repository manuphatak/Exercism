module RunLength
  ( decode
  , encode
  )
where

import           Data.List                      ( group )
import           Data.Char                      ( isNumber )

decode :: String -> String
decode [] = []
decode xs = replicate n c ++ decode cs where
  (ns, c : cs) = span isNumber xs
  n            = if null ns then 1 else read ns

encode :: String -> String
encode = concatMap ((++) <$> showNumber . length <*> take 1) . group where
  showNumber 1 = ""
  showNumber n = show n
