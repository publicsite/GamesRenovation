#!/bin/sh
thepwd="$PWD"
find "$thepwd" -maxdepth 1 -type d | while read game; do
	cd "$game"
	if [ -d Download ]; then
	rm -rf Download
	fi
	if [ -f get.sh ]; then
		./get.sh
	fi
	cd "$thepwd"
sleep 1
done