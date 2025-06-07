return {
  {
    'Mofiqul/dracula.nvim',
    enabled = false,
    config = function()
      vim.cmd.colorscheme('dracula')
    end
  },
  {
    'alexxGmZ/e-ink.nvim',
    enabled = false,
    config = function()
      vim.cmd.colorscheme('e-ink')
    end
  },
  {
    'sainnhe/everforest',
    enabled = true,
    config = function()
      vim.g.everforest_enable_italic = true
      vim.cmd.colorscheme('everforest')
    end
  },
  {
    'rebelot/kanagawa.nvim',
    enabled = false,
    config = function()
      vim.cmd.colorscheme('kanagawa')
    end
  },
  {
    'catppuccin/nvim',
    enabled = false,
    config = function()
      vim.cmd.colorscheme('catppuccin')
      -- vim.cmd.colorscheme('catppuccin-latte')
      -- vim.cmd.colorscheme('catppuccin-frappe')
      -- vim.cmd.colorscheme('catppuccin-macchiato')
      -- vim.cmd.colorscheme('catppuccin-mocha')
    end
  },
  {
    'scottmckendry/cyberdream.nvim',
    enabled = false,
    config = function()
      require("cyberdream").setup({
        variant = "auto",
        italic_comments = true,
        hide_fillchars = true,
        cache = true,
      })
      vim.cmd.colorscheme('cyberdream')
    end
  },
}
