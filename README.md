Arkham's vim configuration
==========================

My configuration uses [NeoBundle](https://github.com/Shougo/neobundle.vim).
(But you don't need to care about any of that.)

## Installation:

Prerequisites: ruby, git.

1. Move your existing configuration somewhere else:
   `mv ~/.vim* ~/.gvim* my_backup`
2. Clone this repo into ".vim":
   `git clone https://github.com/Arkham/vimfiles ~/.vim`
3. Go into ".vim" and run "rake":
   `cd ~/.vim && rake`

This will install "~/.vimrc" and "~/.gvimrc" symlinks that point to
files inside the ".vim" directory.

## Features:

* For vim:
  - use NeoBundle as plugin environment
  - sane defaults: nocompatible mode, utf8, advanced syntax highlighting
  - 2 spaces, no tabs, uses bash-alike autocompletion for files and directories
  - tabs are displayed as `▸ `, end of lines as `¬`, trailing spaces as `.`
  - incremental, case-insensitive search
  - handful hard wrapping for text and markdown
  - follow style conventions for ruby, python and makefiles
  - reopen files in the same spot where you closed them
  - 'Leader' character mapped to "," (comma)
  - pressing enter in normal mode resets search highlighting
  - %% is expanded to the current directory in command mode
  - `,e` edits a file in the same directory of the current
  - `,f` opens file search via :CommandT plugin
  - `,,` switches between two last buffers
  - `,cf` jumps to the first conflict marker
  - `,l` toggles list mode
  - `,p` copies the path of the current file
  - `,kw` or `:KillWhitespace` removes all trailing spaces
  - `<C-j/k/h/l>` switches between windows (no need to prepend `<C-w>`)
  - cursor keys for movement disabled!
  - nice looking status line
  - awesome configurations for Ack, CommandT, Nerdtree and more..

## Plugins:

* Arkham/vim-quickfixdo
* Arkham/vim-tango
* Arkham/vim-vividchalk
* bling/vim-airline
* chriseppstein/vim-haml
* ervandew/supertab
* godlygeek/tabular
* hynek/vim-python-pep8-indent
* kchmck/vim-coffee-script
* mileszs/ack.vim
* pangloss/vim-javascript
* scrooloose/nerdtree
* sjl/gundo.vim
* slim-template/vim-slim
* thinca/vim-visualstar
* thoughtbot/vim-rspec
* tpope/vim-abolish
* tpope/vim-commentary
* tpope/vim-endwise
* tpope/vim-eunuch
* tpope/vim-fugitive
* tpope/vim-markdown
* tpope/vim-rails
* tpope/vim-repeat
* tpope/vim-surround
* tpope/vim-unimpaired
* vim-ruby/vim-ruby
* vim-scripts/YankRing.vim
* wincent/Command-T
