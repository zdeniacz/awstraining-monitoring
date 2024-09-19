#!/usr/bin/env bash
# Generate a random value between -1000 and 1000
value=$(awk -v min=-1000 -v max=1000 'BEGIN{srand(); print min+rand()*(max-min+1)}')

# Round the value to three decimal places
value=$(printf "%.3f" $value)

# Use the value in the curl command
curl http://<<ELB_ADRESS>>/device/v1/test \
-H 'Content-Type: application/json' \
-u userEMEATest:welt \
--data '{
    "type": "testing",
    "value": '$value'
}'