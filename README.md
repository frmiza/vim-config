#### Guide instalation

##### Copy/Paste suport
###### debian
>sudo apt install xsel

###### arch
>sudo pacman -S xsel

##### Python suport
>pip install pynvim

##### Node suport 
npm i -g neovim

#### Note 
If you use virtual environments, I recommend put thus variables in paths.vim and make sure to add in your init.vim
##### For python
>let g:python3_host_prog = expand("<path to python with pynvim installed>")

##### For node 
>let g:node_host_prog = expand("<path to node with neovim installed>")
