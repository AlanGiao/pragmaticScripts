## Ctags 用法教程

古老的 ctags 不支持 Python 等新语言，所以本文用的是 Universal Ctags （uctags）这个软件。

### 生成 TAGS 文件

```bash
ctags -R --languages=Python .
```

### 在 VIM 中实现跳转

`Ctrl+]`: 跳转到函数实现处。

`Ctrl+t`: 返回到跳转前的位置。