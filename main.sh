#!/bin/bash
source config.sh

./survey_GET.sh ${source_file}

while read line
do
ip_string=${line// /\\n}
done <<<$(cat $ip_list)

./jq.sh $ip_string
./survey_POST.sh

