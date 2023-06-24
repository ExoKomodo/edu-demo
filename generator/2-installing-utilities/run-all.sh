#! /bin/bash

set -euxo pipefail

SCRIPT_DIR=$(dirname ${BASH_SOURCE[0]})

${SCRIPT_DIR}/../1-putting-up-framing/run-all.sh

${SCRIPT_DIR}/0-setting-up-ci.sh
