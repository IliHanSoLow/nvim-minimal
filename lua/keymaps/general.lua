vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR>")

vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>")
vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>")

vim.keymap.set({ "n", "v" }, "<space>y", "\"+y")
vim.keymap.set({ "n", "v" }, "<space>p", "\"+p")
vim.keymap.set({ "n", "v" }, "<space>P", "\"+P")

vim.keymap.set("n", "<space>qq", "<cmd>copen<CR>")
vim.keymap.set("n", "<space>qc", "<cmd>cclose<CR>")
vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>")
vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>")

vim.keymap.set("n", "<space>bd", "<cmd>bd<CR>")
vim.keymap.set("n", "<space>bp", "<cmd>bp<CR>")
vim.keymap.set("n", "<space>bn", "<cmd>bn<CR>")
vim.keymap.set("n", "<space>bo", "<cmd><CR>")
vim.keymap.set("n", "<space>bd", "<cmd>bd<CR>")

vim.keymap.set("n", "<space>fd", "<cmd>cd %:p:h<CR>")

local job_id = 0
vim.keymap.set("n", "<space>st", function()
  vim.cmd.vnew()
  vim.cmd.term()
  vim.cmd.wincmd("J")
  vim.api.nvim_win_set_height(0, 10)
  job_id = vim.bo.channel
end)

vim.keymap.set("n", "<space><space>", "<cmd>noh<CR>")

-- Example
vim.keymap.set("n", "<space>example", function()
  vim.fn.chansend(job_id, { "echo 'hello world'\r\n" })
end)

vim.keymap.set("n", "-", "<cmd>Oil<CR>")
vim.keymap.set("t", "<C-space>", "<C-\\><C-n>")
vim.keymap.set("n", "<space>u", "<cmd>UndotreeToggle<CR>")

vim.keymap.set("n", "<space>rm", "<cmd>make<CR>")

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highligh when yanking',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
