local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use "christoomey/vim-tmux-navigator"
  use({
    "stevearc/oil.nvim",
    config = function()
      require("oil").setup()
    end,
  })
  use "epwalsh/obsidian.nvim"
  use "folke/zen-mode.nvim"
  use "ggandor/leap.nvim"
  use "gsuuon/note.nvim"
  use "github/copilot.vim"
  use "hrsh7th/cmp-buffer"   -- nvim-cmp source for buffer words
  use "hrsh7th/cmp-nvim-lsp" -- nvim-cmp source for neovim's built-in LSP
  use "hrsh7th/nvim-cmp"     -- Completion
  use "junegunn/fzf"
  use "junegunn/fzf.vim"
  use "jose-elias-alvarez/null-ls.nvim"
  use "lewis6991/gitsigns.nvim"
  use "lukas-reineke/indent-blankline.nvim"
  use "NeogitOrg/neogit"
  use "ntpeters/vim-better-whitespace"
  use "nvim-lua/plenary.nvim"
  use "neovim/nvim-lspconfig"     -- LSP
  use "nvim-lualine/lualine.nvim" -- Statusline
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    -- or                            , branch = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
  use {
    "nvim-treesitter/nvim-treesitter",
    run = function() require("nvim-treesitter.install").update({ with_sync = true }) end,
  }
  use "Mofiqul/vscode.nvim"
  use {
    "mcchrish/zenbones.nvim",
    -- Optionally install Lush. Allows for more configuration or extending the colorscheme
    -- If you don't want to install lush, make sure to set g:zenbones_compat = 1
    -- In Vim, compat mode is turned on as Lush only works in Neovim.
    requires = "rktjmp/lush.nvim"
  }
  use "mg979/vim-visual-multi"
  use "mbbill/undotree"
  use "MunifTanjim/prettier.nvim"
  use "onsails/lspkind-nvim" -- vscode-like pictograms
  use "rebelot/kanagawa.nvim"
  use "stsewd/fzf-checkout.vim"
  use "ThePrimeagen/vim-be-good"
  use "tpope/vim-commentary"
  use "tpope/vim-dispatch"
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
