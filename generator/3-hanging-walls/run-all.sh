#! /bin/bash

set -euxo pipefail

source $(dirname ${BASH_SOURCE[0]})/lib.sh

SCRIPT_DIR=$(dirname ${BASH_SOURCE[0]})

${SCRIPT_DIR}/../2-installing-utilities/run-all.sh
