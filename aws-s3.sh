#!/bin/bash

DATE=$(date +%H-%M-%S)
BACKUP=$DATE-testdb.sql

DB_HOST=$1
DB_PASSWORD=$2
DB_NAME=$3

AWS_ID=$4
AWS_KEY=$5

BUCKET_NAME=$6


mysqldump -u root -p$DB_PASSWORD -h $DB_HOST $DB_NAME > /tmp/$(date +%H-%M-%S)-testdb.sql && \
export AWS_ACCESS_KEY_ID=$4 && \
export AWS_SECRET_ACCESS_KEY=$5 && \
echo "Uploading your db backup" && \
aws s3 cp /tmp/$(date +%H-%M-%S)-testdb.sql s3://$BUCKET_NAME/$BACKUP
