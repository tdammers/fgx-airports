#!/bin/bash
BASEDIR=$(dirname "$0")
# DESTDIR="$HOME/.fgfs/TerraSync"
DESTDIR="$HOME/flightgear/fgdata-standalone/Scenery/fgx-airports"
AIRPORTS=$(cat "$BASEDIR/APlist.txt"|grep '[A-Z]\{4\}')
for AIRPORT in $AIRPORTS
do
    echo "*** $AIRPORT ***"
    DIR1=$(echo "$AIRPORT" | cut -c 1)
    DIR2=$(echo "$AIRPORT" | cut -c 2)
    DIR3=$(echo "$AIRPORT" | cut -c 3)
    DST="$DESTDIR/Airports/$DIR1/$DIR2/$DIR3/$AIRPORT.procedures.xml"
    SRC="$BASEDIR/$AIRPORT.xml"
    echo "mkdir -p "\""$(dirname "$DST")"\"
    mkdir -p "$(dirname "$DST")"
    echo "$SRC -> $DST"
    rm -f "$DST"
    cp "$SRC" "$DST"
done
