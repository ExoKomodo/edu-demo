#! /bin/bash

set -euxo pipefail

CWD=$(dirname ${BASH_SOURCE[0]})

${CWD}/../3-hanging-walls/run-all.sh
