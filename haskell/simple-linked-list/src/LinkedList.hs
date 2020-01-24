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
  = Empty
  | Node { datum :: a, next :: LinkedList a }
    deriving (Eq, Show)


instance Foldable LinkedList where
  foldr _  z Empty         = z
  foldr fn z (Node a node) = fn a (foldr fn z node)

fromList :: [a] -> LinkedList a
fromList = foldr new nil

isNil :: LinkedList a -> Bool
isNil Empty = True
isNil _     = False

new :: a -> LinkedList a -> LinkedList a
new = Node

nil :: LinkedList a
nil = Empty

reverseLinkedList :: LinkedList a -> LinkedList a
reverseLinkedList = foldl (flip new) nil

toList :: LinkedList a -> [a]
toList = foldr (:) []
