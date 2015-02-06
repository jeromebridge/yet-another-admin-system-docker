#!/bin/bash

YAAS_CONFIG_OPTS=""
if ping -c 1 DB &> /dev/null
then
  echo "Linked Container: DB found"
else
  YAAS_CONFIG_OPTS="$YAAS_CONFIG_OPTS -Pyaas.db.host=$DB_PORT_5432_TCP_ADDR"
fi

# echo "PARAMS: $YAAS_CONFIG_OPTS"
gradle -Penv=docker $YAAS_CONFIG_OPTS setupVirgo runVirgo
