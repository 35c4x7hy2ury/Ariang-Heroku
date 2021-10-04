#! /bin/bash -eu

ENVIRONMENT_REF="$(jq -r '.environment' "app.json")"
ENVIRONMENT="${!ENVIRONMENT_REF}"
