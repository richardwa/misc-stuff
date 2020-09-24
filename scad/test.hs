
import Graphics.Implicit

height (x,y) =15+5*cos(x/4)+5*cos(x/2)+5*cos(y/4)+5*cos(y/2)

r = rectR 0 (0,0) (10,10)
out = extrudeRM 
  0  -- roundness
  (Left 3) -- twist
  (Left 1) -- scale
  (Left (0,0)) -- translation
  r  -- shape
  (Right height) -- height
 
main = writeSTL 0.2 "test.stl" out