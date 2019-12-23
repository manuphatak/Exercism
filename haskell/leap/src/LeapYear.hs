module LeapYear
  ( isLeapYear
  )
where

isLeapYear :: Integer -> Bool
isLeapYear year | year `isFactor` 400 = True
                | year `isFactor` 100 = False
                | year `isFactor` 4   = True
                | otherwise           = False


isFactor :: (Integral a) => a -> a -> Bool
isFactor x y = x `mod` y == 0
