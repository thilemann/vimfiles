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

Credits
========
Special thanks goes out to Amir Salihefendic, where the initial configuration originates from.
http://amix.dk/vim/vimrc.html
