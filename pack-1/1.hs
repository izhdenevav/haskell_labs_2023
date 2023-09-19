solveQuadratic :: Float -> Float -> Float -> (Float, Float) 

solveQuadratic a b c = if (b * b - 4 * a * c < 0) then error"negative d" else ((-(b) - sqrt(b * b - 4 * a * c))/ (2 * a), (-(b) + sqrt(b * b - 4 * a * c))/(2 * a))