json='[{"id":7927159258,"node_id":"LA_kwDONiIhnc8AAAAB2H7Z2g","url":"https://api.github.com/repos/xctions/xctions-tests/labels/dev","name":"dev","color":"92B8CC","default":false,"description":""}]'

# echo $(jq -r '.[].name' <<< $json)
filtered_labels=$(echo "$json" | jq -r '[.[] | select(.name == "dev" or .name == "test" or .name == "stag" or .name == "qa" or .name == "prod") | .name]')

echo "filtered_labels=$filtered_labels"
len=$(echo "$filtered_labels" | jq 'length')
echo "len=$len"
env=$(echo "$json" | jq -r '.[].name')
echo "env=$env"
# json=$(jq -r '.[0]' <<< $json)
# echo "json=$json"
# len=$(echo "$json" | jq 'length')
# echo "len: $len"
