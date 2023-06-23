#! /bin/bash

set -euxo pipefail

SCRIPT_DIR=$(dirname ${BASH_SOURCE[0]})
source ${SCRIPT_DIR}/funcs.sh

BRANCH=${BRANCH:-setup}
# Creates a new branch local on your computer
git checkout -b ${BRANCH}

# Calls the update_branch_with_main function defined in ./funcs/sh
# The syntax for calling a bash function is identical to calling CLI programs in bash
update_branch_with_main ${BRANCH}

SCRIPT=./setup.sh
touch ${SCRIPT}
echo "#! /bin/bash
echo 'Setting up local environment for Edu Demo'

# NOTE: Add tool installations and such here. Say you need docker-compose to run the application locally, then this should install that for you." \
    >> ${SCRIPT}

SCRIPT=./build.sh
touch ${SCRIPT}
echo "#! /bin/bash
echo 'Building Edu Demo'

# NOTE: Add specific build command here" \
    >> ${SCRIPT}

SCRIPT=./run.sh
touch ${SCRIPT}
echo "#! /bin/bash
echo 'Running Edu Demo'

# Sometimes, your build and run are the same command.
# In that case, use the build step as a "lint" or "validation" stage
./build.sh
# NOTE: Add specific run command here" \
    >> ${SCRIPT}
