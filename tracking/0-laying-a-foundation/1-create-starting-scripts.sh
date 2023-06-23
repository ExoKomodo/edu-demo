#! /bin/bash

set -euxo pipefail

SCRIPT_DIR=$(dirname ${BASH_SOURCE[0]})
source ${SCRIPT_DIR}/funcs.sh

BRANCH=setup
# Creates a new branch local on your computer
git checkout -b ${BRANCH}

# Calls the update_branch_with_main function defined in ./funcs/sh
# The syntax for calling a bash function is identical to calling CLI programs in bash
update_branch_with_main ${BRANCH}

touch ./setup.sh

echo "#! /bin/bash
echo 'Setting up local environment for Edu Demo'

# NOTE: Add tool installations and such here. Say you need docker-compose to run the application locally, then this should install that for you.
" >> ./setup.sh
