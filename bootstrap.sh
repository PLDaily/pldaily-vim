# 安装 ag
brew install ag

# 安装字体
brew tap homebrew/cask-fonts
brew cask install font-fira-code

# 设置软连接
ln -sf ~/.vim/.vimrc ~/.vimrc

# 安装 vim 插件
vim +PlugInstall +qall

