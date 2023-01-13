M = {}

M.formatter = function(entry, vim_item)
  if vim.tbl_contains({ 'nvim_lsp' }, entry.source.name) then
    if vim_item.kind ~= "Color" then
      return vim_item
    end

    -- FIXME:
    -- starts with text- bg- from- fill-
    -- if vim_item.word  "Color" then
    --   return vim_item
    -- end

    local words = {}
    for word in string.gmatch(vim_item.word, "[^-]+") do
      table.insert(words, word)
    end

    -- FIXME: for xyz-x/y..
    local color_name = words[2]
    local color_number = words[3]

    if not color_name or not color_number then
      return vim_item
    end

    local color_index = tonumber(color_number)

    local tailwindcss_colors = require("tailwindcss-colorizer-cmp.colors").TailwindcssColors

    if not tailwindcss_colors[color_name] then
      return vim_item
    end

    -- FIXME:
    local color_table = tailwindcss_colors[color_name]

    if not color_table[color_index] then
      return vim_item
    end

    local color = color_table[color_index]

    local hl_group = "lsp_documentColor_mf_" .. color

    vim.api.nvim_set_hl(0, hl_group, { fg = "#" .. color, bg = "#" .. color })

    vim_item.kind_hl_group = hl_group

    return vim_item
  end

  return vim_item
end

return M
