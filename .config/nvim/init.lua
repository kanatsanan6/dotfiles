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
vim.o.signcolumn = "yes"
vim.o.updatetime = 250
vim.o.ignorecase = true
vim.o.foldcolumn = "0"
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true

-- Plugins
vim.cmd.packadd("packer.nvim")

require("packer").startup(function(use)
	use {
		"bloznelis/before.nvim",
		config = function()
			local before = require('before')
			before.setup()

			vim.keymap.set('n', '<leader>[', before.jump_to_last_edit, {})
			vim.keymap.set('n', '<leader>]', before.jump_to_next_edit, {})
		end,
	}

	use {
		"chentoast/marks.nvim",
		config = function()
			require("marks").setup({})
		end,
	}

	use { "christoomey/vim-tmux-navigator" }

	use {
		"ibhagwan/fzf-lua",
		config = function()
			require("fzf-lua").setup({
				winopts = {
					height = 0.3,
					width = 1.0,
					row = 1.0,
					border = "none",
					header = false,
				},
			})
		end,
	}

	use { "junegunn/seoul256.vim" }
	use { "girishji/bufline.vim" }

	use {
		"kevinhwang91/nvim-ufo",
		requires = { { "kevinhwang91/promise-async" } },
		config = function()
			require("ufo").setup({
				provider_selector = function()
					return { "treesitter", "indent" }
				end
			})
		end,
	}

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

	use "nvim-lua/plenary.nvim"
	use "rafamadriz/friendly-snippets"
	use "rebelot/kanagawa.nvim"

	use {
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		requires = { {"nvim-lua/plenary.nvim"} }
	}

	use {
		"ThePrimeagen/99",
		config = function()
			local _99 = require("99")

			_99.setup({
				provider = _99.Providers.OpenCodeProvider,
				model = "openai/gpt-5.3-codex",
				completion = {
					source = "native",
				},
			})

			vim.keymap.set("v", "<leader>gv", function()
				_99.visual()
			end)

			vim.keymap.set("n", "<leader>gx", function()
				_99.stop_all_requests()
			end)

			vim.keymap.set("n", "<leader>gs", function()
				_99.search()
			end)
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
					implementation = "lua",
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

	use {
		"vim-test/vim-test",
		config = function()
			vim.api.nvim_set_var("test#neovim#start_normal", 1)
			vim.api.nvim_set_var("test#neovim#term_position", "bot 15")
			vim.api.nvim_set_var("test#ruby#use_binstubs", 0)
			vim.api.nvim_set_var("test#strategy", "neovim")
		end,
	}

	use { "wbthomason/packer.nvim" }
	use {
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})

			local rule = require("nvim-autopairs.rule")
			local cond = require("nvim-autopairs.conds")
			local npairs = require("nvim-autopairs")

			npairs.add_rules({
				rule("$$", "$$", "tex")
					:with_pair(cond.not_before_text(""))
					:with_pair(cond.not_after_text(""))
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

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(event)
    local client = vim.lsp.get_client_by_id(event.data.client_id)

     if client.name == "rubocop" then
      return
    end

    local opts = { buffer = event.buf }
    vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
    vim.keymap.set({ "n", "x" }, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
  end,
})

-- Colorscheme
-- vim.api.nvim_set_var("seoul256_background", 233)
-- vim.cmd.colorscheme("seoul256")
vim.cmd.colorscheme("kanagawa-dragon")

vim.cmd.highlight("statusline guibg=NONE")
vim.cmd.highlight("StatusLineNC guibg=NONE")

-- Functions

local function isSpec(path)
	if string.find(path, "_spec%.rb$") then
		return true
	end

	return false
end

local function openFile(path)
  if vim.fn.winnr("$") > 1 then
    vim.cmd([[wincmd w]])
    vim.api.nvim_command("edit " .. path)
  else
    vim.api.nvim_command("vsplit " .. path)
  end
end

-- Keymaps
vim.g.mapleader = " "

vim.keymap.set("n", "<ESC>", ":noh<CR>")
vim.keymap.set("n", "<C-p>", function()
	FzfLua.files({
		previewer = false,
		fzf_cli_args = "-i",
	})
end)
vim.keymap.set("n", "<leader>E", function() FzfLua.buffers() end)
vim.keymap.set("n", "<C-o>", ":FzfLua lsp_document_symbols symbol_kinds={ function, method }<CR>")
vim.keymap.set("n", "<leader>R", function() FzfLua.grep_project({ hidden = true, rg_opts = "--hidden --glob '!*.sql'" }) end)

vim.keymap.set("n", "-", "<CMD>Oil<CR>")

vim.keymap.set("n", "<M-h>", ":TmuxNavigateLeft<CR>")
vim.keymap.set("n", "<M-j>", ":TmuxNavigateDown<CR>")
vim.keymap.set("n", "<M-k>", ":TmuxNavigateUp<CR>")
vim.keymap.set("n", "<M-l>", ":TmuxNavigateRight<CR>")

vim.keymap.set({ "n", "v" }, "++", [["+y]])
vim.keymap.set("n", "+++", ":w<cr>")

vim.keymap.set("n", "te", ":tabedit<CR>")
vim.keymap.set("n", "<S-Tab>", ":tabprevious<CR>")
vim.keymap.set("n", "<Tab>", ":tabnext<CR>")

-- harpoon
local harpoon = require("harpoon")
harpoon:setup()

vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<leader>e", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end)

vim.keymap.set("n", "[[", function() harpoon:list():prev() end)
vim.keymap.set("n", "]]", function() harpoon:list():next() end)

vim.keymap.set("n", "<leader>v", ":TestVisit<CR>")
vim.keymap.set("n", "<leader>t", ":TestNearest<CR>")
vim.keymap.set("n", "<leader>T", ":TestFile<CR>")

vim.keymap.set("n", "<s-tab>", ":bp<CR>")
vim.keymap.set("n", "<tab>", ":bn<CR>")
vim.keymap.set("n", "<leader>x", ":bd<CR>")

vim.keymap.set("n", "<leader>o", function()
	local curr_file = vim.api.nvim_buf_get_name(0)
	local dest_file = ""

	if isSpec(curr_file) then
		dest_file = string.gsub(curr_file, "/spec/", "/app/")
		dest_file = string.gsub(dest_file, "_spec%.rb$", ".rb")
	else
		dest_file = string.gsub(curr_file, "/app/", "/spec/")
		dest_file = string.gsub(dest_file, "%.rb$", "_spec%.rb")
	end

	openFile(dest_file)
end)

vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)

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
    vim.hl.on_yank()
  end,
})

-- Binding frequency miss type command
vim.cmd([[
  command! -bar -nargs=* -complete=file -range=% -bang W         <line1>,<line2>write<bang> <args>
  command! -bar -nargs=* -complete=file -range=% -bang Wq        <line1>,<line2>wq<bang> <args>
  command! -bar                                  -bang Q         quit<bang>
]])

Statusline = {}
Statusline.active = function()
  return table.concat { require('bufline').bufferstr(), "%=%y %P %l:%c %*" }
end
Statusline.inactive = function()
  return " %F"
end

local aucmd_group = vim.api.nvim_create_augroup('StatuslineAutocmds', { clear = true })
vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter", "BufAdd" }, {
  group = aucmd_group,
  pattern = "*",
  callback = function()
    vim.wo.statusline = "%!v:lua.Statusline.active()"
  end,
})
vim.api.nvim_create_autocmd({ "WinLeave", "BufLeave" }, {
  group = aucmd_group,
  pattern = "*",
  callback = function()
    vim.wo.statusline = "%!v:lua.Statusline.inactive()"
  end,
})

-- autoload and autosave vim on enter/leave buffers
vim.cmd([[
au FocusGained,BufEnter * :silent! !
au FocusLost,WinLeave * :silent! w
]])
