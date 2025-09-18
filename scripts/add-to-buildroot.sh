#!/bin/bash
# Copy packages into a Buildroot tree

if [ -z "$1" ]; then
  echo "Usage: $0 /path/to/buildroot"
  exit 1
fi

BUILDROOT=$1
cp -r package/edgelab $BUILDROOT/package/
cp -r package/edgelab-hellolib $BUILDROOT/package/

echo "Package added to Buildroot!"
