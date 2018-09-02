#!/bin/bash

cat <<EOF > $1.hs
#!/usr/bin/env runhaskell
{-# LANGUAGE OverloadedStrings #-}

import Graphics.Implicit

out = unionR 2 [
  rect3R 0 (0,0,0) (20,20,20),
  translate (20,20,20) (sphere 15) 
  ]

main = writeSTL 1 "$1.stl" out
EOF

