vim.o.number = true
vim.o.relativenumber = true
vim.o.swapfile = false
vim.o.wrap = false
vim.o.scrolloff = 12
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.cursorline = true
vim.o.signcolumn = 'yes'
vim.o.updatetime = 250

-- Plugins
vim.cmd.packadd("packer.nvim")

require("packer").startup(function(use)
	use { "christoomey/vim-tmux-navigator" }

	use {
		"ibhagwan/fzf-lua",
		config = function()
			require("fzf-lua").setup({
				winopts = { height = 0.3, width = 1.0, row = 1.0, border = "none" },
			})
		end,
	}

	use { "junegunn/seoul256.vim" }

	use {
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup {
				signcolumn = auto,
				on_attach = function()
					vim.wo.signcolumn = "yes"
				end
			}
		end,
	}

	use {
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("ibl").setup(
				{
					indent = { char = { "┊" } },
					whitespace = { highlight = { "IblWhitespace" } },
					scope = { enabled = false },
				}
			)
		end,
	}

	use { "ntpeters/vim-better-whitespace" }

	use {
		"nvim-treesitter/nvim-treesitter",
		branch = "master",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = { "lua" , "ruby" },
				highlight = { enable = true },
				indent = { enable = true, disable = { "ruby" } },
				endwise = { enable = true },
			})
		end,
	}

	use {
		"nvim-treesitter/nvim-treesitter-context",
		config = function()
			require("treesitter-context").setup({
				enable = true,
				max_lines = -1,
				mode = "topline",
			})
		end,
	}

	use { "tpope/vim-fugitive" }
	use { "tpope/vim-surround" }

	use {
		"saghen/blink.cmp",
		config = function()
			require("blink.cmp").setup({
				completion = {
					documentation = { auto_show = true },
					menu = { draw = { columns = { { "label", gap = 1 }, { "kind" } } } },
					list = {
						selection = { preselect = false, auto_insert = false },
					},
				},
				fuzzy = {
					implementation = "prefer_rust",
					prebuilt_binaries = { force_version = "1.*" }
				},
				keymap = {
					preset = "none",
					["<C-k>"] = { "select_prev", "fallback" },
					["<C-j>"] = { "select_next", "fallback" },
					["<CR>"] = { "accept", "fallback" }
				},
			})
		end,
	}

	use {
		"stevearc/oil.nvim",
		config = function()
			require("oil").setup({
				delete_to_trash = true,
				view_options = {
					show_hidden = true,
					is_always_hidden = function(name, _)
						local always_hidden = { ".git", ".vscode", ".idea" }

						for _, value in pairs(always_hidden) do
							if value == name then return true end
						end

						return false
					end,
				},
				keymaps = {
					["<C-p>"] = false
				},
			})
		end,
	}

	use { "wbthomason/packer.nvim" }
	use {
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})

			local rule = require('nvim-autopairs.rule')
			local cond = require('nvim-autopairs.conds')
			local npairs = require('nvim-autopairs')

			npairs.add_rules({
				rule("$$", "$$", "tex")
					:with_pair(cond.not_before_text(''))
					:with_pair(cond.not_after_text(''))
			})
		end,
	}
end)

-- LSP
vim.lsp.enable({
	"lua_ls",
	"solargraph",
	"rubocop",
})

vim.diagnostic.config({
  virtual_text = false
})

-- Colorscheme
vim.api.nvim_set_var("seoul256_background", 233)
vim.cmd.colorscheme("seoul256")

vim.cmd.highlight("statusline guibg=NONE")
vim.cmd.highlight("StatusLineNC guibg=NONE")

-- Keymaps
vim.g.mapleader = " "

vim.keymap.set("n", "<ESC>", ":noh<CR>")
vim.keymap.set("n", "<C-p>", function() FzfLua.global({ fzf_cli_args = "-i" }) end)
vim.keymap.set("n", "<C-o>", function() FzfLua.buffers() end)
vim.keymap.set("n", "<leader>R", function() FzfLua.grep_project({ hidden = true }) end)

vim.keymap.set("n", "-", "<CMD>Oil<CR>")

vim.keymap.set("n", "<M-h>", ":TmuxNavigateLeft<CR>")
vim.keymap.set("n", "<M-j>", ":TmuxNavigateDown<CR>")
vim.keymap.set("n", "<M-k>", ":TmuxNavigateUp<CR>")
vim.keymap.set("n", "<M-l>", ":TmuxNavigateRight<CR>")

vim.keymap.set({ "n", "v" }, "++", [["+y]])
vim.keymap.set("n", "+++", ":w<cr>")

-- AutoCmd
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	group = vim.api.nvim_create_augroup("packer_user_config", { clear = true }),
	pattern = "init.lua",
	callback = function(opts)
		vim.cmd("source " .. opts.file)
		vim.cmd("PackerCompile")
	end,
})

vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
	callback = function()
		vim.diagnostic.open_float(nil, { focus = false})
	end,
})

vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  callback = function()
    vim.highlight.on_yank()
  end,
})
