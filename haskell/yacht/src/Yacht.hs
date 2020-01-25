module Yacht
  ( yacht
  , Category(..)
  )
where

import           Data.List

data Category = Ones
              | Twos
              | Threes
              | Fours
              | Fives
              | Sixes
              | FullHouse
              | FourOfAKind
              | LittleStraight
              | BigStraight
              | Choice
              | Yacht

type DiceRolls = [Int]

yacht :: Category -> DiceRolls -> Int
yacht Yacht dice | isYacht dice             = 50
yacht Ones   dice                           = scoreNs 1 dice
yacht Twos   dice                           = scoreNs 2 dice
yacht Threes dice                           = scoreNs 3 dice
yacht Fours  dice                           = scoreNs 4 dice
yacht Fives  dice                           = scoreNs 5 dice
yacht Sixes  dice                           = scoreNs 6 dice
yacht FullHouse dice | isFullHouse dice     = sum dice
yacht FourOfAKind dice                      = scoreFourOfAKind dice
yacht LittleStraight dice | isLittleStraight dice = 30
yacht BigStraight dice | isBigStraight dice = 30
yacht Choice dice                           = sum dice
yacht _      _                              = 0

isYacht :: DiceRolls -> Bool
isYacht = and . (zipWith (==) <$> id <*> tail)

isFullHouse :: DiceRolls -> Bool
isFullHouse = (== [2, 3]) . sort . map length . group . sort

isLittleStraight :: DiceRolls -> Bool
isLittleStraight = (== [1 .. 5]) . sort

isBigStraight :: DiceRolls -> Bool
isBigStraight = (== [2 .. 6]) . sort

scoreNs :: Int -> DiceRolls -> Int
scoreNs n = (* n) . length . filter (n ==)

scoreFourOfAKind :: DiceRolls -> Int
scoreFourOfAKind dice = case filter ((>= 4) . length) . group . sort $ dice of
  [n : _] -> n * 4
  _       -> 0
