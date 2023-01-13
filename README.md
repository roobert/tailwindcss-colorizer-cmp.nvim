# :rainbow: TailwindCSS Colorizer CMP

![tailwindcss-colorizer-cmp.nvim Screenshot](https://user-images.githubusercontent.com/226654/212398203-a4d09543-e313-46db-b6b8-a3d8c6ad4e78.gif)


A Neovim plugin to add VS-Code-style TailwindCSS color hints to the `nvim-cmp` completion menu.

## :rocket: Usage

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
