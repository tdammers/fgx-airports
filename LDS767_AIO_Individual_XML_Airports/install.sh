#!/bin/bash
BASEDIR=$(dirname "$0")
AIRPORTS=$(cat "$BASEDIR/APlist.txt"|grep '[A-Z]\{4\}')
for AIRPORT in $AIRPORTS
do
    echo "*** $AIRPORT ***"
    DIR1=$(echo "$AIRPORT" | cut -c 1)
    DIR2=$(echo "$AIRPORT" | cut -c 2)
    DIR3=$(echo "$AIRPORT" | cut -c 3)
    DST="$HOME/.fgfs/TerraSync/Airports/$DIR1/$DIR2/$DIR3/$AIRPORT.procedures.xml"
    SRC="$BASEDIR/$AIRPORT.xml"
    echo "$SRC -> $DST"
    rm "$DST"
    cp "$SRC" "$DST"
done
