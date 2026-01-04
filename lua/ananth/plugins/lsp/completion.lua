return {
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      { "antosha417/nvim-lsp-file-operations", config = true },
      { "folke/lazydev.nvim", opts = {} },
    },
    config = function()
      local cmp = require("cmp")
      local cmp_nvim_lsp = require("cmp_nvim_lsp")

      cmp.setup({
        sources = {
          { name = "nvim_lsp" },
        },
      })

      local capabilities = cmp_nvim_lsp.default_capabilities()

      vim.lsp.config("*", {
        capabilities = capabilities,
      })
    end,
  },
}

