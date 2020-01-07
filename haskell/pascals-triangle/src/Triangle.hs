module Triangle
  ( rows
  )
where

rows :: Int -> [[Integer]]
rows 0 = []
rows 1 = [[1]]
rows n =
  let prev = rows (n - 1)
  in  prev ++ [(map (uncurry (+)) . (window 0 . last)) prev]

window :: Eq a => a -> [a] -> [(a, a)]
window _ [] = []
window d xs = (d, head xs) : window' xs
 where
  window' (y : y' : ys) = (y, y') : window' (y' : ys)
  window' (y      : _ ) = [(y, d)]
  window' _             = []
-- >>> window 0 [1]
-- >>> window 0 [1, 1]
-- >>> window 0 [1, 2, 1]
-- [(0,1),(1,0)]
-- [(0,1),(1,1),(1,0)]
-- [(0,1),(1,2),(2,1),(1,0)]
--
