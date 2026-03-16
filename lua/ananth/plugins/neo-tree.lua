return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },
    lazy = false,
    config = function()
      require("neo-tree").setup({})
      vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
          local argc = vim.fn.argc()
          local is_dir = argc == 1 and vim.fn.isdirectory(vim.fn.argv(0)) == 1
          if argc == 0 or is_dir then
            vim.cmd("Neotree show")
            local buf = vim.api.nvim_get_current_buf()
            vim.bo[buf].buftype = "nofile"
            vim.bo[buf].buflisted = false
            vim.bo[buf].bufhidden = "wipe"
          end
        end,
      })
    end,
  }
}
