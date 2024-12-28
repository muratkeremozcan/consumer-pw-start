#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Load environment variables
. ./scripts/env-setup.sh

# Wait longer for provider verification
RETRY_WHILE_UNKNOWN=10  # Number of retries
RETRY_INTERVAL=30       # Seconds between retries

# Check if WebConsumer can be deployed
pact-broker can-i-deploy \
    --pacticipant WebConsumer \
    --version=$GITHUB_SHA \
    --to-environment dev \
    --retry-while-unknown=$RETRY_WHILE_UNKNOWN \
    --retry-interval=$RETRY_INTERVAL \
    --verbose

# Have to disable the contract because of the limit of 2 contracts per trial account
# Check if WebConsumer-event-consumer can be deployed
# pact-broker can-i-deploy \
#     --pacticipant WebConsumer-event-consumer \
#     --version=$GITHUB_SHA \
#     --to-environment dev \
#     --retry-while-unknown=$RETRY_WHILE_UNKNOWN \
#     --retry-interval=$RETRY_INTERVAL \
#     --verbose