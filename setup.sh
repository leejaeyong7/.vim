#!/bin/bash
# installer for vim

# install silver searcher-ag
sudo apt-get install silversearcher-ag

# install universal ctag
cd ./ctags
bash autogen.sh
./configure
make -j && sudo make install

# install silver searcher ag
sudo apt-get install silversearcher-ag

# move vimrc file to home directory
mv ~/.vim/.vimrc ~/
