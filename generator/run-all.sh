#! /bin/bash

set -euxo pipefail

SCRIPT_DIR=$(dirname ${BASH_SOURCE[0]})

${SCRIPT_DIR}/4-inspection/run-all.sh
