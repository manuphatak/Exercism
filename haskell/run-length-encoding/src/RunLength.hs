module RunLength
  ( decode
  , encode
  )
where

import           Data.List
import           Data.Char
import           Data.Function

decode :: String -> String
decode = concatMap expandToken . toToken . groupBy ((&&) `on` isNumber)

encode :: String -> String
encode = concatMap ((++) <$> showNumber . length <*> take 1) . group

showNumber :: (Eq a, Num a, Show a) => a -> String
showNumber 1 = ""
showNumber n = show n


newtype Token = Token (Int, Char) deriving (Show)

toToken :: [String] -> [Token]
toToken (xs : xs' : xss)
  | isDigit (head xs) = Token (read xs, head xs') : toToken xss
  | otherwise         = Token (1, head xs) : toToken (xs' : xss)
toToken [xs] = [Token (1, head xs)]
toToken []   = []

expandToken :: Token -> String
expandToken (Token (n, c)) = replicate n c
