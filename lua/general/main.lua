vim.opt.shiftwidth = 4
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.shell = "bash"

-- Remove trailing spaces
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})

local function gammastep_night()
  local command = "gammastep -p 2>&1| grep 'Night'"
  local result = os.execute(command)
  return result == true or result == 0
end

if gammastep_night() then
  vim.opt.background = "dark"
else
  vim.opt.background = "light"
end
