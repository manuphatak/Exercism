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


trim :: String -> String
trim = dropWhileEnd isSpace . dropWhile isSpace


isEmpty :: String -> Bool
isEmpty = null . trim

isQuestion :: String -> Bool
isQuestion = (== '?') . last . trim


isYelling :: String -> Bool
isYelling = (&&) <$> hasLetters <*> allUpper
 where
  hasLetters = any isLetter
  allUpper   = (==) <$> id <*> map toUpper

isYellingQuestion :: String -> Bool
isYellingQuestion = (&&) <$> isYelling <*> isQuestion
