vim.keymap.set("n", "<space>rr", function()
  local file = vim.api.nvim_buf_get_name(0)
  vim.cmd("!" .. vim.fn.shellescape(file))
end)
