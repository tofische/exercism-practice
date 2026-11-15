module LanguageList (new, add, remove, first, count, isFunctionalList) where

new :: [String]
new = []

add :: String -> [String]  -> [String]
add x xs = x:xs

remove :: [String] -> [String]
remove (x:xs) = xs

first :: [String] -> String
first (x:xs) = x

count :: [String] -> Int
count [] = 0
count (x:xs) = 1 + count xs

isFunctionalList :: [String] -> Bool
isFunctionalList [] = False
isFunctionalList ("Haskell":_) = True
isFunctionalList (_:xs) = isFunctionalList xs
