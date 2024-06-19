#!/bin/bash

# Ensure the SNYK_TOKEN is set
if [ -z "$1" ]; then
  echo "Usage: $0 <SNYK_TOKEN>"
  exit 1
fi

SNYK_TOKEN=$1

# Install Snyk in the container
npm install -g snyk

# Authenticate Snyk
snyk auth "${SNYK_TOKEN}"

# Change to the microservice directory
cd /microservice

# List files in the microservice directory
ls -l

# Monitor the project with Snyk
snyk monitor --project-name=em-proc-sca --strict-out-of-sync=false

# Run Snyk code test
# snyk code test --report --project-name=em-proc-code || true

# List files in the current directory
ls -l