# :rainbow: TailwindCSS Colorizer CMP

![tailwindcss-colorizer-cmp Screenshot](https://user-images.githubusercontent.com/226654/212435006-79c8bc44-547d-4424-b73e-b1c66d82f4c4.gif)

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
