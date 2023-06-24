#! /bin/bash

# TODO: Add specific commands for setting up and running vue

echo "Setting up language, frameworks, and libraries"

set -euxo pipefail

source $(dirname ${BASH_SOURCE[0]})/lib.sh

echo "
## [Client](${CLIENT_DIR})

### [Client](${CLIENT_DIR}) - Setup

Install nodejs v18+. Using [`nvm`](https://github.com/nvm-sh/nvm) is the best option.

After installing, refer to the [`README`](${CLIENT_DIR}/README.md#project-setup)

### [Client](${CLIENT_DIR}) - Run

Refer to the [`README`](${CLIENT_DIR}/README.md#compile-and-hot-reload-for-development)

### [Client](${CLIENT_DIR}) - Test

Refer to the [`README`](${CLIENT_DIR}/README.md#run-unit-tests-with-vitest)" >> README.md

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

# NOTE: This is a one shot operation for this script
set +x
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

nvm install ${NODE_VERSION}
nvm use ${NODE_VERSION}
set -x

git clone --depth=1 git@github.com:vuejs/create-vue-templates.git ../templates
cp -r ../templates/typescript-router-vitest-cypress/* ${CLIENT_DIR}
rm -rf ../templates
sed -i '' -e 's/pnpm/npm run/g' ${CLIENT_DIR}/README.md

echo "# Logs
logs
*.log
npm-debug.log*
yarn-debug.log*
yarn-error.log*
pnpm-debug.log*
lerna-debug.log*

node_modules
.DS_Store
dist
dist-ssr
coverage
*.local

/cypress/videos/
/cypress/screenshots/

# Editor directories and files
.vscode/*
!.vscode/extensions.json
.idea
*.suo
*.ntvs*
*.njsproj
*.sln
*.sw?" >> ${CLIENT_DIR}/.gitignore

# NOTE: Like cd, but puts your current directory in a stack, and using popd
# afterwards brings you back a layer in your directory stack

GET_CWD='$(dirname ${BASH_SOURCE[0]})/..'
echo "cd ${GET_CWD}
npm ci" >> ${SCRIPT_DIR}/setup.sh

echo "cd ${GET_CWD}
npm run dev" >> ${SCRIPT_DIR}/run.sh

echo "cd ${GET_CWD}
npm run build --if-present" >> ${SCRIPT_DIR}/build.sh

echo "cd ${GET_CWD}
npm run test:unit" >> ${SCRIPT_DIR}/unit-test.sh

echo "cd ${GET_CWD}
npm run test:e2e" >> ${SCRIPT_DIR}/integration-test.sh

cd ${CLIENT_DIR}
npm install --package-lock-only
