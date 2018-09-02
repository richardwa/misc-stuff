#!/usr/bin/env runhaskell
{-# LANGUAGE OverloadedStrings #-}

import Graphics.Implicit

out = rect3R 5 (0,0,0) (20,20,20)

main = writeSTL 0.1 "test.stl" out
