# jq examples

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
jq --arg version "$"  '
. as $root
| .build_versions
| if has($version)
  then
    ( $root | .build_versions[$version]["built"] |= "yes" )
  else
    ( $root | .build_versions[$version] |= {"built": "yes"})
  end
' ../builds.json
