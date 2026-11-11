module LuciansLusciousLasagna (elapsedTimeInMinutes, expectedMinutesInOven, preparationTimeInMinutes) where

expectedMinutesInOven :: Integer
expectedMinutesInOven = 40

preparationTimeInMinutes :: Integer -> Integer
preparationTimeInMinutes layers = 2 * layers

elapsedTimeInMinutes :: Integer -> Integer -> Integer
elapsedTimeInMinutes layers minutes = preparationTimeInMinutes layers + minutes
