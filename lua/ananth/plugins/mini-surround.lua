return {
  {
    "nvim-mini/mini.nvim",
    version = false,
    event = "VeryLazy",
    config = function()
      require("mini.surround").setup()
    end,
  },
}
