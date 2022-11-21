#!/bin/sh

mkdir build

cp -a Download/planetblupi build/

cd build/planetblupi

sed -i "s@#include <SDL.h>@#include <SDL2/SDL.h>@g" src/blupi.h
sed -i "s@#include <SDL.h>@#include <SDL2/SDL.h>@g" src/pixmap.h
sed -i "s@#include <SDL_rwops.h>@#include <SDL2/SDL_rwops.h>@g" src/movie.cxx
sed -i "s@#include <SDL_stdinc.h>@#include <SDL2/SDL_stdinc.h>@g" src/def.h
sed -i "s@#include <SDL_stdinc.h>@#include <SDL2/SDL_stdinc.h>@g" src/display.h
sed -i "s@#include <SDL_stdinc.h>@#include <SDL2/SDL_stdinc.h>@g" src/decgoal.h
sed -i "s@#include <SDL_stdinc.h>@#include <SDL2/SDL_stdinc.h>@g" src/decmove.h
sed -i "s@#include <SDL_stdinc.h>@#include <SDL2/SDL_stdinc.h>@g" src/fifo.cxx
sed -i "s@#include <SDL_log.h>@#include <SDL2/SDL_log.h>@g" src/misc.cxx
sed -i "s@#include <SDL_mouse.h>@#include <SDL2/SDL_mouse.h>@g" src/misc.cxx
sed -i "s@#include <SDL_image.h>@#include <SDL2/SDL_image.h>@g" src/blupi.cxx
sed -i "s@#include <SDL_image.h>@#include <SDL2/SDL_image.h>@g" src/pixmap.cxx
sed -i "s@#include <SDL_image.h>@#include <SDL2/SDL_image.h>@g" src/movie.cxx
sed -i "s@#include <SDL_ttf.h>@#include <SDL2/SDL_ttf.h>@g" src/blupi.cxx
sed -i "s@#include <SDL_ttf.h>@#include <SDL2/SDL_ttf.h>@g" src/text.cxx
sed -i "s@#include <SDL_mixer.h>@#include <SDL2/SDL_mixer.h>@g" src/sound.h
sed -i "s@#include <SDL_video.h>@#include <SDL2/SDL_video.h>@g" src/display.cxx
mkdir build

cd build

cmake ..

make