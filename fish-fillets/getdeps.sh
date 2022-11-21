#!/bin/sh

sudo apt-get -y install lua5.1 liblua5.1-0-dev libsdl-ttf2.0-dev libsdl-image1.2-dev libsdl-mixer1.2-dev libsdl1.2-compat-dev

cd /usr/include

sudo ln -s lua5.2/lua.h lua.h
sudo ln -s lua5.2/lauxlib.h lauxlib.h