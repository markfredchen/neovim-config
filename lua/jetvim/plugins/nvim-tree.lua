-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local status, nvim_tree = pcall(require, "nvim-tree")
if not status then
  return
end

-- OR setup with some options
nvim_tree.setup({
  ignore_ft_on_setup = {
    "startify",
    "dashboard",
    "alpha",
  },
  auto_reload_on_write = false,
  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = true,
    ignore_list = {},
  },
  system_open = {
    cmd = nil,
    args = {},
  },
  git = {
    enable = true,
    ignore = false,
    timeout = 200,
  },
  view = {
    width = 35,
    hide_root_folder = false,
    side = "left",
    mappings = {
      list = {
        { key = { "l", "o", "<CR>" }, action = "edit" },
        { key = "h", action = "close_node" },
        { key = "v", action = "vsplit" },
        { key = "e", action = "split" },
      },
    },
  },
  renderer = {
    indent_markers = {
      enable = true,
      icons = {
        corner = "└",
        edge = "│",
        item = "│",
        none = " ",
      },
    },
    icons = {
      webdev_colors = true,
      git_placement = "signcolumn",
      show = {
        git = true,
        folder = true,
        file = true,
        folder_arrow = true,
      },
      glyphs = {
        git = {
          deleted = jetvim.ui.icons.git.GitDelete,
          ignored = jetvim.ui.icons.git.GitIgnored,
          renamed = jetvim.ui.icons.git.GitRenamed,
          staged = jetvim.ui.icons.git.GitStaged,
          unstaged = jetvim.ui.icons.git.GitUnstaged,
          unmerged = jetvim.ui.icons.git.GitConflict,
          untracked = jetvim.ui.icons.git.GitUntracked,
        },
      },
    },
    highlight_git = true,
    group_empty = false,
    root_folder_modifier = ":t",
  },
  filters = {
    dotfiles = true,
  },
  actions = {
    use_system_clipboard = true,
    change_dir = {
      enable = true,
      global = false,
      restrict_above_cwd = false,
    },
    open_file = {
      quit_on_open = false,
      resize_window = true,
      window_picker = {
        enable = true,
        chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
        exclude = {
          filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
          buftype = { "nofile", "terminal", "help" },
        },
      },
    },
  },
})

jetvim.keymap("n", "<leader>o", ":NvimTreeFocus<CR>")
jetvim.keymap("n", "<leader>e", ":NvimTreeToggle<CR>")

