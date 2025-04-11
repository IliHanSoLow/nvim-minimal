is_windows = string.find(vim.loop.os_uname().version, "Windows") ~= nil

if vim.g.vscode then
  if (is_windows) then
    vim.cmd("source ~\\AppData\\Local\\nvim\\vscode\\settings.vim")
    vim.cmd("set clipboard=unnamedplus")
  else
    vim.cmd("source ~/.config/nvim/vscode/settings.vim")
  end
else
  require("pre-init")
  require("general")
  require("keymaps")
end
