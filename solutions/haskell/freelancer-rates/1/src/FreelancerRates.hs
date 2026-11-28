module FreelancerRates (dailyRate, applyDiscount, monthlyRate, daysInBudget) where

dailyRate :: Double -> Double 
dailyRate h = 8 * h

applyDiscount :: Double -> Double -> Double 
applyDiscount p d = p * (1 - d / 100)

monthlyRate :: Double -> Double -> Int
monthlyRate h d = ceiling $ applyDiscount (22 * dailyRate h) d

daysInBudget :: Int -> Double -> Double -> Double
daysInBudget b h d = fromIntegral (floor (fromIntegral b / applyDiscount (dailyRate h) d * 10)) / 10
