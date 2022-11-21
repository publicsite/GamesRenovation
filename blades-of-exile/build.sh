#!/bin/sh

mkdir build
cd build

tar -xf ../Download/*.tar.gz

cp -a ../Download/cboe .

cd TGUI-*
echo "set(TGUI_BACKEND SFML_GRAPHICS)" > CMakeLists.txt.new
cat CMakeLists.txt >> CMakeLists.txt.new
mv CMakeLists.txt CMakeLists.txt.old
mv CMakeLists.txt.new CMakeLists.txt

tgui_dir="$PWD"
mkdir build
cd build
cmake ..
make
cd ../../

cd cboe

rm -rf test

sed -i "s#c++14#c++17#g" SConstruct

#find . -type f -exec sed -i "s#tgui::Gui#tgui::gui#g" {} \;

scons CXXFLAGS="-I${tgui_dir}/include" LINKFLAGS="-L${tgui_dir}/build/lib"
