#!/bin/sh
thepwd="$PWD"
find "$thepwd" -maxdepth 1 -type d | while read game; do
	cd "$game"
	if [ -d build ]; then
	rm -rf build
	fi
	if [ -f build.sh ]; then
		./build.sh
	fi
	cd "$thepwd"
sleep 1
done