# jq examples

# this is the current version selection code

#LATEST="$(curl "https://api.github.com/repos/hl7/fhir-ig-publisher/releases/latest" | jq -c '.tag_name')"
#echo LATEST $LATEST
#
#TO_BUILD="$(jq -c --argjson latest "$LATEST" '
#    [.build_versions
#    | if has($latest) then empty else $latest end,
#      (to_entries[] | select(.value.built != "yes" and .value.built != "failed").key)
#    ] | sort
#    ' ../builds.json)"
#echo TO BUILD: $TO_BUILD

# this is the current builds.json update code with a hard coded variable

jq --arg version "1.1.118"  '
  . as $root |
  .build_versions |
  if has($version) then ( $root | .build_versions[$version]["built"] |= "yes" ) else ( $root | .build_versions[$version] |= {"built": "yes"}) end
  '  ../builds.json

#jq '.' ../config.json

#jq '.["latest"]["tags"]' ../config.json

#jq '.versions[].built' ../config.json

# this gets all the "no" built versions into an array, compact
#jq -c '[.versions | to_entries[] | select(.value.built == "no").key]' ../config.json


# this edits the version and sets built to yes
#version=1.1.118
#jq --arg yes "yes" --arg version $version '.versions[$version].built = $yes' ../config.json

#
#echo "[\"1.1.116\",\"1.1.117\"]"  | jq 'contains(["1.1.1176"])'

#jq -c '[ .versions | to_entries[] | select(.value.built == "yes" or .value.built == "failed").key]' ../builds.json


#  update the builds.json file wip
#jq --arg version "$"  '
#. as $root
#| .build_versions
#| if has($version)
#  then
#    ( $root | .build_versions[$version]["built"] |= "yes" )
#  else
#    ( $root | .build_versions[$version] |= {"built": "yes"})
#  end
#' ../builds.json
