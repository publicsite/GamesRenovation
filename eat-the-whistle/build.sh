#!/bin/sh
mkdir build
cd build
tar -xf ../Download/ETW-3.6-src.tar.gz

patch -p1 < ../patches/mydebug.h.patch
patch -p1 < ../patches/etw_locale.c.patch
patch -p1 < ../patches/myiff.c.patch
patch -p1 < ../patches/freq.c.patch
patch -p1 < ../patches/etw.c.patch

cd etw-3.6
sed -i "s#LDFLAGS = \`pkg-config --libs sdl\` \`pkg-config --libs gtk+-2.0\`#LDFLAGS = \`pkg-config --libs sdl\` \`pkg-config --libs gtk+-2.0\` -lm#g" Makefile.linux

#use -fPIE
sed -i "s#gcc#gcc -fPIE#g" Makefile.linux

#fix undefined reference to kprintf
sed -i "s#kprintf#printf#g" anim.c

sed -i "s@#   define fopen os_open@#   define os_open fopen@g" include/os_defs.h

#I get multiple definitions
sed -i "s#data.o ##g" Makefile.linux
rm data.c
#I get undefined references for this file
sed -i "s#generic_video.o ##g" Makefile.linux
rm generic_video.c
#I get undefined references for this file
sed -i "s# palla.o##g" Makefile.linux
rm palla.c
#I get undefined references for this file
sed -i "s# utility.o##g" Makefile.linux
rm utility.c
#I get undefined references for this file
sed -i "s#config.o ##g" Makefile.linux
rm config.c
#I get undefined references for this file
sed -i "s#radar.o ##g" Makefile.linux
rm radar.c
#I get undefined references for this file
sed -i "s#menu.o ##g" Makefile.linux
rm menu.c
#I get undefined references for this file
sed -i "s#computer.o ##g" Makefile.linux
rm computer.c
#I get undefined references for this file
sed -i "s#portiere.o ##g" Makefile.linux
rm portiere.c
#I get undefined references for this file
sed -i "s#commento.o ##g" Makefile.linux
rm commento.c
#I get undefined references for this file
sed -i "s#specials.o ##g" Makefile.linux
rm specials.c
#I get undefined references for this file
sed -i "s#crowd.o ##g" Makefile.linux
rm crowd.c
#I get undefined references for this file
sed -i "s#human.o ##g" Makefile.linux
rm human.c
#I get undefined references for this file
sed -i "s#cpu.o ##g" Makefile.linux
rm cpu.c
#I get undefined references for this file
sed -i "s#display.o ##g" Makefile.linux
rm display.c
#I get undefined references for this file
sed -i "s#chunkyblitting.o ##g" Makefile.linux
rm chunkyblitting.c
#I get undefined references for this file
sed -i "s#os_video.o ##g" Makefile.linux
rm os_video.c
#I get undefined references for this file
sed -i "s#arcade.o ##g" Makefile.linux
rm arcade.c
#I get undefined references for this file
sed -i "s# os_init.o##g" Makefile.linux
rm os_init.c
#I get undefined references for this file
sed -i "s# intro.o##g" Makefile.linux
rm intro.c
#I get undefined references for this file
sed -i "s#teams.o ##g" Makefile.linux
rm teams.c
#I get undefined references for this file
sed -i "s#loops.o ##g" Makefile.linux
rm loops.c
#I get undefined references for this file
sed -i "s# wc.o##g" Makefile.linux
rm wc.c
###I get undefined references for this file
##sed -i "s#etw.o ##g" Makefile.linux
##rm etw.c
#I get undefined references for this file
sed -i "s#main.o ##g" Makefile.linux
rm main.c
#I get undefined references for this file
sed -i "s#control.o ##g" Makefile.linux
rm control.c
#I get undefined references for this file
sed -i "s#arbitro.o ##g" Makefile.linux
rm arbitro.c
#this file doesnt exist
sed -i "s# os_squadre.o##g" Makefile.linux
#I get undefined references for this file
sed -i "s# network.o##g" Makefile.linux
rm network.c
#I get undefined references for this file
sed -i "s# special.o##g" Makefile.linux
rm special.c
#I get undefined references for this file
sed -i "s#connection.o ##g" Makefile.linux
rm connection.c
#I get undefined references for this file
sed -i "s#replay.o ##g" Makefile.linux
rm replay.c
#I get undefined references for this file
sed -i "s#menu_config.o ##g" Makefile.linux
rm menu_config.c
#I get undefined references for this file
sed -i "s#sound.o ##g" Makefile.linux
rm sound.c
#I get undefined references for this file
sed -i "s#font.o ##g" Makefile.linux
rm font.c
#I get undefined references for this file
sed -i "s#gfx.o ##g" Makefile.linux
rm gfx.c
#These files don't exist
sed -i "s#menu_##g" Makefile.linux
sed -i "s#generic_video.odata.o##g" Makefile.linux
sed -i "s#menu_velocita_g.o ##g" Makefile.linux
make