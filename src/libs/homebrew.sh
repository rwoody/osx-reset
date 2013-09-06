#!/bin/bash

if [[ "$1" == "-h" || "$1" == "--help" ]]; then cat <<HELP
beerme
http://rwoody.me/

This installs homebrew formulas that you have specified
in your config files.
HELP
return; fi

if [ ! "$1" ]; then
  echo 'You must specify one or more commands to run.'
  exit;
fi
