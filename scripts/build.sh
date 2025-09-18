#!/bin/bash
# Script to build custom Buildroot packages and final image.

if [ -z "$1" ]; then
  echo "Usage: $0 /path/to/buildroot"
  exit 1
fi

BUILDROOT="$1"

cd "$BUILDROOT" || { echo "Failed to cd into $BUILDROOT"; exit 1; }


echo "Building edgelab-hellolib..."
make edgelab-hellolib

echo "Building edgelab..."
make edgelab

echo "Build finished."
make 

echo "Build finished. You can now run the image with:"
echo "./output/images/start-qemu.sh"