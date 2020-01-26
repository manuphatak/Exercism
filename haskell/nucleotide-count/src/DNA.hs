module DNA
  ( nucleotideCounts
  , Nucleotide(..)
  )
where

import           Data.Map.Strict                ( Map
                                                , fromList
                                                , insertWith
                                                )

import           Data.List

data Nucleotide = A | C | G | T deriving (Eq, Ord, Show)

nucleotideCounts :: String -> Either String (Map Nucleotide Int)
nucleotideCounts input =
  nucleotideCountsMap <$> (groupCounts . group . sort) input


nucleotideCountsMap :: [(Nucleotide, Int)] -> Map Nucleotide Int
nucleotideCountsMap =
  insertWith (+) T 0
    . insertWith (+) G 0
    . insertWith (+) C 0
    . insertWith (+) A 0
    . fromList

groupCounts :: [String] -> Either String [(Nucleotide, Int)]
groupCounts = mapM $ unwrap . ((,) <$> readNucleotide . head <*> length)

readNucleotide :: Char -> Either String Nucleotide
readNucleotide 'A' = Right A
readNucleotide 'C' = Right C
readNucleotide 'G' = Right G
readNucleotide 'T' = Right T
readNucleotide c   = Left (c : " is unknown")

unwrap :: (Either l r, b) -> Either l (r, b)
unwrap (Right r, b) = Right (r, b)
unwrap (Left  l, _) = Left l
