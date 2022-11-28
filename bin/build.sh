#!/bin/bash

# get the root of the directory
REPO_ROOT=$(git rev-parse --show-toplevel)

echo
echo ">> Building both namespaces"
$REPO_ROOT/bin/viash ns build -f -n processing -t utils/processing
$REPO_ROOT/bin/viash ns build -f -n api -t utils/api

echo
echo ">> Please see under utils/ to find the tools for api and processing..."
echo
