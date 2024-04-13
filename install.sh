#!/usr/bin/env bash

# determine if we're running on macOS or Linux
if [ "$(uname)" == "Darwin" ]; then
  export OS="macOS"
  # execute macos.sh
  . macOS.sh
else
  export OS="linux"
  # execute linux.sh
  . Linux.sh
fi