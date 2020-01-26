module ProteinTranslation
  ( proteins
  )
where


proteins :: String -> Maybe [String]
proteins = Just . takeWhile ("STOP" /=) . map protein . codons


codons :: String -> [String]
codons = chunksOf 3

protein :: String -> String
protein "AUG" = "Methionine"
protein "UUU" = "Phenylalanine"
protein "UUC" = "Phenylalanine"
protein "UUA" = "Leucine"
protein "UUG" = "Leucine"
protein "UCU" = "Serine"
protein "UCC" = "Serine"
protein "UCA" = "Serine"
protein "UCG" = "Serine"
protein "UAU" = "Tyrosine"
protein "UAC" = "Tyrosine"
protein "UGU" = "Cysteine"
protein "UGC" = "Cysteine"
protein "UGG" = "Tryptophan"
protein "UAA" = "STOP"
protein "UAG" = "STOP"
protein "UGA" = "STOP"
protein _     = error "unknown protein"


-- https://codereview.stackexchange.com/questions/48552/split-list-into-groups-of-n-in-haskell
chunksOf :: Int -> [a] -> [[a]]
chunksOf _ [] = []
chunksOf n xs = ys : chunksOf n zs where (ys, zs) = splitAt n xs
