# Victor's Neovim configuration

## Must-have requeriments

* [Neovim](https://neovim.io/) >= **0.9.2** version.
* [Fzf](https://github.com/junegunn/fzf) >= **0.25** version.

## Suggested requeriments

* [Python3](https://www.python.org/downloads/).
* [git-scm](https://git-scm.com/) >= **2.19.0** version.
* `tar` and `curl` commands in path for [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter).
* a C compiler: this is necessary for [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) (the compiler should be in path).

## Installation

**1.** Clone the repository.

> Unix, Linux

```shell
$ git clone --depth 1 https://github.com/barrientosvctor/nvim.git ~/.config/nvim
```

> Windows Powershell

```powershell
$ git clone https://github.com/barrientosvctor/nvim.git "$env:LOCALAPPDATA\nvim"
```

**2.** Open Neovim.

```shell
$ nvim
```

## Notes

### LSP

* If you want to install a new language server, use Mason. Then configure the
language server using lspconfig. If you don't know how to configure any language server, look at [server configurations](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md).

#### Mason

* To automatically install the packages which aren't installed. Just type
`:Mason`. (If doesn't find some package, just reopen neovim and retype this command)

* If you want to add a new package in the **ensure installed** list, just add
the name of whose Mason package in the [Mason config](https://github.com/barrientosvctor/nvim/blob/main/lua/plugins/mason.lua#L8).
