module SecretHandshake
  ( handshake
  )
where

handshake :: Int -> [String]
handshake = apply . transforms . binaryDigits

binaryDigits :: Integral a => a -> [a]
binaryDigits 0 = []
binaryDigits n = binaryDigits (n `quot` 2) ++ [n `rem` 2]

transforms :: (Eq a, Num a) => [a] -> [[String] -> [String]]
transforms s@[1, _, _, _, _] = reverse : transforms (tail s)
transforms s@[1, _, _, _]    = append "jump" : transforms (tail s)
transforms s@[1, _, _]       = append "close your eyes" : transforms (tail s)
transforms s@[1, _]          = append "double blink" : transforms (tail s)
transforms s@[1     ]        = append "wink" : transforms (tail s)
transforms (  _ : xs)        = transforms xs
transforms []                = [id]

append :: a -> [a] -> [a]
append value xs = xs ++ [value]

apply :: [[a] -> [a]] -> [a]
apply = foldr (\fn acc -> fn acc) []
