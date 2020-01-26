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
foldl' f z (x : xs) = acc `seq` foldl' f acc xs where acc = f z x

foldr :: (a -> b -> b) -> b -> [a] -> b
foldr fn z []       = z
foldr fn z (x : xs) = fn x (foldr fn z xs)

length :: [a] -> Int
length = foldr (\_ count -> succ count) 0

reverse :: [a] -> [a]
reverse = foldl (flip (:)) []

map :: (a -> b) -> [a] -> [b]
map fn = foldr ((:) . fn) []

filter :: (a -> Bool) -> [a] -> [a]
filter p = foldr (\x xs -> if p x then x : xs else xs) []

(++) :: [a] -> [a] -> [a]
xs ++ ys = foldr (:) ys xs

concat :: [[a]] -> [a]
concat = foldr (++) []
