module Clock
  ( addDelta
  , fromHourMin
  , toString
  )
where

import           Text.Printf
import           Data.Function

data Clock = Clock Int Int deriving (Eq)

fromHourMin :: Int -> Int -> Clock
fromHourMin h m =
  let m' = rollover (0, m) 60
      h' = rollover (0, fst m' + h) 24
  in  (Clock `on` snd) h' m'

toString :: Clock -> String
toString (Clock h m) = printf "%02d:%02d" h m

addDelta :: Int -> Int -> Clock -> Clock
addDelta h m (Clock h' m') = fromHourMin (h + h') (m + m')

-- >>> rollover (0, -1) 60
-- (-1,59)
--
-- >>> rollover (0, 61) 60
-- (1,1)
--
-- >>> rollover (0, 24) 24
-- (1,0)
--

rollover :: (Ord a, Num a) => (a, a) -> a -> (a, a)
rollover (y, x) constraint
  | x < 0           = rollover (y - 1, x + constraint) constraint
  | x >= constraint = rollover (y + 1, x - constraint) constraint
  | otherwise       = (y, x)
