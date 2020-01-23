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
label (Resistor (a, b, c)) =
  show (coefficient a b * 10 ^ e `div` 10) ++ " " ++ prefix ++ "ohms"
 where
  e = case fromEnum c `mod` 3 of
    0  -> 1
    1  -> 2
    2  -> 0
    e' -> e'
  prefix = case (fromEnum c + 1) `div` 3 of
    1 -> "kilo"
    2 -> "mega"
    3 -> "giga"
    _ -> ""

ohms :: Resistor -> Int
ohms (Resistor (a, b, c)) = coefficient a b * 10 ^ fromEnum c

coefficient :: (Enum a, Enum b) => a -> b -> Int
coefficient a b = fromEnum a * 10 + fromEnum b
