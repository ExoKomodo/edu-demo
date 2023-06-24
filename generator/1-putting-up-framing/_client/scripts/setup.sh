#! /bin/bash

echo 'Setting up local environment for Edu Demo'

# NOTE: Add tool installations and such here. Say you need docker-compose to run the application locally, then this should install that for you.
cd $(dirname ${BASH_SOURCE[0]})/..
npm ci
