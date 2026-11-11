module ValentinesDay where

-- Define the function and required algebraic data types (ADT) below.

data Approval = Yes | No | Maybe

data Cuisine = Korean | Turkish deriving Eq

data Genre = Crime | Horror | Romance | Thriller deriving Eq

data Activity = BoardGame | Chill | Movie Genre | Restaurant Cuisine | Walk Int

rateActivity :: Activity -> Approval
rateActivity BoardGame = No
rateActivity Chill = No
rateActivity (Movie m) = if m == Romance then Yes else No
rateActivity (Restaurant c) = if c == Korean then Yes else Maybe
rateActivity (Walk d) = if d < 3 then Yes else if d > 5 then No else Maybe
