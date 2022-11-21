#!/bin/sh
thepwd="$PWD"
find "$thepwd" -maxdepth 1 -type d | while read game; do
	cd "$game"
	if [ -f getdeps.sh ]; then
		./getdeps.sh
	fi
	cd "$thepwd"
sleep 1
done