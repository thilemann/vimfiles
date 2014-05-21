This is still a work-in-progress!

Configuration
========
Add a _vimrc file in your home directory containing the following:

```
" What system are we on?
" Can return windows, unix or mac
fun! MySys()
  return "windows"
endfun

set runtimepath=~/vimfiles,$VIMRUNTIME
source ~/vimfiles/_vimrc
```

Download and install the following system fonts to enable special characters in statusbar.
https://github.com/eugeneching/consolas-powerline-vim

Usage
========
More info will come!

Plugins
========
More info will come!

Credits
========
Special thanks goes out to Amir Salihefendic, where the initial configuration originates from.
http://amix.dk/vim/vimrc.html
