return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    'williamboman/mason-lspconfig.nvim',
    config = function()
    require("mason-lspconfig").setup({
      ensure_installed = {
          "lua_ls",
          "clangd" }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    --setup language servers
    config = function () 
      local lspconfig = require('lspconfig')
      lspconfig.lua_ls.setup ({})
      lspconfig.clangd.setup ({})

      -- rust
      lspconfig.rust_analyzer.setup({
        settings = {
          ["rust-analyzer"] = {
            cargo = {
              allFeatures = true,
            },
            procMacro = {
              enable = true,
            },
            checkOnSave = {
              command = "clippy",
            },
          },
        },
      })

      -- lspconfig keymaps
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
      vim.keymap.set({ 'n', 'v' }, '<space>nl', vim.lsp.buf.code_action, opts)

      vim.cmd [[
        autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync()
      ]]
    end
  },
}
