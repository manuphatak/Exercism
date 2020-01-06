module Diamond
  ( diamond
  )
where

import           Data.Char

diamond :: Char -> Maybe [String]
diamond letter
  | (&&) <$> isUpper <*> isLetter $ letter
  = Just . (mirror . map mirror) . toQuarter $ ['A' .. letter]
  | otherwise
  = Nothing

-- >>> putStr $ unlines . toQuarter $ ['A' .. 'D']
--    D
--   C
--  B
-- A
--

toQuarter :: String -> [String]
toQuarter = zipWith3 line [0 ..] <$> reverse <*> (repeat . length)

-- >>> line 0 'D' 4
-- >>> line 1 'C' 4
-- >>> line 2 'B' 4
-- >>> line 3 'A' 4
-- "   D"
-- "  C "
-- " B  "
-- "A   "
--

line :: Int -> Char -> Int -> String
line i c size = padLeft ++ [c] ++ padRight
 where
  padLeft  = replicate (size - 1 - i) ' '
  padRight = replicate i ' '

-- >>> mirror [1..4]
-- [4,3,2,1,2,3,4]
--

mirror :: [a] -> [a]
mirror []         = []
mirror s@(_ : xs) = reverse xs ++ s
