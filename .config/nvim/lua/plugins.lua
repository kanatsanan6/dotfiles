local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use "Alligator/accent.vim"
  use "christoomey/vim-tmux-navigator"
  use "dyng/ctrlsf.vim"
  use "f-person/git-blame.nvim"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/nvim-cmp"
  use { "junegunn/fzf", tag = "0.52.0" }
  use "junegunn/fzf.vim"
  use "jose-elias-alvarez/null-ls.nvim"
  use "kdheepak/lazygit.nvim"
  use { 'kevinhwang91/nvim-bqf', ft = 'qf' }
  use {
    "kevinhwang91/nvim-ufo",
    requires = { { "kevinhwang91/promise-async" } }
  }
  use "lewis6991/gitsigns.nvim"
  use "lukas-reineke/indent-blankline.nvim"
  use "mg979/vim-visual-multi"
  use "MunifTanjim/prettier.nvim"
  use "NeogitOrg/neogit"
  use "neovim/nvim-lspconfig" -- LSP
  use "ntpeters/vim-better-whitespace"
  use "nvim-pack/nvim-spectre"
  use "nvim-lua/plenary.nvim"
  use {
    "nvim-treesitter/nvim-treesitter",
    run = function() require("nvim-treesitter.install").update({ with_sync = true }) end,
  }
  use "onsails/lspkind-nvim"
  use "petertriho/nvim-scrollbar"
  use "rebelot/kanagawa.nvim"
  use "ronakg/quickr-preview.vim"
  use {
    'ruifm/gitlinker.nvim',
    requires = 'nvim-lua/plenary.nvim',
  }
  use "samharju/serene.nvim"
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
