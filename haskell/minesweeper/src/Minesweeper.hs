module Minesweeper
  ( annotate
  )
where

import           Data.List
import           Data.Char
import qualified Data.Map.Strict               as M
import           Data.Map.Strict                ( Map )
import           Data.Maybe
import           Data.Function

data Point = Point { pointY :: Int, pointX :: Int   } deriving (Show, Eq, Ord)
type Board a = Map Point a

annotate :: [String] -> [String]
annotate [""] = [""]
annotate xss  = (toList . showMineCounts . toBoard) xss

toBoard :: [[a]] -> Board a
toBoard = M.fromList . concat . enumerate
  (\y row -> enumerate (\x cell -> (Point y x, cell)) row)

toList :: (Ord a) => Board a -> [[a]]
toList = map (map snd) . groupBy ((==) `on` (pointY . fst)) . sort . M.toList

showMineCounts :: Board Char -> Board Char
showMineCounts board = M.mapWithKey (toChar . countMines) board
 where
  countMines point = (length . filter (== '*') . neighbors point) board
  toChar _ '*' = '*'
  toChar 0 _   = ' '
  toChar n _   = intToDigit n

enumerate :: (Num a, Enum a) => (a -> b -> c) -> [b] -> [c]
enumerate fn = zipWith fn [0 ..]

addPoint :: Point -> Point -> Point
(Point y1 x1) `addPoint` (Point y2 x2) = Point (y1 + y2) (x1 + x2)
-- >>> Point 1 3 `addPoint` Point 5 7
-- Point {pointY = 6, pointX = 10}
--

neighbors :: Point -> Board a -> [a]
neighbors point board = catMaybes
  [ M.lookup (point `addPoint` Point y x) board
  | x <- [-1 .. 1]
  , y <- [-1 .. 1]
  , not (x == 0 && y == 0)
  ]
-- >>> board = toBoard ["123", "456", "789"]
-- >>> neighbors (Point 0 0) board
-- >>> neighbors (Point 1 1) board
-- >>> neighbors (Point 0 0) $ toBoard ["   ", "123", "   "]
-- "425"
-- "14728369"
-- "1 2"
--

