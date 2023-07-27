return {
  "nvim-lua/plenary.nvim",
  "RRethy/nvim-base16",
  {
    "Pocco81/auto-save.nvim",
    opts = {},
  },
  { "tpope/vim-surround" },
  { "windwp/nvim-autopairs", opts = {} }, 
  { "tpope/vim-repeat" },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      { "<leader>h", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash Jump" },
     -- { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
     -- { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
     -- { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
     -- { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
  } 
}
