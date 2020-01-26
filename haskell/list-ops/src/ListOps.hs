  module ListOps
  ( length
  , reverse
  , map
  , filter
  , foldr
  , foldl'
  , (++)
  , concat
  )
where

import           Prelude                 hiding ( length
                                                , reverse
                                                , map
                                                , filter
                                                , foldr
                                                , (++)
                                                , concat
                                                )

foldl' :: (b -> a -> b) -> b -> [a] -> b
foldl' _ z []       = z
foldl' f z (x : xs) = foldl' f (f z x) xs

foldr :: (a -> b -> b) -> b -> [a] -> b
foldr fn z []       = z
foldr fn z (x : xs) = fn x (foldr fn z xs)

length :: [a] -> Int
length []       = 0
length (_ : xs) = 1 + length xs

reverse :: [a] -> [a]
reverse = foldl (flip (:)) []


map :: (a -> b) -> [a] -> [b]
map f []       = []
map f (x : xs) = f x : map f xs

filter :: (a -> Bool) -> [a] -> [a]
filter _ []       = []
filter p (x : xs) = if p x then x : filter p xs else filter p xs

(++) :: [a] -> [a] -> [a]
xs ++ ys = foldr (:) ys xs

concat :: [[a]] -> [a]
concat = foldr (++) []
