module DNA
  ( nucleotideCounts
  , Nucleotide(..)
  )
where

import           Data.Map.Strict                ( Map
                                                , adjust
                                                , fromList
                                                )
import           Text.Read                      ( readEither )
import           Control.Monad                  ( foldM )

data Nucleotide = A | C | G | T deriving (Eq, Ord, Read, Show)

nucleotideCounts :: String -> Either String (Map Nucleotide Integer)
nucleotideCounts = foldM nucleotideHit initialCounts
 where
  nucleotideHit counts char = flip (adjust succ) counts <$> readNucleotide char

readNucleotide :: Char -> Either String Nucleotide
readNucleotide c = readEither [c]

initialCounts :: Map Nucleotide Integer
initialCounts = fromList [(A, 0), (C, 0), (G, 0), (T, 0)]
