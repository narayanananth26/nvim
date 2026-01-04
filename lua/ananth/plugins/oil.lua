
return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  cmd = { "Oil" },
  opts = {
    default_file_explorer = true,
    columns = { "icon", "permissions", "size" },
    view_options = {
      show_hidden = true,
    },
    float = {
      border = "rounded",
    },
  },
  config = function(_, opts)
    require("oil").setup(opts)

    vim.keymap.set("n", "-", "<cmd>Oil<CR>", {
      silent = true,
      desc = "Open parent directory",
    })
  end,
}
