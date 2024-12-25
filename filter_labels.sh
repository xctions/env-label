#!/usr/env/bin bash

set -e

if [ -z "$LABELS" ]; then
  echo "Set the LABELS env variable."
  exit 1
fi

len=$(echo "$LABELS" | jq 'length')

if [ "$len" -ne 1 ]; then
  echo "Error: Expected exactly one environment label, but found $len"
  exit 1
fi

env=$(echo "$labels" | jq -r '.[0]')

echo "$env"