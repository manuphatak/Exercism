module Triangle
  ( TriangleType(..)
  , triangleType
  )
where

data TriangleType = Equilateral
                  | Isosceles
                  | Scalene
                  | Illegal
                  deriving (Eq, Show)

triangleType :: (Num a, Ord a) => a -> a -> a -> TriangleType
triangleType a b c | not $ isLegal a b c        = Illegal
                   | a == b && b == c           = Equilateral
                   | a == b || b == c || a == c = Isosceles
                   | otherwise                  = Scalene

isLegal :: (Num a, Ord a) => a -> a -> a -> Bool
isLegal a b c = hasSides && hasTriangleInequality
 where
  hasSides              = a > 0 && b > 0 && c > 0
  hasTriangleInequality = a + b > c && a + c > b && b + c > a
