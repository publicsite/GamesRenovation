#!/bin/sh

OLD_UMASK="$(umask)"
umask 0022

mkdir Download
cd Download

#git clone "http://dev.laptop.org/git/projects/micropolis-activity"

#wget http://git.zerfleddert.de/cgi-bin/gitweb.cgi/micropolis?a=snapshot;h=HEAD;sf=tgz -O micropolis.tar.gz

git clone git://git.zerfleddert.de/micropolis

umask "${OLD_UMASK}"
