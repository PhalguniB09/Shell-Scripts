#!/bin/bash

set -e

mkdir /tmp/devops-test || echo "Failed to create directory"

cd /tmp/devops-test || echo "Failed to enter directory"

touch test.txt || echo "Failed to create file"

echo "Script completed successfully"

