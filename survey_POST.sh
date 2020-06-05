#!/bin/bash
source config.sh

curl -k -s --user ${user}:${pass} -X POST -H "Content-Type: application/json" ${api_url} --data-binary "@${dest_file}" | python3 -m json.tool
