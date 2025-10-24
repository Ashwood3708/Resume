#!/bin/zsh

# First check for required apps
# What's command -v?  https://stackoverflow.com/questions/37056192/which-vs-command-v-in-bash
command -v tapctl >/dev/null 2>&1 || { echo "'tapctl' is required. e.g.brew tap tgt/brewhouse git@git.target.com:brew/house.git && brew update && brew install tapctl" >&2; exit 1; }
command -v jq >/dev/null 2>&1 || { echo "'jq' is required. e.g. brew install jq" >&2; exit 1; }
command -v yes >/dev/null 2>&1 || { echo "'yes' is required. e.g. brew install yes" >&2; exit 1; }
command -v yq >/dev/null 2>&1 || { echo "'yq' is required. e.g. brew install yq" >&2; exit 1; }

# Check for required parameters
if [ "$#" -lt 2 ] ; then
  echo "Usage: $0 [topic] [team-env] [from-begin]" >&2
  exit 1
fi


KAFKATOPIC=$1
ENV=$2
BGN=" "
BOOTSTRAP=localhost:9092
CONFIG=" "
CONSUMER_CONFIG_OPTION=" "
BEGINNING=" "


if [ $ENV = 'axon-dev' ] || [ $ENV = 'ad' ] ; then
BOOTSTRAP=kafka-tte-axon.dev.target.com:9093 
CONFIG=/Users/Z0041LR/certs/axon/dev/axon-dev.properties
elif [ $ENV = 'axon-prod' ] || [ $ENV = 'ap' ] ; then
BOOTSTRAP=kafka-tte-axon.prod.target.com:9093 
CONFIG=/Users/Z0041LR/certs/axon/prod/axon-prod.properties
elif [ $ENV = 'fpc-dev' ] || [ $ENV = 'fd' ] ; then
BOOTSTRAP=kafka-tte-app.dev.target.com:9093
CONFIG=/Users/Z0041LR/certs/fpc/dev/fpc-dev.properties 
elif [ $ENV = 'fpc-prod' ] || [ $ENV = 'fp' ] ; then
BOOTSTRAP=kafka-tte-app.prod.target.com:9093
CONFIG=/Users/Z0041LR/certs/fpc/prod/fpc-prod.properties
fi

if [ $CONFIG != " " ] ; then
CONSUMER_CONFIG_OPTION=--consumer.config
echo consuming target topic $KAFKATOPIC
else
echo consuming local topic $KAFKATOPIC
fi

if [ "$#" -gt 2 ] ; then
  BGN=$3
fi

if [ $BGN = 'b' ] || [ $BGN = 'y' ] || [ $BGN = 'from-begin' ]; then
    BEGINNING=--from-beginning
    echo consuming from beginning
fi

kafka-console-consumer --bootstrap-server $BOOTSTRAP $CONSUMER_CONFIG_OPTION $CONFIG  --property print.key=true $BEGINNING --topic $KAFKATOPIC 
done
