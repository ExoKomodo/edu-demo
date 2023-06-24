#! /bin/bash

echo 'Building Edu Demo'

# NOTE: Add specific build command here
cd $(dirname ${BASH_SOURCE[0]})/..
npm run build --if-present
