#!/bin/sh

mkdir build

cd build

tar -xf ../Download/fillets-ng-data-1.0.1.tar.gz
tar -xf ../Download/fillets-ng-1.0.1.tar.gz

##update to lua 5.4
#patch -p1 < ../patches/ScriptState.cpp.patch #this is for lua
#sed -i "s#luaL_checkint#luaL_checkinteger#g" fillets-ng-1.0.1/src/gengine/options-script.cpp
#sed -i "s#luaL_checkint#luaL_checkinteger#g" fillets-ng-1.0.1/src/plan/dialog-script.cpp
#sed -i "s#luaL_optint#luaL_optinteger#g" fillets-ng-1.0.1/src/plan/dialog-script.cpp
#sed -i "s#luaL_checkint#luaL_checkinteger#g" fillets-ng-1.0.1/src/state/demo-script.cpp
#sed -i "s#luaL_checkint#luaL_checkinteger#g" fillets-ng-1.0.1/src/level/game-script.cpp
#sed -i "s#luaL_optint#luaL_optinteger#g" fillets-ng-1.0.1/src/level/game-script.cpp
#sed -i "s#luaL_checkint#luaL_checkinteger#g" fillets-ng-1.0.1/src/level/level-script.cpp
#sed -i "s#luaL_checkint#luaL_checkinteger#g" fillets-ng-1.0.1/src/menu/worldmap-script.cpp

cd fillets-ng-1.0.1

sed -i "s#\-I\$LUAPFX#\-I\$LUAPFX/include/lua5\.1#g" configure.in
sed -i "s#\-L\$LUAPFX \-llua \-llualib#\-llua5\.1#g" configure.in
find . -name "*.h" -exec sed -i "s@#include \"lua.h\"@#include \"lua5.1/lua.h\"@g" {} \;
find . -name "*.h" -exec sed -i "s@#include \"lualib.h\"@#include \"lua5.1/lualib.h\"@g" {} \;
find . -name "*.h" -exec sed -i "s@#include \"lauxlib.h\"@#include \"lua5.1/lauxlib.h\"@g" {} \;
find . -name "*.cpp" -exec sed -i "s@#include \"lauxlib.h\"@#include \"lua5.1/lauxlib.h\"@g" {} \;
find . -name "*.cpp" -exec sed -i "s@#include \"lua.h\"@#include \"lua5.1/lua.h\"@g" {} \;
find . -name "*.cpp" -exec sed -i "s@#include \"lualib.h\"@#include \"lua5.1/lualib.h\"@g" {} \;

find . -name "*.h" -exec sed -i "s@#include \"SDL.h\"@#include \"SDL/SDL.h\"@g" {} \;
find . -name "*.cpp" -exec sed -i "s@#include \"SDL.h\"@#include \"SDL/SDL.h\"@g" {} \;

autoreconf -vfi

./configure --with-lua=/usr CXXFLAGS="-I/usr/include/SDL -fpermissive"

make