module FlowerField (annotate) where
import Data.Char (digitToInt, intToDigit)

annotate :: [String] -> [String]
annotate [] = []
annotate [[]] = [[]]
annotate board = foldr combine board [w, e, n, s, nw, ne, sw, se]
    where
        w = moveWest board
        e = moveEast board
        n = moveNorth board
        s = moveSouth board
        nw = moveNorth $ moveWest board
        ne = moveNorth $ moveEast board
        sw = moveSouth $ moveWest board
        se = moveSouth $ moveEast board

combine :: [String] -> [String] -> [String]
combine = zipWith (zipWith comb)
    where
        comb   _ '*' = '*'
        comb ' '   x = x
        comb   _ ' ' = '1'
        comb   _   x = intToDigit (1 + digitToInt x)

moveWest :: [String] -> [String]
moveWest board = map ((++ [' ']).tail) board

moveEast :: [String] -> [String]
moveEast board = map (init.(' ':)) board

moveNorth :: [String] -> [String]
moveNorth board = tail board ++ [emptyRow board]

moveSouth :: [String] -> [String]
moveSouth board = emptyRow board : init board

emptyRow :: [String] -> [Char]
emptyRow board = replicate len ' '
    where
        len = length $ head board
