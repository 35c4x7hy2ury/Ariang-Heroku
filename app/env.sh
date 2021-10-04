#! /bin/bash -eu

grep -v '^#' app.json

# Export env vars
export $(grep -v '^#' app.json | xargs)
