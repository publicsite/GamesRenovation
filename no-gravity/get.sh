#!/bin/sh
mkdir Download
cd Download

wget "https://sourceforge.net/projects/nogravity/files/Game%20data%20%28requires%20binaries%29/2.0/rt-nogravity-data.zip/download" -O rt-nogravity-data.zip
wget "https://sourceforge.net/projects/nogravity/files/Source%20Files/2.0/rt-nogravity-src.zip/download" -O rt-nogravity-src.zip
echo version 2.0 >> version.txt