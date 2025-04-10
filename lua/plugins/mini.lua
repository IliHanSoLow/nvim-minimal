return {
  {
    'echasnovski/mini.nvim',
    version = '*',
    config = function()
      local statusline = require 'mini.statusline'
      statusline.setup { use_icons = true }

      local align = require 'mini.align'
      align.setup {}
    end
  }
}
