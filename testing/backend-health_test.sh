#!/usr/bin/env bash

set -e

declare URL="backend:8000/api/util/status/200"
declare -i STATUS="$(curl -so /dev/null -w '%{http_code}' "${URL}")"

(( STATUS / 100 != 2 ))
