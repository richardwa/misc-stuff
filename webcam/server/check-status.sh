#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Generate code at http://www.barcode-generator.org/
# code 128, data: A

# is QRCODE in VIEW
STATUS=$(curl -s http://localhost/streams/2/current |
 convert jpeg:- -crop 200x200+345+450 - | 
 zbarimg -q -Sdisable -Scode128.enable jpeg:-)

echo $STATUS