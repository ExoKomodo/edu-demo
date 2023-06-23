#! /bin/bash

set -euxo pipefail

SCRIPT_DIR=$(dirname ${BASH_SOURCE[0]})

${SCRIPT_DIR}/../0-laying-a-foundation/run-all.sh

${SCRIPT_DIR}/0-setting-up-ci.sh
${SCRIPT_DIR}/1-choosing-language-frameworks-libraries.sh
