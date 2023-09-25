#!/usr/bin/env sh

# Usage: hook-send-message.sh
#
# Need environment variable WEBHOOK_URL

mk_json() {
  echo "["

  for (( i=1; i<=$SMS_MESSAGES; i++ )); do
    CLASS_VAR="SMS_${i}_CLASS"
    NUMBER_VAR="SMS_${i}_NUMBER"
    TEXT_VAR="SMS_${i}_TEXT"
    REFERENCE_VAR="SMS_${i}_REFERENCE"
    
    # Export to json
    echo "{"
    echo "  \"class\": \"${!CLASS_VAR}\","
    echo "  \"number\": \"${!NUMBER_VAR}\","
    echo "  \"text\": \"${!TEXT_VAR}\","
    echo "  \"reference\": \"${!REFERENCE_VAR}\""
    
    # Apend "," except the last message
    if (( i < SMS_MESSAGES )); then
        echo "},"
    else
        echo "}"
    fi
  done

  echo "]"
}

/usr/bin/curl -s -k -X POST \
    -H 'Content-Type: application/json' \
    -d "{\"data\":$(mk_json)}" \
    ${WEBHOOK_URL} &
