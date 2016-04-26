#!/bin/bash

./configure --with-features=huge \
            --enable-multibyte \
            --enable-rubyinterp \
            --enable-largefile \
            --enable-pythoninterp \
            --with-python-config-dir=/usr/lib/python2.7/config \
            --enable-perlinterp \
            --enable-luainterp \
            --enable-gui=gtk2 \
            --enable-cscope \
            --prefix=/usr \
            --srcdir=. \
            --cache-file=auto/config.cache \
            --enable-fail-if-missing
