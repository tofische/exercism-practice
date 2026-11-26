module Pronounce (inEnglish) where
import Data.List (unfoldr)

inEnglish :: Integer -> Maybe String
inEnglish n
    | n < 0     = Nothing
    | n == 0    = Just "zero"
    | otherwise = Just inEnglish'
    where
        inEnglish' = unwords $ words $ concat $ reverse $ zipWith (+++) groups suffixes
        groups = map group3ToString $ unfoldr makeGroup n
        (+++) a b = if null a then a else a ++ b -- Don't include suffix for empty part
        makeGroup x = if x == 0 then Nothing else let (d, m) = x `divMod` 1000 in Just (m, d)

group3ToString :: Integer -> String
group3ToString num
    | num < 100 = group2ToString num
    | otherwise = hundredsString ++ group2ToString rest
    where
        (hundreds, rest) = num `divMod` 100
        hundredsString = onesToString hundreds ++ " hundred "

group2ToString :: Integer -> String
group2ToString num
    | num < 20  = onesToString num
    | otherwise = tensString ++ sep ++ onesString
    where
        (tens, ones) = num `divMod` 10
        tensString = tensToString tens
        onesString = onesToString ones
        sep = if null onesString then "" else "-"

onesToString :: Integer -> String
onesToString x = [
        "",    "one",    "two",    "three",    "four",     "five",    "six",     "seven",     "eight",    "nine",
        "ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"
    ] !! fromIntegral x

tensToString :: Integer -> String
tensToString x = [
        "", "", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"
    ] !! fromIntegral x

suffixes :: [String]
suffixes = ["", " thousand ", " million ", " billion "]
