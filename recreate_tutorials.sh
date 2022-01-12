#!/bin/sh

rm -f *.ipynb audio/*

git clone --recursive https://github.com/MTG/essentia.git
git -C essentia describe > VERSION

find essentia/ -name "*.ipynb" -exec sed -i "s/\.\.\/\.\.\/\.\.\/test\/audio\/recorded/audio/g" {} +
mv essentia/src/examples/python/tutorial*.ipynb .
mv essentia/src/examples/python/essentia_python_tutorial.ipynb .
mv essentia/test/audio/recorded/* audio/

rm -rf essentia
