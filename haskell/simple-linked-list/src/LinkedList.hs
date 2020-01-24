module LinkedList
  ( LinkedList
  , datum
  , fromList
  , isNil
  , new
  , next
  , nil
  , reverseLinkedList
  , toList
  )
where

data LinkedList a
    = Node a (LinkedList a)
    | Empty deriving (Eq, Show)


datum :: LinkedList a -> a
datum (Node a _) = a
datum Empty      = error "empty LinkedList"

fromList :: [a] -> LinkedList a
fromList = foldr new nil

isNil :: LinkedList a -> Bool
isNil Empty      = True
isNil (Node _ _) = False

new :: a -> LinkedList a -> LinkedList a
new = Node

next :: LinkedList a -> LinkedList a
next (Node _ xs) = xs
next Empty       = error "empty LinkedList"

nil :: LinkedList a
nil = Empty

reverseLinkedList :: LinkedList a -> LinkedList a
reverseLinkedList ys = rev ys nil where
  rev Empty       a = a
  rev (Node x xs) a = rev xs (new x a)


toList :: LinkedList a -> [a]
toList (Node x xs) = x : toList xs
toList Empty       = []
