M = {}

M.formatter = function(entry, vim_item)
  local max_width = 0

  if max_width ~= 0 and #vim_item.abbr > max_width then
    vim_item.abbr = string.sub(vim_item.abbr, 1, max_width - 1) .. lvim.icons.ui.Ellipsis
  end

  if lvim.use_icons then
    vim_item.kind = lvim.builtin.cmp.formatting.kind_icons[vim_item.kind]

    if entry.source.name == "copilot" then
      vim_item.kind = lvim.icons.git.Octoface
      vim_item.kind_hl_group = "CmpItemKindCopilot"
    end

    if entry.source.name == "cmp_tabnine" then
      vim_item.kind = lvim.icons.misc.Robot
      vim_item.kind_hl_group = "CmpItemKindTabnine"
    end

    if entry.source.name == "crates" then
      vim_item.kind = lvim.icons.misc.Package
      vim_item.kind_hl_group = "CmpItemKindCrate"
    end

    if entry.source.name == "lab.quick_data" then
      vim_item.kind = lvim.icons.misc.CircuitBoard
      vim_item.kind_hl_group = "CmpItemKindConstant"
    end

    if entry.source.name == "emoji" then
      vim_item.kind = lvim.icons.misc.Smiley
      vim_item.kind_hl_group = "CmpItemKindEmoji"
    end
  end

  vim_item.menu = lvim.builtin.cmp.formatting.source_names[entry.source.name]
  vim_item.dup = lvim.builtin.cmp.formatting.duplicates[entry.source.name]
      or lvim.builtin.cmp.formatting.duplicates_default

  if vim.tbl_contains({ 'nvim_lsp' }, entry.source.name) then
    local words = {}
    for word in string.gmatch(vim_item.word, "[^-]+") do
      table.insert(words, word)
    end

    if #words < 3 or #words > 4 then
      return vim_item
    end

    local color_name, color_number
    if words[2] == "x" or words[2] == "y" then
      color_name = words[3]
      color_number = words[4]
    else
      color_name = words[2]
      color_number = words[3]
    end

    if not color_name or not color_number then
      return vim_item
    end

    local color_index = tonumber(color_number)
    local tailwindcss_colors = require("tailwindcss-colorizer-cmp.colors").TailwindcssColors

    if not tailwindcss_colors[color_name] then
      return vim_item
    end

    if not tailwindcss_colors[color_name][color_index] then
      return vim_item
    end

    local color = tailwindcss_colors[color_name][color_index]

    local hl_group = "lsp_documentColor_mf_" .. color
    vim.api.nvim_set_hl(0, hl_group, { fg = "#" .. color, bg = "#" .. color })
    vim_item.kind_hl_group = hl_group

    return vim_item
  end

  return vim_item
end

return M
