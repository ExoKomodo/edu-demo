#! /bin/bash

# set -e: Causes script to fail immediately when a bad exit code is returned in this shell
# set -u: Causes script to fail when any variable is referenced that is not defined
# set -x: Prints out every bash command being run, before it runs, to enable debugging of bash scripts
# set -o: Allows setting of complex shell options like...
# pipefail, which causes bad exit codes to fail the whole script when using a | operator. Bash usually silently ignores bad exit codes in pipe expressions, but this changes that behavior 
set -euxo pipefail

SCRIPT_DIR=$(dirname ${BASH_SOURCE[0]})

# Imports the script as if you copy pasted it in place.
# Allows you to use bash scripts as importable libraries.
source ${SCRIPT_DIR}/funcs.sh

git init -b ${PROD_BRANCH}
git remote add origin git@github.com:ExoKomodo/edu-demo.git

# Creates new file, if it does not exist
touch README.md
# Writes markdown header to file
echo "# Edu Demo" >> ./README.md

# Adds all files recursively in the repo that have changed
git add .
# A decent convention to leave the first commit of a repo effectively blank, in case you ever need ot clean refresh the git repo history, you can always go back to this practically empty initial commit. Think of this like a [sentinel node](https://en.wikipedia.org/wiki/Sentinel_node) for your commit history
git commit -m "Initial commit"

# This is the only time you must include any of the ADDITIONAL_ARGS for the main branch
# Any time you want to push a new branch, you run this command with the branch name you are pushing, while checked out in the branch you wish to push
ADDITIONAL_ARGS="--set-upstream origin ${PROD_BRANCH}"
git push ${ADDITIONAL_ARGS}
