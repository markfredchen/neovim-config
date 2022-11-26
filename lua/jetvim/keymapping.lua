local keymap = jetvim.keymap
-- C ~ control
-- A ~ opt / alt
key_mappings = {
  normal_mode = {
    -----------------------
    -- Widnow Navigation --
    -----------------------

    ["<Leader>j"] = "<C-w>j",
    ["<Leader>k"] = "<C-w>k",
    ["<Leader>l"] = "<C-w>l",
    ---------------
    -- Move Line --
    ---------------
    ["<A-j>"] = ":move .+1<CR>",
    ["<A-k>"] = ":move .-2<CR>",

    ---------------
    -- Indention -- 
    ---------------
    ["<Tab>"] = ">l^",
    ["<S-Tab>"] = "<l^",


    -- Resize with arrows --
    ------------------------
    ["<C-Up>"] = ":resize -3<CR>",
    ["<C-Down>"] = ":resize +3<CR>",
    ["<C-Left>"] = ":vertical resize -3<CR>",
    ["<C-Right>"] = ":vertical resize +3<CR>",


    -------------
    -- Plugins --
    -- Packer  --
    -------------
    ["<Leader>pc"] = ":PackerCompile<CR>",
    ["<Leader>pi"] = ":PackerInstall<CR>",
    ["<Leader>ps"] = ":PackerSync<CR>",
    ["<Leader>pS"] = ":PackerStatus<CR>",
    ["<Leader>pu"] = ":PackerUpdate<CR>",

    ---------------
    -- Nvim Tree --
    ---------------
    ["<Leader>o"] = ":NvimTreeFocus<CR>",
    ["<Leader>e"] = ":NvimTreeToggle<CR>",

    ---------------
    -- telescope --
    ---------------
    ["<Leader>sf"] = ":Telescope find_files<CR>",
    ["<Leader>st"] = ":Telescope live_grep<CR>",
    ["<Leader>sb"] = ":Telescope buffers<CR>",
    ["<Leader>sp"] = ":Telescope projects<CR>",

    ----------------
    -- Bufferline --
    ----------------
    ["<S-l>"] = ":BufferLineCycleNext<CR>",

    ----------------
    -- EasyMotion --
    ----------------
    ["<Leader><Leader>s"] = "<Plug>(easymotion-sn)",
  },
  insert_mode = {
    ["jk"] = "<ESC>",
    -- Move cursor to end of line
    ["<C-e>"] = "<C-o>A",
    -- Move cursor to start of line
    ["<C-a>"] = "<C-o>I",

    -- Arrow keys
    ["<C-l>"] = "<Right>",
    ["<C-h>"] = "<Left>",
    ["<C-j>"] = "<Down>",
    ["<C-k>"] = "<Up>",
  },
  visual_mode = {
    ["<A-j>"] = ":move '>+1<CR>gv=gv",
    ["<A-k>"] = ":move '<-2<CR>gv=gv",
    ["<Tab>"] = ">^",
    ["<S-Tab>"] = "<^",
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
