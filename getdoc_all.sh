#!/bin/sh
thepwd="$PWD"
find "$thepwd" -maxdepth 1 -type d | while read game; do
	cd "$game"
	if [ -d doc ]; then
	rm -rf doc
	fi
	if [ -f getdoc.sh ]; then
		./getdoc.sh
	fi
	cd "$thepwd"
sleep 1
done