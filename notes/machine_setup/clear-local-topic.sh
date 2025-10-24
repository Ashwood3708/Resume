#!/bin/zsh

# First check for required apps
# What's command -v?  https://stackoverflow.com/questions/37056192/which-vs-command-v-in-bash
command -v tapctl >/dev/null 2>&1 || { echo "'tapctl' is required. e.g.brew tap tgt/brewhouse git@git.target.com:brew/house.git && brew update && brew install tapctl" >&2; exit 1; }
command -v jq >/dev/null 2>&1 || { echo "'jq' is required. e.g. brew install jq" >&2; exit 1; }
command -v yes >/dev/null 2>&1 || { echo "'yes' is required. e.g. brew install yes" >&2; exit 1; }
command -v yq >/dev/null 2>&1 || { echo "'yq' is required. e.g. brew install yq" >&2; exit 1; }

# Check for required parameters
if [ "$#" -ne 1 ] ; then
  echo "Usage: $0 [topic] " >&1
  exit 1
fi


KAFKATOPIC=$1
 
kafka-topics --delete --bootstrap-server localhost:9092 --topic $KAFKATOPIC 
echo "Deleted topic $KAFKATOPIC"

kafka-topics --create --bootstrap-server localhost:9092 --topic $KAFKATOPIC 
