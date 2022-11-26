-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true


nvim_tree_utils = require("nvim-tree.utils")

-- Auto close nvim when nvim-tree is the last window.
vim.api.nvim_create_autocmd("BufEnter", {
  nested = true,
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and nvim_tree_utils.is_nvim_tree_buf() then
      vim.cmd "quit"
    end
  end
})


require("nvim-tree").setup({
  auto_reload_on_write = true,
  create_in_closed_folder = true,
  disable_netrw = false,
  hijack_cursor = false,
  hijack_netrw = true,
  hijack_unnamed_buffer_when_opening = false,
  ignore_buffer_on_setup = false,
  open_on_setup = false,
  open_on_setup_file = false,
  open_on_tab = false,
  ignore_buf_on_tab_change = {},
  sort_by = "name",
  root_dirs = {},
  prefer_startup_root = false,
  sync_root_with_cwd = true,
  reload_on_bufenter = false,
  respect_buf_cwd = true,
  on_attach = "disable",
  remove_keymaps = false,
  select_prompts = false,
  view = {
    adaptive_size = true,
    side = "left",
    width = 35,
    mappings = {
      list = {
        { key = { "l", "<CR>", "o" }, action = "edit" },
        { key = { "<C-]", "."}, action = "cd" },
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,
  },
  actions = {
    use_system_clipboard = true,
    change_dir = {
      enable = true,
      global = false,
    },

  }
})

