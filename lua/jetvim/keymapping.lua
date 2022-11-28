vim.g.mapleader = " "

key_mappings = {
  normal_mode = {
    -- Window Navigation --
    ["<C-h>"] = "<C-w>h",
    ["<C-j>"] = "<C-w>j",
    ["<C-k>"] = "<C-w>k",
    ["<C-l>"] = "<C-w>l",
  }
}

local mode_map = {
  normal_mode = "n",
  insert_mode = "i",
  visual_mode = "x"
}
for mode_key, mode_key_mappings in pairs(key_mappings) do
  for key, mapping in pairs(mode_key_mappings) do
    jetvim.keymap(mode_map[mode_key], key, mapping)
  end
end
