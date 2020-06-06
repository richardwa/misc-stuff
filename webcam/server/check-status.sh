#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Generate code at http://www.barcode-generator.org/
# code 128, data: A

# setup/config one liners
# curl -s http://localhost/streams/2/current | convert jpeg:- -rotate 10 -crop 200x200+345+200 out.jpg

# is QRCODE in VIEW
STATUS=$(curl -s http://localhost/streams/2/current |
 convert jpeg:- -rotate 10 -crop 150x150+280+200 - | 
 zbarimg -q -Sdisable -Sqrcode.enable jpeg:-)

date=$(date +"%Y-%m %T")
echo $STATUS

if [ -z "$STATUS" ]; then
    echo "$date Garage door is open"
    # $DIR/notify.sh
else
    echo "$date Garage door is closed"    
fi

