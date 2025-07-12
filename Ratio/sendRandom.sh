#!/bin/bash

TORRENTS_DIR = "/path/to/torrents"

cp "$(ls $TORRENTS_DIR/*.torrent | shuf -n 1)" file.torrent
sleep $(($RANDOM%600))
sizeToSend=$((30*$(python3 torrentSize.py)/100))
secondsToWait=$(($sizeToSend/100000))
secondsToWait=$(($secondsToWait+$RANDOM%$secondsToWait))
echo "Size to send = $sizeToSend"
echo "Seconds to wait = $secondsToWait"
if [ $sizeToSend -lt 250000000 ]
then
	exit
fi

python3 Ratio.py/ratio.py -c conf.json &
sleep $secondsToWait
kill $!
