vim.opt.shiftwidth = 4
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.shell = "bash"
vim.wo.wrap = false

-- vim.opt.background = "light"
vim.opt.background = "dark"

-- Remove trailing spaces
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})

-- local function gammastep_night()
--   local command = "gammastep -p 2>&1| grep 'Night'"
--   local result = os.execute(command)
--   return result == true or result == 0
-- end

-- if gammastep_night() then
--   vim.opt.background = "dark"
-- else
--   vim.opt.background = "light"
-- end
-- -- vim.opt.background = "dark"

vim.api.nvim_create_user_command('W', 'w', {})
vim.api.nvim_create_user_command('Q', 'q', {})

vim.opt.undofile = true
local undodir = vim.fn.expand("~/.local/share/nvim-minimal/undo")
vim.opt.undodir = undodir
if vim.fn.isdirectory(undodir) == 0 then
  vim.fn.mkdir(undodir, 'p')
end
vim.opt.undolevels = 1000
vim.opt.undoreload = 10000
