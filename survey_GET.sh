#!/bin/bash
source config.sh

if [ -z "$1" ]
	then
curl -k -s --user ${user}:${pass} -X GET -H "Content-Type: application/json" "http://localhost/api/v2/job_templates/10/survey_spec/"
	else
curl -k -s --user ${user}:${pass} -X GET -H "Content-Type: application/json" $api_url > $1
jq '.' $1 > "tmp" && mv "tmp" $1
fi

