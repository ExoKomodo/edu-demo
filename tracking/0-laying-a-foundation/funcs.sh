#! /bin/bash

PROD_BRANCH=main

update_branch_with_main() {    
    # Accessing args passed into this function
    BRANCH=$1
    git checkout ${PROD_BRANCH}
    git pull
    git checkout ${BRANCH}
    # Rebases your branch with PROD_BRANCH and force pushes the changes
    git rebase ${PROD_BRANCH}
    git push -f --set-upstream origin ${BRANCH}
}
