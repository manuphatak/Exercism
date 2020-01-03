module School
  ( School
  , add
  , empty
  , grade
  , sorted
  )
where

import           Data.List
import           Data.Function
import           Data.Maybe

data School = Enrollment Int String School | EmptySchool

add :: Int -> String -> School -> School
add = Enrollment

empty :: School
empty = EmptySchool

grade :: Int -> School -> [String]
grade gradeNum = fromMaybe [] . lookup gradeNum . sorted

sorted :: School -> [(Int, [String])]
sorted = groupOn ((==) `on` fst) . sort . toList

toList :: School -> [(Int, String)]
toList (Enrollment gradeNum name school) = (gradeNum, name) : toList school
toList EmptySchool                       = []

-- >>> groupOn ((==) `on` fst) $ sort [(2, "a"), (2, "b"), (3, "c")]
-- [(2,["a","b"]),(3,["c"])]
--
groupOn :: ((a, b) -> (a, b) -> Bool) -> [(a, b)] -> [(a, [b])]
groupOn fn = map collectGroups . groupBy fn
 where
  collectGroups s@(x : _) = (fst x, map snd s)
  collectGroups []        = error "this should never happen"
