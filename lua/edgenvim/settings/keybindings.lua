vim.g.mapleader = " "

local key_mappings = {
  n = {
    -- Window Navigation --
    ["<C-h>"] = "<C-w>h",
    ["<C-j>"] = "<C-w>j",
    ["<C-k>"] = "<C-w>k",
    ["<C-l>"] = "<C-w>l",

    ------------------------
    -- Resize with arrows --
    ------------------------
    ["<C-Up>"] = ":resize +3<CR>",
    ["<C-Down>"] = ":resize -3<CR>",
    ["<C-Left>"] = ":vertical resize -3<CR>",
    ["<C-Right>"] = ":vertical resize +3<CR>",

    ["<C-e>"] = ":Telescope oldfiles<CR>",

  },
  i = {
    ["<C-h>"] = "<Left>",
    ["<C-j>"] = "<Down>",
    ["<C-k>"] = "<Up>",
    ["<C-l>"] = "<Right>",
    ["<C-o>"] = "<Esc><S-a>",
  }
}


for mode_key, mode_key_mappings in pairs(key_mappings) do
  for key, mapping in pairs(mode_key_mappings) do
    edge.keymap(mode_key, key, mapping)
  end
end


