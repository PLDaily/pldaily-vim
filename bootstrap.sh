# 安装 rg
brew install ripgrep

# 安装字体
brew tap homebrew/cask-fonts
brew cask install font-meslo

# 设置软连接兼容 neovim
ln -sf ~/.vim/.vimrc ~/.vimrc
ln -s ~/.vimrc ~/.vim/init.vim
ln -s ~/.vim ~/.config/nvim

# 安装 vim 插件
vim +PlugInstall +qall
