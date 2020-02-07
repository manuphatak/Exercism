module Matrix
  ( Matrix
  , cols
  , column
  , flatten
  , fromList
  , fromString
  , reshape
  , row
  , rows
  , shape
  , transpose
  )
where

import           Data.Vector                    ( Vector
                                                , (!)
                                                )
import qualified Data.Vector                   as V

type Matrix a = Vector (Vector a)

cols :: Matrix a -> Int
cols matrix | null matrix = 0
            | otherwise   = length (V.head matrix)

column :: Int -> Matrix a -> Vector a
column x = V.map (\v -> v ! pred x)

flatten :: Matrix a -> Vector a
flatten = V.foldr1 (V.++)

fromList :: [[a]] -> Matrix a
fromList = V.fromList . map V.fromList

fromString :: Read a => String -> Matrix a
fromString = fromList . map (map read . words) . lines

reshape :: (Int, Int) -> Matrix a -> Matrix a
reshape (y, x) = V.take y . chunksOf x . flatten

row :: Int -> Matrix a -> Vector a
row x matrix = matrix ! pred x

rows :: Matrix a -> Int
rows = length

shape :: Matrix a -> (Int, Int)
shape = (,) <$> rows <*> cols

transpose :: Matrix a -> Matrix a
transpose matrix = V.unfoldr nextRow 0 where
  nextRow i | i >= cols matrix = Nothing
            | otherwise        = Just (V.map (! i) matrix, succ i)

chunksOf :: Int -> Vector a -> Matrix a
chunksOf n xs | null xs   = V.empty
              | otherwise = ys `V.cons` chunksOf n zs
  where (ys, zs) = V.splitAt n xs

