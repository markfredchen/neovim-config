return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      ensure_installed = { "lua" },
      highlight = {
        enable = true,
        use_languagetree = true,
      },
      indent = { enable = true },
    }
  }
}
