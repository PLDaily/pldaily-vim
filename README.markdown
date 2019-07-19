## 安装


```bash
cd $HOME/to/pldaily-vim/
sh bootstrap.sh
```

## 选择语言插件

- .vim.bundles


```vim
let g:spf13_bundle_groups=[\'general\', \'programming\', \'misc\', \'youcompleteme\']
```

## 新加插件

```
vim +BundleInstall! +BundleClean +q
```

## 编辑配置文件

`<Leader>ev`  打开配置文件并修改

`<Leader>sv`  执行配置文件
