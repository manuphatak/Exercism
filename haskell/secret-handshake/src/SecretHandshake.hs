module SecretHandshake
  ( handshake
  )
where

import           Data.Bits

handshake :: Int -> [String]
handshake = apply . transforms

apply :: [[a] -> [a]] -> [a]
apply = foldr (\fn acc -> fn acc) []

transforms :: Int -> [[String] -> [String]]
transforms n = [ t | (b, t) <- actions, n `testBit` b ] where
  actions =
    [ (4, reverse)
    , (0, (:) "wink")
    , (1, (:) "double blink")
    , (2, (:) "close your eyes")
    , (3, (:) "jump")
    ]


