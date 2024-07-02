#!/usr/bin/env bash

 echo "Getting version"

json=$(elysd q --output json --node "https://rpc.devnet.elys.network:443" wasm contract-state smart "elys17p9rzwnnfxcjp32un9ug7yhhzgtkhvl9jfksztgw5uh69wac2pgs98tvuy" '{ "version": {} }')

echo "json $json"

version=$(echo $json | jq -r ".data.version")

echo "version: $version"

 # Extract the major, minor, and patch versions
version_parts=(${version//./ })
major=${version_parts[0]}
minor=${version_parts[1]}
patch=${version_parts[2]}

# Increment the patch version
minor=$((minor + 1))

# Update the version string
new_version="$major.$minor.$patch"

# Print the updated version number
echo "New version number: $new_version"