#! /bin/bash

set -euxo pipefail

CWD=$(dirname ${BASH_SOURCE[0]})

${CWD}/../2-installing-utilities/run-all.sh

source $(dirname ${BASH_SOURCE[0]})/lib.sh

cp -r ${CWD}/_client/* ${CLIENT_DIR}
