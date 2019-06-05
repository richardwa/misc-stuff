#!/bin/bash
echo "content-type: text/plain"
echo ""
echo "$QUERY_STRING"
if [[ "${QUERY_STRING,,}" == *.jpg ]]; then
    echo "true"
else
    echo "false"
fi
