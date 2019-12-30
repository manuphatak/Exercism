module CryptoSquare
  ( encode
  )
where

import           Data.Char
import           Data.List

encode :: String -> String
encode = reorder . map toLower . filter isAlphaNum
 where
  reorder xs = unwords $ transpose $ (chunksOf $ fst $ box $ length xs) ' ' xs


-- >>> box 54
-- (8,7)
--
-- >>> box 8
-- (3,3)
--
-- >>> box 9
-- (3,3)
--

box :: Integral b => b -> (b, b)
box n = box' (1, n)
 where
  box' (c, r) | c <= 0 || r <= 0     = error "This should never happen"
              | c >= r && c - r <= 1 = (c, r)
              | otherwise            = box' (c + 1, n `divPlus` (c + 1))



-- >>> divPlus 10 3
-- 4
--

divPlus :: Integral a => a -> a -> a
divPlus a b | a `rem` b > 0 = a `div` b + 1
            | otherwise     = a `div` b



-- >>> chunksOf 3 ' ' "thisisfun"
-- ["thi","sis","fun"]
--
-- >>> chunksOf 3 ' ' "thisisfu"
-- ["thi","sis","fu "]
--

chunksOf :: Int -> a -> [a] -> [[a]]
chunksOf _ _ [] = []
chunksOf n fill xs =
  let (ys, zs) = splitAt n xs
      ys'      = ys ++ replicate (n - length ys) fill
  in  ys' : chunksOf n fill zs

