#! /bin/bash

set -euxo pipefail

CWD=$(dirname ${BASH_SOURCE[0]})

${CWD}/../2-installing-utilities/run-all.sh

source $(dirname ${BASH_SOURCE[0]})/lib.sh

# TODO: Copy paste community things like contributing.md, license, etc

pwd

cp ./docs/* ..
cp -r ./.github/* ../.github/
