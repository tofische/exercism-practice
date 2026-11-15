module KitchenCalculator (getVolume, toMilliliter, fromMilliliter, convert, Messurments (..)) where

data Messurments = Cup | FluidOnce | TableSpoon | TeaSpoon | Milliliter deriving (Eq, Show)

getVolume :: (Messurments, Double) -> Double
getVolume (_, v) = v

toMilliliter :: (Messurments, Double) -> (Messurments, Double)
toMilliliter (Cup, v) = (Milliliter, 240*v)
toMilliliter (FluidOnce, v) = (Milliliter, 30*v)
toMilliliter (TableSpoon, v) = (Milliliter, 15*v)
toMilliliter (TeaSpoon, v) = (Milliliter, 5*v)
toMilliliter (Milliliter, v) = (Milliliter, v)

fromMilliliter :: (Messurments, Double) -> Messurments -> (Messurments, Double)
fromMilliliter (Milliliter, v) Cup = (Cup, v / 240)
fromMilliliter (Milliliter, v) FluidOnce = (FluidOnce, v / 30)
fromMilliliter (Milliliter, v) TableSpoon = (TableSpoon, v / 15)
fromMilliliter (Milliliter, v) TeaSpoon = (TeaSpoon, v / 5)
fromMilliliter (Milliliter, v) Milliliter = (Milliliter, v)
fromMilliliter (_, v) m = (m, 0)

convert :: (Messurments, Double) -> Messurments -> (Messurments, Double)
convert (m, v) m' = fromMilliliter (toMilliliter (m, v)) m'
