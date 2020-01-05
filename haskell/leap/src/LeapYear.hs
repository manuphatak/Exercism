module LeapYear
  ( isLeapYear
  )
where

isLeapYear :: Integer -> Bool
isLeapYear year | year `hasFactor` 400 = True
                | year `hasFactor` 100 = False
                | year `hasFactor` 4   = True
                | otherwise            = False


hasFactor :: (Integral a) => a -> a -> Bool
hasFactor x y = x `rem` y == 0
