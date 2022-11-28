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

  -------------
  -- Editing --
  -------------
  use { "tpope/vim-surround" }
  use { "windwp/nvim-autopairs" }


  use { "nvim-tree/nvim-tree.lua" }

  if packer_bootstrap then
    require("packer").sync()
  end
end)
