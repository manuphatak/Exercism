module Luhn
  ( isValid
  )
where

import           Data.Char

isValid :: String -> Bool
isValid = isLuhn . map digitToInt . filter isDigit

isFactorOf10 :: Integral a => a -> Bool
isFactorOf10 n = n `rem` 10 == 0

isLuhn :: Integral a => [a] -> Bool
isLuhn []  = False
isLuhn [_] = False
isLuhn xs  = (isFactorOf10 . sum . checkDigits) xs
  where checkDigits = mapEvenR checkDigit

checkDigit :: Integral a => a -> a
checkDigit n | n >= 0 && n < 5 = 2 * n
             | n <= 9          = 2 * n - 9
             | otherwise       = error "This should never happen"

-- >>> mapEvenR (const 1) $ replicate 6 0
-- [1,0,1,0,1,0]
--
-- >>> mapEvenR (const 1) $ replicate 7 0
-- [0,1,0,1,0,1,0]
--

mapEvenR :: (a -> a) -> [a] -> [a]
mapEvenR _ []  = []
mapEvenR _ [x] = [x]
mapEvenR fn2 (x : x' : xs) | odd (length xs) = x : fn2 x' : mapEvenR fn2 xs
                           | otherwise       = fn2 x : x' : mapEvenR fn2 xs
