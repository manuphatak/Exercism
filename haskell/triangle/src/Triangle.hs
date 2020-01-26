module Triangle
  ( TriangleType(..)
  , triangleType
  )
where

data TriangleType
  = Equilateral
  | Isosceles
  | Scalene
  | Illegal
  deriving (Eq, Show)

triangleType :: (Num a, Ord a) => a -> a -> a -> TriangleType
triangleType a b c | not isLegal                = Illegal
                   | a == b && b == c           = Equilateral
                   | a == b || b == c || a == c = Isosceles
                   | otherwise                  = Scalene
  where isLegal = and [a > 0, b > 0, c > 0, a + b > c, a + c > b, b + c > a]
