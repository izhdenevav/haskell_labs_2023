solveQuadratic :: Float -> Float -> Float -> (Float, Float)

solveQuadratic a b c = do
      let d = b * b - 4 * a * c
      if (d < 0) then error"negative d" 
      else if (d == 0) then ((-(b))/(2 * a), (-(b))/(2 * a))
      else ((-(b) - sqrt(b * b - 4 * a * c))/ (2 * a), (-(b) + sqrt(b * b - 4 * a * c))/(2 * a))
