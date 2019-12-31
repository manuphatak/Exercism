module CryptoSquare
  ( encode
  )
where

import           Data.Char                      ( toLower
                                                , isAlphaNum
                                                )
import           Data.List                      ( transpose )

import           Data.Function

encode :: String -> String
encode = reorder . map toLower . filter isAlphaNum
 where
  reorder xs = unwords $ transpose $ (chunksOf $ boxsize $ length xs) ' ' xs


-- >>> boxsize 54
-- 8
--
-- >>> boxsize 8
-- 3
--
-- >>> boxsize 9
-- 3
--

boxsize :: Integral b => b -> b
boxsize n = fst $ box (1, n)
 where
  box (col, row)
    | col <= 0 || row <= 0
    = error "This should never happen"
    | col >= row && col - row <= 1
    = (col, row)
    | otherwise
    = let ceiling' = (ceiling :: Integral b => Double -> b)
          (//)     = (/) `on` fromIntegral
          col'     = col + 1
          row'     = ceiling' $ n // col'
      in  box (col', row')

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
