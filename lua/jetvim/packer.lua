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

packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end
  }
})

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

  -------------
  -- Editing --
  -------------
  use { "tpope/vim-surround" }
  use { "windwp/nvim-autopairs" }
  use { "numToStr/Comment.nvim" }

  -----------------
  -- Neovim Tree --
  -----------------
  use { "nvim-tree/nvim-tree.lua" }

  ---------------
  -- Telescope --
  ---------------
  use { 'nvim-telescope/telescope.nvim', branch = '0.1.x' }
  use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }

  ----------------
  -- Treesitter --
  ----------------
  use { 
    "nvim-treesitter/nvim-treesitter", 
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
  }

  ----------------
  -- EasyMotion --
  ----------------
  use { "easymotion/vim-easymotion" }

  if packer_bootstrap then
    require("packer").sync()
  end
end)

