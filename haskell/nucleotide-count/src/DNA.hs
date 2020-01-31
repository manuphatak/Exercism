{-# LANGUAGE TupleSections #-}

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

data Nucleotide = A | C | G | T deriving (Eq, Ord, Read, Enum, Bounded, Show)

nucleotideCounts :: String -> Either String (Map Nucleotide Integer)
nucleotideCounts = foldM nucleotideHit initialCounts
 where
  nucleotideHit counts char = flip (adjust succ) counts <$> readNucleotide char

readNucleotide :: (Read a) => Char -> Either String a
readNucleotide = readEither . (: [])

initialCounts :: (Ord a, Enum a, Bounded a) => Map a Integer
initialCounts = fromList $ map (, 0) [minBound .. maxBound]
-- >>> initialCounts :: Map Nucleotide Integer
-- fromList [(A,0),(C,0),(G,0),(T,0)]
--
