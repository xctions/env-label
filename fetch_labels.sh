#!/usr/bin/env bash

set -e

if [ -z "$GH_TOKEN" ]; then
    echo "Set the GH_TOKEN env variable."
    exit 1
fi

if [ -z "$REPOSITORY" ]; then
    echo "Set the repo env variable."
    exit 1
fi

if [ -z "$PR_NUMBER" ]; then
    echo "Set the pr_number env variable."
    exit 1
fi

REPOSITORY="repos/$REPOSITORY/issues/$PR_NUMBER/labels"

labels=$(gh api "$REPOSITORY" --jq \
    '.[].name'
)

labels=$(echo "$labels" | jq -r \
    'map(select(. == "dev" or . == "test" or . == "stag" or . == "qa" or . == "prod"))'
)

echo "$labels" 
# echo "labels=$labels" >> $GITHUB_OUTPUT