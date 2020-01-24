module Bob
  ( responseFor
  )
where

import           Data.Char
import           Data.List

responseFor :: String -> String
responseFor input
  | isEmpty input           = "Fine. Be that way!"
  | isYellingQuestion input = "Calm down, I know what I'm doing!"
  | isYelling input         = "Whoa, chill out!"
  | isQuestion input        = "Sure."
  | otherwise               = "Whatever."


trimEnd :: String -> String
trimEnd = dropWhileEnd isSpace


isEmpty :: String -> Bool
isEmpty = null . trimEnd

isQuestion :: String -> Bool
isQuestion = isSuffixOf "?" . trimEnd


isYelling :: String -> Bool
isYelling = (&&) <$> hasLetters <*> allUpper
 where
  hasLetters = any isLetter
  allUpper   = not . any isLower

isYellingQuestion :: String -> Bool
isYellingQuestion = (&&) <$> isYelling <*> isQuestion
