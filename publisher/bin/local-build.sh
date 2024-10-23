#!/usr/bin/env bash
set -x
set -e
set -u
set -o pipefail
set -o noclobber

# https://www.gnu.org/software/bash/manual/html_node/The-Shopt-Builtin.html
shopt -s nullglob

# stack overflow #59895
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do
    DIR="$(cd -P "$(dirname "$SOURCE")" && pwd)"
    SOURCE="$(readlink "$SOURCE")"
    [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE"
done
DIR="$(cd -P "$(dirname "$SOURCE")" && pwd)"

LATEST=$(curl --retry 2 --retry-delay 30 "https://api.github.com/repos/hl7/fhir-ig-publisher/releases/latest" | jq -r -c '.tag_name')
echo "Latest publisher tag: latest=${LATEST}"


docker buildx build --progress plain --no-cache --build-arg PUBLISHER_TAG=$LATEST -t sessaid/ig-publisher:latest ..

