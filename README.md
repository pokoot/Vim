VIM For Programmers
===================

A complete `vim` plugin collection. 

### Sample Screenshot

![alt text](https://raw.github.com/pokoot/vim/master/windows.png "Vim Editor")


## LINUX INSTALLATION



### Backup .vim

    cd ~
    mv .vim .vim.backup
    mkdir .vim

### Install Pathogen

    mkdir ~/.vim/autoload
    curl -Sso ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim


### Clone repo files as a Pathogen bundle

    cd ~/.vim
    git clone git@github.com:pokoot/vim.git bundle

### Update all submodules

    cd ~/.vim/bundle
    git submodule update --init --recursive
    
### Copy vimrc

    cd ~/.vim/bundle
    cp .vimrc ../.vimrc

## WINDOWS INSTALLATION








