module BST
  ( BST
  , bstLeft
  , bstRight
  , bstValue
  , empty
  , fromList
  , insert
  , singleton
  , toList
  )
where

data BST a = Node a (BST a) (BST a) | EmptyTree deriving (Eq, Show)

bstLeft :: BST a -> Maybe (BST a)
bstLeft (Node _ x _) = Just x
bstLeft EmptyTree    = Nothing

bstRight :: BST a -> Maybe (BST a)
bstRight (Node _ _ x) = Just x
bstRight EmptyTree    = Nothing

bstValue :: BST a -> Maybe a
bstValue (Node x _ _) = Just x
bstValue EmptyTree    = Nothing

empty :: BST a
empty = EmptyTree

fromList :: Ord a => [a] -> BST a
fromList = foldl (flip insert) empty

insert :: Ord a => a -> BST a -> BST a
insert x EmptyTree = singleton x
insert x (Node y left right) | x <= y    = Node y (insert x left) right
                             | otherwise = Node y left (insert x right)

singleton :: a -> BST a
singleton x = Node x empty empty

toList :: BST a -> [a]
toList EmptyTree           = []
toList (Node x left right) = toList left ++ [x] ++ toList right
