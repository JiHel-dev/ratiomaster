#!/bin/bash

TARGET_HOUR=18

[ -z "$var" ] && CONF="standard"
echo "With configuration $CONF"
cp conf.json.$CONF conf.json

LOOP=0
while true; do
    # Stop condition
    if [[ -n "$MAX_RUN" && "$count" -ge "$MAX_RUN" ]]; then
        echo "Maximal number of loop reached ($MAX_RUN). Stopping."
        exit 0
    fi 

    NOW=$(date +%s)
    NEXT_RUN=$(date -d "tomorrow ${TARGET_HOUR}:00" +%s)
    
    TODAY_TARGET=$(date -d "${TARGET_HOUR}:00" +%s)
    if [[ "$NOW" -lt "$TODAY_TARGET" ]]; then
        NEXT_RUN=$TODAY_TARGET
    fi
    SLEEP_SECONDS=$((NEXT_RUN - NOW))
    echo "Sleeping for $SLEEP_SECONDS seconds (until $(date -d @$NEXT_RUN))"
    sleep "$SLEEP_SECONDS"
    echo "Running script $(date)"
    ./sendRandom.sh
    COUNT=$((COUNT + 1)) 
    echo "Run number $COUNT over"
done
