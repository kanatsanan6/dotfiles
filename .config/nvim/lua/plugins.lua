local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use "christoomey/vim-tmux-navigator"
  use "CopilotC-Nvim/CopilotChat.nvim"
  use "f-person/git-blame.nvim"
  use "folke/zen-mode.nvim"
  use "github/copilot.vim"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/nvim-cmp"
  use "junegunn/fzf"
  use "junegunn/fzf.vim"
  use "jose-elias-alvarez/null-ls.nvim"
  use "kdheepak/lazygit.nvim"
  use "lewis6991/gitsigns.nvim"
  use "lukas-reineke/indent-blankline.nvim"
  use "mg979/vim-visual-multi"
  use "MunifTanjim/prettier.nvim"
  use "NeogitOrg/neogit"
  use "neovim/nvim-lspconfig" -- LSP
  use "ntpeters/vim-better-whitespace"
  use "nvim-pack/nvim-spectre"
  use "nvim-lua/plenary.nvim"
  use "nvim-lualine/lualine.nvim" -- Statusline
  use {
    "nvim-treesitter/nvim-treesitter",
    run = function() require("nvim-treesitter.install").update({ with_sync = true }) end,
  }
  use "onsails/lspkind-nvim"
  use "petertriho/nvim-scrollbar"
  use "rebelot/kanagawa.nvim"
  use "stevearc/oil.nvim"
  use {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    requires = { { "nvim-lua/plenary.nvim" } }
  }
  use "tpope/vim-commentary"
  use "tpope/vim-dispatch"
  use "tpope/vim-fugitive"
  use "tpope/vim-rails"
  use "tpope/vim-repeat"
  use "tpope/vim-surround"
  use "vim-test/vim-test"
  use "vim-ruby/vim-ruby"
  use "wbthomason/packer.nvim"
  use "williamboman/mason.nvim"
  use "windwp/nvim-autopairs"
  use "windwp/nvim-ts-autotag"
end)
