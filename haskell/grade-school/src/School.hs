module School
  ( School
  , add
  , empty
  , grade
  , sorted
  )
where

import           Data.List                      ( sort
                                                , groupBy
                                                )
import           Data.Function                  ( on )
import           Data.Maybe                     ( fromMaybe )

type Enrollment = (Int, String)
type School = [Enrollment]

add :: Int -> String -> School -> School
add gradeNum name school = (gradeNum, name) : school

empty :: School
empty = []

grade :: Int -> School -> [String]
grade gradeNum = fromMaybe [] . lookup gradeNum . sorted

sorted :: School -> [(Int, [String])]
sorted =
  map (\s@(x : _) -> (fst x, map snd s)) . groupBy ((==) `on` fst) . sort
