#!/bin/sh
echo "content-type: image/svg+xml"
echo ""
if [ ${#QUERY_STRING} -gt 12 ]; then
    barcode -S -e CODE128 -b $QUERY_STRING
else
    barcode -S -e UPC-A -b $QUERY_STRING
fi

