
#### Introduct
&emsp; nvim ide for golang, 主要针对`go`语言做了一些优化.当然也可以用作`c/c++`,`python`,`rust`等语言的IDE.
&emsp; 魔改版<根据gonvim配置进行了自定义配置>
![预览](./images/dashboard.jpg)

#### 安装
&emsp;首先您需要先安装nvim(建议neovim版本0.7以上版本)
*下载fucknvim*
```bash
$ git clone https://github.com/3Xpl0it3r/gonvim.git
```

*建议备份原始nvim配置文件*
```bash
cp -rf ~/.conf/nvim  ${HOME}/.conf/nvim_back
```

*安装nvim配置文件*
> 安装过程最好打开科学上网
```bash
# 安装
$ ln -sv gonvim ~/.conf/nvim
$ nvim
```

&emsp;插件安装失败处理
```bash
# 手动安装packer
$ git clone --depth 1 https://github.com/wbthomason/packer.nvim\\n ~/.local/share/nvim/site/pack/packer/start/packer.nvim
# 同步插件
$ nvim +PackerSync
```

&emsp;安装gopls
```bash
$ go install golang.org/x/tools/gopls@latest
```

&emsp;安装gopks
&emsp;如果您可能会涉及到go语言,强烈建议您安装下gopks(codeaction里面import导入package路径会用到这个工具)
```bash 
$ go get github.com/3Xpl0it3r/gopkgs
```

&emsp;安装gotests
&emsp;`gotests`可以帮助您来自动生成单元测试代码, 通过`leader`<ca> 键来触发codeAction 选择GenTest 来自动生成单元测试
```bash
$ go get -u github.com/cweill/gotests/...
```

##### 快捷键
&emsp; leader键为空格键
![](./images/which-key.jpg)


#### Snippet支持功能
*补全输入两个字母就会自动触发,因此您不需要输入完整的trigger信息*
##### 所有文本补全
- `date`:       打印当前时间``
- `pwd`:        打印当前路径
- `.wrap(`:     xxx.wrap(  =>  (xxx)
- `wrap"`:      xxx.wrap" => "xxxx"
- `wrap'`:      xxx.wrap' => 'xxx'
- `wrap{`:      xxxx.wrap{ => {xxxx}
- `wrap[`:      xxxx.wrap[ =>  [xxxx]
- `wrap<`:      xxx.wrap< => <xxx>
- `APACHE`:     打印license信息

##### 针对go文件的补全
> 具体的含义您可以通过预览来查看每个snip生成的代码效果
- `pkgmain` 
- `fmain`
- `typ`
- `typi`
- `typs`
- `methodprt`
- `methodstruct`
- `impl`
- `\`json`
- '\`xml`
- `funcret`
- `funcnil`
- `forrange`
- `forindex`
- `forcondition`
- `fortrue`
- `ifcondition`
- `iferr`
- `ifnil`
- `ifelse`
- `ifdebug`
- `select`
- `switch`
- `gofunc`

*doc example *
![doc_example](./images/snip_doc_example.jpg)

![](./images/snipcode_tag.jpg)


#### CodeAction
![codeaction](./images/code_action_import_1.jpg)
![codeaction](./images/code_action_import_2.jpg)
![codeaction](./images/code_action_import_3.jpg)
![codeaction](./images/code_action_import_5.jpg)


#### DapUi
&emsp;dapui支持鼠标操作
![](./images/dap-ui.jpg)


#### 其他特性

##### notify显示lsp加载进度
![](./images/notify_lsp_status.jpg)

##### ome 补充
&emsp;在原有基础上进行了二次配置：
&emsp;1 开启鼠标
&emsp;2 开启buffline，并修改配置文件
&emsp;3 增加dracula theme
&emsp;4 修改部分快捷键
&emsp;5 增加nvim-lsp-installer,实现极简一键安装
&emsp;6 fature 准备增加nvim-tree的辅助功能快捷方式，比如增加删除文件(夹)

&emsp;ps: 字体采用goole字体Recursive,但是由于recusive不支持nerdfont,所以使用fontPatcher patcher了一下 
&emsp;地址在https://github.com/omigaZ/my-nerd-fonts


##### clipboard-provider is a script to handle copying and pasting, Which works with system clipboard, tmux and ssh
&emsp; mv ~/.config/nvim/clipboard-provider /usr/local/bin/

###### Note:
&emsp;configuration in tmux

&emsp;set -s set-clipboard external
&emsp;bind Escape copy-mode                                                              
&emsp;bind -T copy-mode-vi v send-keys -X begin-selection                                
&emsp;bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel 'clipboard-provider copy' 
&emsp;bind p run "tmux set-buffer \"$(clipboard-provider paste)\"; tmux paste-buffer -p"
