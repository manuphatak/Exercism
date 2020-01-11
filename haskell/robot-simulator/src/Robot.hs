module Robot
  ( Bearing(East, North, South, West)
  , bearing
  , coordinates
  , mkRobot
  , move
  )
where

data Bearing = North
             | East
             | South
             | West
             deriving (Eq, Show, Enum, Bounded)

data Robot = Robot {bearing:: Bearing, coordinates :: (Integer, Integer)}

mkRobot :: Bearing -> (Integer, Integer) -> Robot
mkRobot = Robot

move :: Robot -> String -> Robot
move = foldl update where
  update (Robot b     c     ) 'R' = Robot (cycleSucc b) c
  update (Robot b     c     ) 'L' = Robot (cyclePred b) c
  update (Robot North (x, y)) 'A' = Robot North (x, y + 1)
  update (Robot South (x, y)) 'A' = Robot South (x, y - 1)
  update (Robot East  (x, y)) 'A' = Robot East (x + 1, y)
  update (Robot West  (x, y)) 'A' = Robot West (x - 1, y)
  update _                    _   = error "unknown command"

cycleSucc :: (Eq p, Bounded p, Enum p) => p -> p
cycleSucc a | a == maxBound = minBound
            | otherwise     = succ a

cyclePred :: (Eq p, Bounded p, Enum p) => p -> p
cyclePred a | a == minBound = maxBound
            | otherwise     = pred a
