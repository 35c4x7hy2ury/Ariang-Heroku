#!/bin/bash -eu
if [ "$PGID" != "0" ]; then
  $(dirname $0)/init.sh chpst -u SHAKUGAN ./forego start
else
  ./forego start
fi
