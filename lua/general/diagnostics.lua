vim.diagnostic.config({
  -- virtual_lines = true,
  virtual_text = true,
})

vim.keymap.set("n", "<space>qe", vim.diagnostic.setqflist)
