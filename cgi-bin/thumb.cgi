#!/bin/bash
decoded=${QUERY_STRING//%20/ }
target=/srv/http${decoded}
thumb=/var/cache/apache2/thumbs${decoded}.thb

if [[ ! -f "$target" ]]; then
   echo "status: 404"
   echo ""
   exit 0;
elif [[ ! -f "$thumb" ]]; then
    dir=$(dirname "$thumb")
    mkdir -p "$dir"
    touch "$thumb"

    if [[ "${target,,}" == *.jpg ]]; then
        epeg -w 120 -h 90 -i -m 90 "$target" "$thumb"
    else
        convert -define jpeg:size=240x180 "$target" -thumbnail 120x90 jpeg:"$thumb"
    fi
fi
echo "Content-Type: image/jpeg"
echo ""
cat "$thumb"
