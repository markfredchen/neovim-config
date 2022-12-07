-- auto install packer if not installeds
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
        vim.cmd([[packadd packer.nvim]])
        return true
    end
    return false
end


local packer_bootstrap = ensure_packer()
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer.lua source <afile> | PackerSync
  augroup end
]])


local status, packer = pcall(require, "packer")
if not status then
    return
end


return packer.startup(function(use)
  ---------------------
  -- Package Manager --
  ---------------------
  use { "wbthomason/packer.nvim" }

  -----------------
  -- Neovim Core --
  -----------------
  use { "nvim-lua/plenary.nvim" }
  use { "lewis6991/impatient.nvim" }

  ----------------------------------------
  -- Theme, Icons, Statusbar, Bufferbar --
  ----------------------------------------
  use { "RRethy/nvim-base16" }
  use { "akinsho/bufferline.nvim" }
  use { "nvim-tree/nvim-web-devicons" }
  use { "nvim-lualine/lualine.nvim" }
  use { "SmiteshP/nvim-navic" }

  ---------------
  -- Dashboard --
  ---------------
  use { "goolord/alpha-nvim" }

  -------------
  -- Editing --
  -------------
  use { "tpope/vim-surround" }
  use { "windwp/nvim-autopairs" }
  use { "tpope/vim-repeat" }
  
  ----------------
  -- Navigation --
  ----------------
  use { "phaazon/hop.nvim" }

  -------------------
  -- File Explorer --
  -------------------
  use { "nvim-tree/nvim-tree.lua" }
  use { "nvim-telescope/telescope.nvim", branch = "0.1.x" }
  use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
  use { "ahmedkhalf/project.nvim" }   

  ----------------
  -- Neovim CMP --
  ----------------
  use { "hrsh7th/cmp-nvim-lsp" }
  use { "hrsh7th/cmp-buffer" }
  use { "hrsh7th/cmp-path" }
  use { "hrsh7th/cmp-cmdline" }
  use { "hrsh7th/nvim-cmp" }
  use { "hrsh7th/cmp-vsnip" }
  use { "hrsh7th/vim-vsnip" }
  use { "L3MON4D3/LuaSnip" }
  use { "saadparwaiz1/cmp_luasnip" }


  ----------------
  -- Neovim LSP --
  ----------------
  use { "williamboman/mason.nvim" }
  use { "williamboman/mason-lspconfig.nvim" }
  use { "neovim/nvim-lspconfig" }

  ----------------
  -- Treesitter --
  ----------------
  use { "nvim-treesitter/nvim-treesitter" }

  ---------
  -- Git --
  ---------
  use { "voldikss/vim-floaterm" }




  if packer_bootstrap then
    require("packer").sync()
  end
end)
