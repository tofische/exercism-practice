module PacmanRules (eatsGhost, scores, loses, wins) where


eatsGhost :: Bool -> Bool -> Bool
eatsGhost pp ghost = pp && ghost

scores :: Bool -> Bool -> Bool
scores pp dot = pp || dot

loses :: Bool -> Bool -> Bool
loses pp ghost = (not pp) && ghost

wins :: Bool -> Bool -> Bool -> Bool
wins allDots pp ghost = allDots && (not (loses pp ghost))
