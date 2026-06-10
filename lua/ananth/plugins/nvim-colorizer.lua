
return {
  {
    "catgoose/nvim-colorizer.lua",
    event = "BufReadPre",
    opts = {
      filetypes = {
        "*",
        css = { rgb_fn = true },
      },
    },
  },
}
