#!/bin/bash

if [ -z "$1" ]; then
  echo "Error: Path to directory with  wow client not specified."
  exit 1
fi

wow_client_path=$1
build_image="ghcr.io/jrtashjian/cmangos-extractors-classic:latest"

if [ ! -d "$wow_client_path" ]; then
  echo "Error: Directory '$wow_client_path' does not exist."
  exit 1
fi

echo "WoW client: $wow_client_path"

mkdir -p extracted-data || true

echo "Trying to pull: $build_image"

docker run \
	-v "$wow_client_path:/client" \
	-v "./extracted-data:/maps" \
	$build_image