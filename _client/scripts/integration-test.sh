#! /bin/bash

echo 'Integration testing Edu Demo'

# NOTE: Add specific integration test command here
cd $(dirname ${BASH_SOURCE[0]})/..
npm run test:e2e
