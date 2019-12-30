module Anagram
  ( anagramsFor
  )
where

import           Data.List
import           Data.Char

anagramsFor :: String -> [String] -> [String]
anagramsFor xs = filter $ isAnagram xs

isAnagram :: String -> String -> Bool
isAnagram xs ys | all (uncurry matchLower) $ zip xs ys = False
                | otherwise                            = isAnagram' xs ys

isAnagram' :: String -> String -> Bool
isAnagram' "" "" = True
isAnagram' "" _  = False
isAnagram' _  "" = False

isAnagram' subject (x : xs) =
  let next = deleteBy matchLower x subject
  in  if next == subject then isAnagram' subject "" else isAnagram' next xs


matchLower :: Char -> Char -> Bool
matchLower a b = toLower a == toLower b

