## pldaily-vim

### 安装

```bash
git clone https://github.com/PLDaily/pldaily-vim.git
sh pldaily-vim/bootstrap.sh
```

### 语言插件选择

- .vim.bundles

```vim
let g:spf13_bundle_groups=['general', 'writing', 'neocomplete', 'programming', 'go', 'javascript', 'html', 'misc']
```

### 添加新插件

`.vim.bundles` 文件新加新插件，执行 `vim +BundleInstall! +BundleClean +q`

### 编辑配置文件

`<Leader>ev`  打开配置文件

`<Leader>sv`  执行配置文件

### coc 模块报错

```sh
cd ~/.vim/bundle/coc.nvim
sudo sh install.sh
```
