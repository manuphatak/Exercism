module TwelveDays
  ( recite
  )
where

import           Text.Printf

recite :: Int -> Int -> [String]
recite start stop = [ line day | day <- [start .. stop] ]

line :: Int -> String
line day = printf "On the %s day of Christmas my true love gave to me: %s."
                  (nth day)
                  (summaryOfGifts day)

summaryOfGifts :: Int -> String
summaryOfGifts day = (toSentence . reverse . take day)
  [ "a Partridge in a Pear Tree"
  , "two Turtle Doves"
  , "three French Hens"
  , "four Calling Birds"
  , "five Gold Rings"
  , "six Geese-a-Laying"
  , "seven Swans-a-Swimming"
  , "eight Maids-a-Milking"
  , "nine Ladies Dancing"
  , "ten Lords-a-Leaping"
  , "eleven Pipers Piping"
  , "twelve Drummers Drumming"
  ]

nth :: Int -> String
nth day =
  [ "first"
    , "second"
    , "third"
    , "fourth"
    , "fifth"
    , "sixth"
    , "seventh"
    , "eighth"
    , "ninth"
    , "tenth"
    , "eleventh"
    , "twelfth"
    ]
    !! pred day

toSentence :: [String] -> String
toSentence []  = []
toSentence [x] = x
toSentence (x : xs) | length xs == 1 = x ++ ", and " ++ toSentence xs
                    | otherwise      = x ++ ", " ++ toSentence xs
-- >>> toSentence ["a", "b", "c"]
-- "a, b, and c"
--
