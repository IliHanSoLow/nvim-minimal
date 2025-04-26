vim.diagnostic.config({
  -- virtual_lines = true,
  virtual_text = true,
})

vim.keymap.set("n", "<space>qe", vim.diagnostic.setqflist)

vim.keymap.set("n", "<leader>k", function()
  local config = vim.diagnostic.config()
  vim.diagnostic.config({
    virtual_lines = not config.virtual_lines,
    virtual_text = config.virtual_lines, -- inverse of virtual_lines
  })
end, { desc = "Toggle virtual lines for diagnostics" })
