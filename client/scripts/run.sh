#! /bin/bash

echo 'Running Edu Demo'

# NOTE: Add specific run command here
cd $(dirname ${BASH_SOURCE[0]})/..
npm run dev
