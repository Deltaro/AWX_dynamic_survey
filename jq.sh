#!/bin/bash 
source config.sh

head -n4 ${source_file} > ${dest_file}
jq '.spec[] | select(.question_name != "SERVER")' ${source_file} > "tmp" && mv "tmp" 1.json
sed -i 's/}/},/g' 1.json

jq --arg a "${1}" '.spec[] | select(.question_name == "SERVER") | .choices = $a' ${source_file} > "tmp" && mv "tmp" 2.json


cat 1.json >> ${dest_file}
cat 2.json >> ${dest_file}
tail -n2 ${source_file} >> ${dest_file}
rm 1.json && rm 2.json

sed -i 's:\\\\n:\\n:g' ${dest_file}
jq '.' ${dest_file} > "tmp" && mv "tmp" ${dest_file}
