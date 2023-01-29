# :rainbow: TailwindCSS Colorizer CMP

![tailwindcss-colorizer-cmp Screenshot](https://user-images.githubusercontent.com/226654/212444311-3dcf5f94-64d0-40a3-9b39-ec6df2296da9.gif)

A Neovim plugin to add [vs-code-style TailwindCSS color hints](https://tailwindcss.com/docs/editor-setup#intelli-sense-for-vs-code) to the `nvim-cmp` completion menu.

## :rocket: Installation

### Packer.nvim

``` lua
use({
  "roobert/tailwindcss-colorizer-cmp.nvim",
  -- optionally, override the default options:
  config = function()
    require("tailwindcss-colorizer-cmp").setup({
      color_square_width = 2,
    })
  end
})
```

### Lazy.nvim

``` lua
{
  "roobert/tailwindcss-colorizer-cmp.nvim",
  -- optionally, override the default options:
  config = function()
    require("tailwindcss-colorizer-cmp").setup({
      color_square_width = 2,
    })
  end
}
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

## :heart: Related

If you'd also like color highlighting in the buffer, please see: [NvChad/nvim-colorizer.lua](https://github.com/NvChad/nvim-colorizer.lua)
