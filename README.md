# Victor's Neovim configuration

## Must-have requeriments

* [Neovim](https://neovim.io/) >= **0.9.2** version.

## Suggested requeriments

* [Python3](https://www.python.org/downloads/).
* [git-scm](https://git-scm.com/) >= **2.19.0** version.
* `tar` and `curl` commands in path for [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter).
* a C compiler: this is necessary for [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) (the compiler should be in path).
* [ripgrep](https://github.com/BurntSushi/ripgrep): required for [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)'s `live_grep` and `tags_grep` commands.

### Optional requeriments

* [fd](https://github.com/sharkdp/fd): for [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)'s finder.

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
`:Mason`.

* If you want to add a new package in the **ensure installed** list, just add
the name of whose Mason package in the [Mason config](https://github.com/barrientosvctor/nvim/blob/main/lua/plugins/mason.lua#L8).

### Devicons

* If you have installed any [Nerd Font](https://www.nerdfonts.com/) font and if your terminal emulator of
  your preference can support Nerd Font icons, make sure to enable devicons
plugin [here](https://github.com/barrientosvctor/nvim/blob/main/lua/config/settings.lua#L10) for better programming experience.

`vim.g.enable_devicons = true`
