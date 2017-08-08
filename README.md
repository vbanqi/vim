# vim
This is my vim environment for c++

# install
1,You must install 'vim','git','ctags','python','gcc','g++','vbundle',for example on ubuntu:
```
	sudo apt-get install vim git ctags python gcc g++ 
	git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```
2,Copy vimrc in your home dir,on ubuntu:
```
	scp vimrc youname@ip:~/.vimrc
```
3,Engage in your vim, then input ':PluginInstall' on command visaul:
```
	vim :PluginInstall
```
  This command will take serverial minutes
4,Install YouCompleteMe plugin:
```
cd ~/.vim/bundle/YouCompleteMe
python install.py --clang-completer
```
  This will compile the YouCompleteMe plugin ,will take a long time
	
# shortcut key
```
ctrl+p	//open ctrlp plugin for find files
,+s	//similar to the command ':cs find s **',this will find the word that cursor pointer at
,gg	//go to the defination
,gi	//go to the include file --must move cursor to the '#inlcude' line
F2	//open the nerdtree
F4	//open the tags
...
```
