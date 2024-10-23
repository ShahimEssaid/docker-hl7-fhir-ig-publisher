#!/usr/bin/env bash
#set -x
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

cd $DIR/..

LATEST="$(curl --retry 2 --retry-delay 30 "https://api.github.com/repos/hl7/fhir-ig-publisher/releases/latest" | jq -c '.tag_name')"
echo "Latest publisher tag: latest=${LATEST}"

TO_BUILD="$(jq -c --argjson latest "$LATEST" '
    [.build_versions
    | if has($latest) then empty else $latest end,
    (to_entries[] | select(( .value.built // "null" | startswith("yes") | not ) and ( .value.built // "null" | startswith("failed") | not )).key)
    ] | sort
' ./builds.json)"
echo "To build versions: build-versions=${TO_BUILD}"

