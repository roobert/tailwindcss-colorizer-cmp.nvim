local M = {}

---@param str string: string to check
---@return boolean: true if extra prefix
function M.check_extra_prefix(str)
  if
    str == "x"
    or str == "y"
    or str == "t"
    or str == "b"
    or str == "l"
    or str == "r"
  then
    return true
  else
    return false
  end
end

return M
