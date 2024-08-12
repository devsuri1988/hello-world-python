#!/bin/bash

set -e
# set -x

echo "Getting list of changed files..."
FILES=()
for i in $( git diff --name-only HEAD HEAD~1 | cut -d/ -f3- ); do
    FILES+=( "$i" )
done
echo "${FILES[@]}"

echo "Including the changed files for S3 sync..."
CMDS=()
for i in "${FILES[@]}"; do
    CMDS+=("--include=$i""*")
done
echo "${CMDS[@]}"

#S3_BUCKET="s3://nova-interactives-${ENVIRONMENT}"

#echo "Sync\`ing the list of changed files with S3 bucket $S3_BUCKET..."
#echo "${CMDS[@]}" | xargs aws s3 sync wgbh/nova/ "$S3_BUCKET" --delete --exclude "*" && echo "DONE"
