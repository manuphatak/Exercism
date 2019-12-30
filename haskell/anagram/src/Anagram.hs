module Anagram
  ( anagramsFor
  )
where

import           Data.List
import           Data.Char
import           Data.Function

anagramsFor :: String -> [String] -> [String]
anagramsFor xs = filter $ isAnagram xs

isAnagram :: String -> String -> Bool
isAnagram = both ((==) `on` sort . map toLower) ((/=) `on` map toLower)

both :: (a -> b -> Bool) -> (a -> b -> Bool) -> a -> b -> Bool
both fn1 fn2 xs ys = fn1 xs ys && fn2 xs ys
