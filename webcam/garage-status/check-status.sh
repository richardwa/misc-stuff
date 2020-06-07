#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Generate code at http://www.barcode-generator.org/
# code 128, data: A

# setup/config one liners
# curl -s http://localhost/streams/2/current | convert jpeg:- -rotate 10 -crop 200x200+345+200 out.jpg

# is QRCODE in VIEW
curl -s http://localhost/streams/2/current |
 convert jpeg:- -rotate 10 -crop 150x150+280+200 - | 
 zbarimg -q -Sdisable -Sqrcode.enable jpeg:-

STATUS=$?
echo $STATUS

# zbarimg returns an exit code to indicate the status of the program execution. Current exit codes are:

# 0 Barcodes successfully detected in all images. Warnings may have been generated, but no errors. 
# 1 An error occurred while processing some image(s). This includes bad arguments, I/O errors and image handling errors from ImageMagick. 
# 2 ImageMagick fatal error. 
# 3 The user quit the program before all images were scanned. Only applies when running in interactive mode (with --display) 
# 4 No barcode was detected in one or more of the images. No other errors occurred. 

date=$(date +"%Y-%m %T")

if [ $STATUS == 0 ]; then
    echo "$date Garage door is closed" 
else
    echo "$date Garage door is open"
    # $DIR/notify.sh
fi

