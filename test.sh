#!/bin/sh
# docker-compose build generator
# docker-compose run --rm generator
docker build -t generator .
docker run --rm -it -v $(pwd):/mnt generator

cp -rf ftdetect/* ~/.vim/ftdetect/
cp -rf syntax/* ~/.vim/syntax/
# cp -rf ftdetect/* ~/.config/nvim/ftdetect/
# cp -rf syntax/* ~/.config/nvim/syntax/
