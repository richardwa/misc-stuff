#!/bin/bash
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
PWD=`pwd`

cd $DIR
rm pushtotalk.zip
zip pushtotalk.zip * 
cd $PWD
