#!/bin/bash

if ! command -v carthage > /dev/null; then
  printf 'Cartage is not installed.\n'
  printf 'see https://github.com/Carthage/Carthage for install instructions.\n'
  exit 1
fi

carthage update --platform iOS --no-use-binaries
