#!/bin/bash
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

out=$DIR/dist
mkdir -p $out
rm -rf $out/*

zip $out/pushtotalk.zip $DIR/* 
