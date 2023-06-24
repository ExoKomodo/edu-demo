#! /bin/bash

set -euxo pipefail

CWD=$(dirname ${BASH_SOURCE[0]})

${CWD}/../0-laying-a-foundation/run-all.sh

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

rm -rf ${CLIENT_DIR}
cp -r ${CWD}/_client ${CLIENT_DIR}

cd ${CLIENT_DIR}
npm install --package-lock-only
