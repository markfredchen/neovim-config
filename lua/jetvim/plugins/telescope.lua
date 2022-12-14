local status, telescope = pcall(require, "telescope")
if not status then
  return
end

telescope.setup({
  defaults = {
    file_ignore_patterns = {
      "^.git",
      "venv",
      ".idea",
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
    },
    project = {
      sync_with_nvim_tree = true,
      theme = "dropdown",
    },
  }
})

telescope.load_extension("fzf")
telescope.load_extension("project")

local builtin = require("telescope.builtin")
jetvim.keymap("n", "<leader>ff", builtin.find_files)
jetvim.keymap("n", "<leader>fg", builtin.live_grep)
jetvim.keymap("n", "<leader>fb", builtin.buffers)
jetvim.keymap("n", "<leader>fh", builtin.help_tags)
jetvim.keymap("n", "<leader>fp", ":Telescope project<CR>")
