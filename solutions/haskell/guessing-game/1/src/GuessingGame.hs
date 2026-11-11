module GuessingGame (reply) where

reply :: Int -> String
reply guess =
  if guess == 42 then "Correct"
  else if guess == 41 || guess == 43 then "So close"
  else if guess < 41 then "Too low"
  else if guess > 43 then "Too high"
  else "Should not happen ..."
