VIM For Programmers
===================

A complete `vim` plugin collection. 

### Sample Screenshot

![alt text](https://raw.github.com/pokoot/vim/master/windows.png "Vim Editor")

### Features

* `F4` = nerdtree
* `F5` = tagbar
* `F6` = prints the current time
* `F8` = find trailing white spaces
* `Control + d` = Php documentor
* `Control + spacebar` = syntax auto completion
* `Control + p` = file finder
* `\<leader\> + sf` = Sql formatter
* Auto highlight trailing white spaces
* Auto strip white spaces on save
* Code syntax checker


## LINUX INSTALLATION



### Backup .vim

    cd ~
    mv .vim .vim.backup
    mkdir .vim

### Install Pathogen

    mkdir ~/.vim/autoload
    curl -Sso ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim


### Clone repository files as a Pathogen bundle

    cd ~/.vim
    git clone https://github.com/pokoot/vim bundle

### Update all submodules

    cd ~/.vim/bundle
    git submodule update --init --recursive
    
### Copy vimrc

    cd ~/.vim/bundle
    cp .vimrc ../.vimrc

## WINDOWS INSTALLATION

> Manuall installtion is preferred

    Copy .vimrc to C:\Program Files\Vim\_vimrc
    
    Move all the files that contains in the repository to:
        C:\Program Files (x86)\Vim\vimfiles\bundle






