return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    config = function()
      local wk = require("which-key")
      wk.register({
        f = {
          name = "Find",
          f = { "<cmd>Telescope find_files<cr>", "Find File" },
          g = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
          b = { "<cmd>Telescope buffers<cr>", "Find Buffers" },
          r = { "<cmd>Telescope oldfiles<cr>", "Recent Files" },
          k = { "<cmd>Telescope keymaps<cr>", "Find Keymaps" },
        },
      }, { prefix = "<leader>" })
    end,
  }
}
