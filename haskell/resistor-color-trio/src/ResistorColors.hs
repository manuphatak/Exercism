module ResistorColors
  ( Color(..)
  , Resistor(..)
  , label
  , ohms
  )
where


data Color =
    Black
  | Brown
  | Red
  | Orange
  | Yellow
  | Green
  | Blue
  | Violet
  | Grey
  | White
  deriving (Show, Enum, Bounded)

newtype Resistor = Resistor { bands :: (Color, Color, Color) }
  deriving Show

label :: Resistor -> String
label resistor = show display ++ " " ++ unit
 where
  (display, unit) = case ohms resistor of
    n | n == 0                  -> (n, "ohms")
    n | n `rem` 1000000000 == 0 -> (n `div` 1000000000, "gigaohms")
    n | n `rem` 1000000 == 0    -> (n `div` 1000000, "megaohms")
    n | n `rem` 1000 == 0       -> (n `div` 1000, "kiloohms")
    n                           -> (n, "ohms")


ohms :: Resistor -> Int
ohms (Resistor (a, b, c)) = (fromEnum a * 10 + fromEnum b) * 10 ^ fromEnum c
