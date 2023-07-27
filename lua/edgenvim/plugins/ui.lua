return {
  {
    'akinsho/bufferline.nvim', 
    version = "*", 
    dependencies = 'nvim-tree/nvim-web-devicons',
    opts = {
      options = {
        mode = "buffers",
        offsets = {
          {
            filetype = "NvimTree",
            text = "",
          }
        }
      }
    },
  },
  {
    'nvim-lualine/lualine.nvim', 
    dependencies = 'nvim-tree/nvim-web-devicons',
    opts = {},
  },
  {
    "rcarriga/nvim-notify",
    opts = {
      stages = "fade",
      top_down = false,
      timeout = 3000,
    }
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    }
  }
}
