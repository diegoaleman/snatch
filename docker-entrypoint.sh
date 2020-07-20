#!/bin/bash
# Interpreter identifier

set -e
# Exit on fail

# Ensure all gems are installed. Add binstubs to bin which has been added to PATH in Dockerfile.
# bundle check || bundle install --binstubs="$BUNDLE_BIN"

exec "$@"
# Finally call command issued to the docker service
