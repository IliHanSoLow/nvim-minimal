return {
  {
    "neovim/nvim-lspconfig",

    dependencies = {
      "saghen/blink.cmp",
      {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
          library = {
            -- See the configuration section for more details
            -- Load luvit types when the `vim.uv` word is found
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
    },

    config = function()
      -- LSP --
      vim.lsp.inlay_hint.enable()
      local capabilities = require('blink.cmp').get_lsp_capabilities()

      -- LSPCONFIG --
      -- general config
      local lspc = vim.lsp.config
      vim.lsp.config('*', {
        capabilities = capabilities
      })

      -- specific config
      lspc['nixd'] = {
        formatting = {
          command = { "alejandra" },
        },
      }
      lspc['clangd'] = {
        cmd = { "clangd", "--fallback-style=GNU" },
      }

      -- enabled (by default)
      local enabled_language_servers = {
        'lua_ls',
        'elixirls',
        'nixd',
        'pyright',
        'rust_analyzer',
        'gopls',
        'clangd',
        'phpactor'
      }
      for _, i in ipairs(enabled_language_servers) do
        vim.lsp.enable(i)
      end

      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('my.lsp', {}),
        callback = function(args)
          local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
          if not client then return end

          vim.keymap.set("n", "gd", function()
            vim.lsp.buf.definition()
          end)
          vim.keymap.set("n", "gD", function()
            vim.lsp.buf.declaration()
          end)

          -- Autoformat on save
          if not client:supports_method('textDocument/willSaveWaitUntil')
              and client:supports_method('textDocument/formatting') then
            vim.api.nvim_create_autocmd('BufWritePre', {
              group = vim.api.nvim_create_augroup('my.lsp', { clear = false }),
              buffer = args.buf,
              callback = function()
                vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
              end,
            })
          end
        end,
      })
    end
  }
}
