vim
===

A complete vim plugin collection. The plugin collection includes most of the popular plugin as a web programmer.


## Backup VIM
cd ~
mv .vim .vim.backup
mkdir .vim

## Install pathogen
mkdir ~/.vim/autoload
curl -Sso ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim

## Clone repo files as pathogen bundle
cd ~/.vim
git clone git@github.com:pokoot/vim.git bundle

## Update all submodules
cd ~/.vim/bundle
git submodule update --init --recursive





