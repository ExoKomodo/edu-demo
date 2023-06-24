#! /bin/bash

set -euxo pipefail

SCRIPT_DIR=$(dirname ${BASH_SOURCE[0]})

source $(dirname ${BASH_SOURCE[0]})/lib.sh

BRANCH=${BRANCH:-setup}
# NOTE: Creates a new branch local on your computer
set +e
git checkout -b ${BRANCH}
set -e

# NOTE: Calls the update_branch_with_main function defined in ./funcs/sh
# The syntax for calling a bash function is identical to calling CLI programs in bash
update_branch_with_main ${BRANCH}

# NOTE: Creates new file, if it does not exist
rm -f README.md
touch README.md
# NOTE: Writes markdown header to file
echo "# Edu Demo

## Important Links

- [Repository](https://github.com/ExoKomodo/edu-demo)" >> README.md

build_script Setup \
    setup.sh \
    "Setting up local environment for Edu Demo" \
    "Add tool installations and such here. Say you need docker-compose to run the application locally, then this should install that for you."

build_script Build \
    build.sh \
    "Building Edu Demo" \
    "Add specific build command here"

build_script Run \
    run.sh \
    "Running Edu Demo" \
    "Add specific run command here"

build_script "Unit Testing" \
    unit-test.sh \
    "Unit testing Edu Demo" \
    "Add specific unit test command here"

build_script "Integration Testing" \
    integration-test.sh \
    "Integration testing Edu Demo" \
    "Add specific integration test command here"
