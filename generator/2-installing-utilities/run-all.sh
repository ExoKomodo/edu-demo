#! /bin/bash

set -euxo pipefail

CWD=$(dirname ${BASH_SOURCE[0]})

${CWD}/../1-putting-up-framing/run-all.sh

source $(dirname ${BASH_SOURCE[0]})/lib.sh

echo "Setting up CI"

mkdir -p ${WORKFLOW_DIR}

WORKFLOW_FILE=${WORKFLOW_DIR}/ci.yaml

rm -f ${WORKFLOW_FILE}

echo "name: CI

on:
  push:
    branches:
      - main
  pull_request:
    branches:
      - main

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v3
    - name: Setup
      run: ${SCRIPT_DIR}/setup.sh
    - name: Build
      run: ${SCRIPT_DIR}/build.sh
    - name: Unit tests
      run: ${SCRIPT_DIR}/unit-test.sh
    - name: Integration tests
      run: ${SCRIPT_DIR}/integration-test.sh" >> ${WORKFLOW_FILE}
