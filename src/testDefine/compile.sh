#!/bin/zsh -e
rm -rf build
mkdir build
cd build
cmake ..
make
./main