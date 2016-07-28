#!/bin/sh -e

cd ./mecab/mecab
bash ./autogen.sh
make
make install
ldconfig

cd ../mecab-ipadic
./configure --with-charset=utf8
make
make install
ldconfig
