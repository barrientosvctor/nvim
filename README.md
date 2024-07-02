# Victor's Neovim configuration

## Must-have requeriments

* [Neovim](https://neovim.io/) >= **0.9.2** version.
* [Fzf](https://github.com/junegunn/fzf) > **0.25**

## Suggested requeriments

* [Python3](https://www.python.org/downloads/).
* [git-scm](https://git-scm.com/) >= **2.19.0** version.
* `tar` and `curl` commands in path for [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter).
* a C compiler: this is necessary for [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) (the compiler should be in path).
* [ripgrep](https://github.com/BurntSushi/ripgrep): required for [fzf-lua](https://github.com/ibhagwan/fzf-lua?tab=readme-ov-file#dependencies)'s `live_grep` and `tags_grep` commands.

### Optional requeriments

* [fd](https://github.com/sharkdp/fd): for [fzf-lua](https://github.com/ibhagwan/fzf-lua?tab=readme-ov-file#dependencies)'s finder.

## Installation

**1.** Clone repository.

> Unix, Linux

```shell
$ git clone --depth 1 https://github.com/barrientosvctor/nvim.git ~/.config/nvim
```

> Windows Powershell

```powershell
$ git clone https://github.com/barrientosvctor/nvim.git "$env:LOCALAPPDATA\nvim"
```

**2.** Install Neovim submodules.

> Unix, Linux

```shell
$ chmod u+x ./scripts/actions.sh
$ ./scripts/actions.sh 1
```

> Windows Powershell

```powershell
$ ./scripts/actions.ps1 -Action 1
```

## Notes

### LSP

* If you want to install a new language server. Make sure to first adding it to [lsp config](/plugin/lspconfig.lua) file. Then restart Neovim. The language server will download automatically and ready to use.

If you don't know how to configure any language server, take a look at this [documentation](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md).
