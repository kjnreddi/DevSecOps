#!/bin/bash

# Ensure the SNYK_TOKEN is set
if [ -z "$SNYK_TOKEN" ]; then
  echo "SNYK_TOKEN is not set. Please provide the token as an environment variable."
  exit 1
fi

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
