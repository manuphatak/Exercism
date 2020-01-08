module Triangle
  ( rows
  )
where

rows :: Int -> [[Integer]]
rows = flip take pascal

pascal :: [[Integer]]
pascal = [1] : map nextRow pascal

nextRow :: [Integer] -> [Integer]
nextRow = windowWith (+) 0
-- >>> nextRow [1]
-- >>> nextRow [1,1]
-- [1,1]
-- [1,2,1]
--


windowWith :: Eq a => (a -> a -> b) -> a -> [a] -> [b]
windowWith fn d xs = zipWith fn (d : xs) (xs ++ [d])

-- >>> windowWith (,) 0 [1]
-- >>> windowWith (,) 0 [1, 1]
-- >>> windowWith (,) 0 [1, 2, 1]
-- [(0,1),(1,0)]
-- [(0,1),(1,1),(1,0)]
-- [(0,1),(1,2),(2,1),(1,0)]
--
