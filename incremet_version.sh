#!/bin/bash

# Check if the version number is provided as an argument
if [ $# -eq 0 ]; then
  echo "Usage: increment_version.sh <version_number>"
  exit 1
fi

# Extract the major, minor, and patch versions
version_parts=(${1//./ })
major=${version_parts[0]}
minor=${version_parts[1]}
patch=${version_parts[2]}

# Increment the patch version
minor=$((minor + 1))

# Update the version string
new_version="$major.$minor.$patch"

# Print the updated version number
echo "New version number: $new_version"