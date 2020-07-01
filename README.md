## My Vim Config

![](https://raw.githubusercontent.com/PLDaily/pldaily-vim/master/screenshot.jpg)

### 安装配置

> 克隆项目

```shell
git clone https://github.com/PLDaily/pldaily-vim.git ~/.vim
```

> 执行 shell

```shell
cd ~/.vim && sh bootstrap.sh
```

### Coc.nvim 插件

> 安装

```vim
:CocInstall coc-json coc-html coc-css coc-tsserver
```

> 查看

```vim
:CocList extensions
```

### 编辑配置文件

`<Leader>ev`  打开配置文件

`<Leader>sv`  执行配置文件

`:PlugInstall` 安装配置