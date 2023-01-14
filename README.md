# :rainbow: TailwindCSS Colorizer CMP

![tailwindcss-colorizer-cmp Screenshot](https://user-images.githubusercontent.com/226654/212444311-3dcf5f94-64d0-40a3-9b39-ec6df2296da9.gif)

A Neovim plugin to add [vs-code-style TailwindCSS color hints](https://tailwindcss.com/docs/editor-setup#intelli-sense-for-vs-code) to the `nvim-cmp` completion menu.

## :rocket: Installation

### Packer.nvim

``` lua
use({ "roobert/tailwindcss-colorizer-cmp.nvim" })
```

### Lazy.nvim

``` lua
{ "roobert/tailwindcss-colorizer-cmp.nvim" }
```

## :hammer_and_wrench: Usage

### Standard Neovim

``` lua
require("cmp").config.formatting = {
    format = require("tailwindcss-colorizer-cmp").formatter
}
```

### LunarVim

``` lua
lvim.builtin.cmp.formatting = {
    format = require("tailwindcss-colorizer-cmp").formatter
}
```
