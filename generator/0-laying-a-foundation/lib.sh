#! /bin/bash

PROD_BRANCH=main

build_script() {
    SCRIPT_DIR=./client/scripts

    set +x
    NAME=$1
    shift
    SCRIPT=${SCRIPT_DIR}/$1
    # NOTE: Treats the args like a stack, popping one off the top.
    # Also similar to iterating a list one element at a time
    shift
    MESSAGE=$1
    shift
    NOTE=$1
    shift

    mkdir -p ${SCRIPT_DIR}

    if [ -f "${SCRIPT}" ]; then
        echo "${SCRIPT} exists already, deleting"
        rm -f ${SCRIPT}
    fi
    touch ${SCRIPT}
    # NOTE: Set script as executable by default. This causes bash to
    # automatically use whatever is after #! at the top of the file to run it
    chmod +x ${SCRIPT}
    echo "#! /bin/bash

echo '${MESSAGE}'

# NOTE: ${NOTE}" >> ${SCRIPT}
    set -x

    echo "
## ${NAME}

\`\`\`shell
${SCRIPT}
\`\`\`" >> README.md
}

update_branch_with_main() {    
    # NOTE: Accessing args passed into this function
    BRANCH=$1
    git checkout ${PROD_BRANCH}
    git pull
    git checkout ${BRANCH}
    # NOTE: Rebases your branch with PROD_BRANCH and force pushes the changes
    git rebase ${PROD_BRANCH}
    git push -f --set-upstream origin ${BRANCH}
}
