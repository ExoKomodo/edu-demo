#! /bin/bash

echo 'Unit testing Edu Demo'

# NOTE: Add specific unit test command here
cd $(dirname ${BASH_SOURCE[0]})/..
npm run test:unit
