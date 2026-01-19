#### 克隆环境

```
conda create --name myclone --clone myenv
```

#### 恢复环境

列出历史记录：`conda list --revisions`

恢复到以前版本：`conda install --revision=REVNUM` 或 `conda install --rev REVNUM`

#### 嵌套激活

```
conda activate --stack myenv
```

这会保存上一个环境的环境变量。

如果安装了一些 util 命令行工具在 base 环境，可以设置：

```
conda config --set auto_stack 1
```

这将始终保留从外到内的第1层环境的环境变量。不建议设置大于1 的数值，会导致混乱。

#### 包指定规范

官方文档： https://docs.conda.org.cn/projects/conda/en/stable/user-guide/concepts/pkg-search.html

这些规范支持 conda install / conda search.

```bash
channel/subdir::name version build
```

- **channel**

  （可选）可以是通道名称或 URL。通道名称可以包含字母、数字、破折号和下划线。

- **subdir**

  （可选）通道的子目录。许多子目录用于架构，但这并非必需。必须在前面加上通道和反斜杠。例如：`main/noarch`

- **name**

  （必需）包名称。可以包含 `*` 通配符。例如，`*py*` 返回所有名称中包含 “py” 的包，例如 “numpy”、“pytorch”、“python” 等。

- **version**

  （可选）包版本。可以包含 `*` 通配符或单引号中的版本范围。例如：`numpy=1.17.*` 返回所有版本包含 “1.17.” 的 numpy 包，而 `numpy>1.17,<1.19.2` 返回所有版本大于 1.17 且小于 1.19.2 的 numpy 包。

- **build**

  （可选）包构建名称。可以包含 `*` 通配符。例如，`numpy 1.17.3 py38*` 返回所有版本为 1.17.3 且构建名称包含文本 “py38” 的 numpy 包。

也可以使用键值对

```
$ conda search "numpy[channel=conda-forge, subdir=linux-64, version=1.17.*, build=py38*]"
```

键值对列表：

```
- build                # validated via GlobStrMatch
- build_number         # validated via BuildNumberMatch
- channel              # validated via ChannelMatch
- features             # validated via FeatureMatch
- fn                   # validated via ExactStrMatch
- license              # validated via CaseInsensitiveStrMatch
- license_family       # validated via CaseInsensitiveStrMatch
- md5                  # validated via ExactStrMatch
- name                 # validated via GlobLowerStrMatch
- sha256               # validated via ExactStrMatch
- subdir               # validated via ExactStrMatch
- track_features       # validated via FeatureMatch
- url                  # validated via ExactStrMatch
- version              # validated via VersionSpec
```