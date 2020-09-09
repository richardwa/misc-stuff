#!/bin/bash
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

mkdir -p $DIR/out
zip $DIR/out/pushtotalk.zip $DIR/* 
