#!/bin/bash

CRUMB=$(curl -u "$USERNAME:$PASSWORD" -s 'http://jenkins.localhost:8080/crumbIssuer/api/xml?xpath=concat(//crumbRequestField,":",//crumb)')

curl -u "$USERNAME:$PASSWORD" -H "$CRUMB" -X POST http://$HOSTNAME:$PORT/job/$JOBNAME/build?delay=0sec
#Build with parameters example

curl -u "$USERNAME:$PASSWORD" -H "$CRUMB" -X POST http://$HOSTNAME:$PORT/job/$JOBNAME/buildWithParameters?DB_HOST=db_host&DB_MANE=people&AWS_BUCKET_NAME=demo_bucket

