module DNA
  ( toRNA
  )
where

toRNA :: String -> Either Char String
toRNA = mapM dnaComplement

dnaComplement :: Char -> Either Char Char
dnaComplement 'G' = Right 'C'
dnaComplement 'C' = Right 'G'
dnaComplement 'T' = Right 'A'
dnaComplement 'A' = Right 'U'
dnaComplement c   = Left c
