local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use "christoomey/vim-tmux-navigator"
  use "folke/zen-mode.nvim"
  use "ggandor/leap.nvim"
  use "gsuuon/note.nvim"
  use "github/copilot.vim"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/nvim-cmp"
  use "junegunn/fzf"
  use "junegunn/fzf.vim"
  use "jose-elias-alvarez/null-ls.nvim"
  use "lewis6991/gitsigns.nvim"
  use "lukas-reineke/indent-blankline.nvim"
  use "mbbill/undotree"
  use "mg979/vim-visual-multi"
  use "MunifTanjim/prettier.nvim"
  use "NeogitOrg/neogit"
  use "neovim/nvim-lspconfig" -- LSP
  use "ntpeters/vim-better-whitespace"
  use "nvim-lua/plenary.nvim"
  use "nvim-lualine/lualine.nvim" -- Statusline
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
  use {
    "nvim-treesitter/nvim-treesitter",
    run = function() require("nvim-treesitter.install").update({ with_sync = true }) end,
  }
  use "Mofiqul/vscode.nvim"
  use {
    "mcchrish/zenbones.nvim",
    requires = "rktjmp/lush.nvim"
  }
  use "onsails/lspkind-nvim"
  use "rebelot/kanagawa.nvim"
  use "stevearc/oil.nvim"
  use "stsewd/fzf-checkout.vim"
  use "ThePrimeagen/vim-be-good"
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
