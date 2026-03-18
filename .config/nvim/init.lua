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
vim.o.smartcase = true
vim.o.termguicolors = true
vim.o.foldcolumn = "0"
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.o.laststatus = 3
vim.o.redrawtime = 10000
vim.o.maxmempattern = 20000
vim.o.colorcolumn = "120"
vim.o.undofile = true
vim.o.autoread = true

-- Set GIT_EDITOR to use nvr if Neovim and nvr are available
if vim.fn.has('nvim') == 1 and vim.fn.executable('nvr') == 1 then
	vim.env.GIT_EDITOR = "nvr -cc split --remote-wait +'set bufhidden=wipe'"
end

-- Create undo directory if it doesn't exist
local undodir = vim.fn.expand("~/.vim/undodir")
if vim.fn.isdirectory(undodir) == 0 then
	vim.fn.mkdir(undodir, "p")
end

-- Plugins
local plugins = {
	{
		src = "https://github.com/ThePrimeagen/99",
		data = {
			setup = function()
				local _99 = require("99")
				local opencode_skills_dir = vim.fn.expand("~/.config/opencode/skills")

				_99.setup({
					provider = _99.Providers.OpenCodeProvider,
					model = "openai/gpt-5.4",
					completion = {
						source = "native",
						custom_rules = { opencode_skills_dir },
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
		},
	},
	{
		src = "https://github.com/chentoast/marks.nvim",
		data = {
			setup = function()
				require("marks").setup({})
			end,
		},
	},
	{
		src = "https://github.com/christoomey/vim-tmux-navigator",
		data = {
			setup = function()
				vim.keymap.set("n", "<M-h>", ":TmuxNavigateLeft<CR>")
				vim.keymap.set("n", "<M-j>", ":TmuxNavigateDown<CR>")
				vim.keymap.set("n", "<M-k>", ":TmuxNavigateUp<CR>")
				vim.keymap.set("n", "<M-l>", ":TmuxNavigateRight<CR>")
			end,
		}
	},
	{
		src = "https://github.com/girishji/bufline.vim",
		data = {
			setup = function()
				require("bufline").setup({
					showbufnr = false,
					emphasize = "",
					highlight = true,
				})
			end,
		},
	},
	{
		src = "https://github.com/ibhagwan/fzf-lua",
		data = {
			setup = function()
				vim.keymap.set("n", "<C-p>", function() FzfLua.files({ previewer = false, fzf_cli_args = "-i" }) end)
				vim.keymap.set("n", "<C-o>", function()
					FzfLua.lsp_document_symbols({ symbol_kinds = { "function", "method" } })
				end)

				vim.keymap.set("n", "<leader>r", function()
					FzfLua.live_grep({ hidden = true, silent = true, rg_opts = "--hidden --glob '!*.sql'" })
				end)
				vim.keymap.set("n", "<leader>R", function()
					FzfLua.live_grep({ hidden = true, silent = true, rg_opts = "--hidden --glob '!*.sql' --glob '!*_spec.rb'" })
				end)

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
		},
	},
	{
		src = "https://github.com/kevinhwang91/nvim-ufo",
		data = {
			setup = function()
				vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
				vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)

				require("ufo").setup({
					provider_selector = function()
						return { "treesitter", "indent" }
					end,
				})
			end,
		},
	},
	{ src = "https://github.com/kevinhwang91/promise-async" },
	{
		src = "https://github.com/lewis6991/gitsigns.nvim",
		data = {
			setup = function()
				require("gitsigns").setup({
					signcolumn = auto,
					on_attach = function()
						vim.wo.signcolumn = "yes"
					end,
				})
			end,
		},
	},
	{
		src = "https://github.com/lukas-reineke/indent-blankline.nvim",
		data = {
			setup = function()
				require("ibl").setup({
					indent = { char = { "┊" } },
					whitespace = { highlight = { "IblWhitespace" } },
					scope = { enabled = false },
				})
			end,
		},
	},
	{ src = "https://github.com/ntpeters/vim-better-whitespace" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{
		src = "https://github.com/nvim-treesitter/nvim-treesitter",
		version = "master",
		data = {
			setup = function()
				require("nvim-treesitter.configs").setup({
					ensure_installed = { "lua", "ruby" },
					highlight = { enable = true },
					indent = { enable = true, disable = { "ruby" } },
					endwise = { enable = true },
				})
			end,
		},
	},
	{
		src = "https://github.com/nvim-treesitter/nvim-treesitter-context",
		data = {
			setup = function()
				require("treesitter-context").setup({
					enable = true,
					max_lines = 5,
					mode = "topline",
				})
			end,
		},
	},
	{ src = "https://github.com/qpkorr/vim-bufkill" },
	{ src = "https://github.com/rafamadriz/friendly-snippets" },
	{ src = "https://github.com/rebelot/kanagawa.nvim" },
	{
		src = "https://github.com/saghen/blink.cmp",
		data = {
			setup = function()
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
						prebuilt_binaries = { force_version = "1.*" },
					},
					keymap = {
						preset = "none",
						["<C-k>"] = { "select_prev", "fallback" },
						["<C-j>"] = { "select_next", "fallback" },
						["<CR>"] = { "accept", "fallback" },
					},
				})
			end,
		},
	},
	{
		src = "https://github.com/stevearc/oil.nvim",
		data = {
			setup = function()
				vim.keymap.set("n", "-", "<CMD>Oil<CR>")

				require("oil").setup({
					delete_to_trash = true,
					view_options = {
						show_hidden = true,
						is_always_hidden = function(name, _)
							local always_hidden = { ".git", ".vscode", ".idea" }

							for _, value in pairs(always_hidden) do
								if value == name then
									return true
								end
							end

							return false
						end,
					},
					keymaps = {
						["<C-p>"] = false,
					},
				})
			end,
		},
	},
	{ src = "https://github.com/tpope/vim-surround" },
	{
		src = "https://github.com/vim-test/vim-test",
		data = {
			setup = function()
				vim.keymap.set("n", "<leader>v", ":TestVisit<CR>")
				vim.keymap.set("n", "<leader>t", ":TestNearest<CR>")
				vim.keymap.set("n", "<leader>T", ":TestFile<CR>")

				vim.api.nvim_set_var("test#neovim#start_normal", 1)
				vim.api.nvim_set_var("test#neovim#term_position", "bot 15")
				vim.api.nvim_set_var("test#ruby#use_binstubs", 0)
				vim.api.nvim_set_var("test#strategy", "neovim")
			end,
		},
	},
	{
		src = "https://github.com/windwp/nvim-autopairs",
		data = {
			setup = function()
				require("nvim-autopairs").setup({})

				local rule = require("nvim-autopairs.rule")
				local cond = require("nvim-autopairs.conds")
				local npairs = require("nvim-autopairs")

				npairs.add_rules({
					rule("$$", "$$", "tex")
							:with_pair(cond.not_before_text(""))
							:with_pair(cond.not_after_text("")),
				})
			end,
		},
	},
}

vim.pack.add(plugins, {
	load = function(plug)
		local data = plug.spec.data or {}
		local setup = data.setup

		vim.cmd.packadd(plug.spec.name)

		if setup ~= nil and type(setup) == "function" then
			setup()
		end
	end,
})

-- LSP
vim.lsp.enable({
	"lua_ls",
	"ruby-lsp",
	"jsonls",
})

vim.diagnostic.config({
	virtual_text = false,
	signs = true,
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
vim.cmd.colorscheme("kanagawa-dragon")

vim.cmd.highlight("statusline guibg=NONE")
vim.cmd.highlight("StatusLineNC guibg=NONE")

local function set_bufline_highlights()
	vim.api.nvim_set_hl(0, "User1", { fg = "black", bg = "#8ea4a2", bold = true })
	vim.api.nvim_set_hl(0, "User2", { fg = "#8ea4a2", bg = "NONE" })
	vim.api.nvim_set_hl(0, "User3", { fg = "#8ea4a2", bg = "NONE" })
	vim.api.nvim_set_hl(0, "User4", { fg = "#8ea4a2", bg = "NONE", bold = true })
end

set_bufline_highlights()

vim.api.nvim_create_autocmd("ColorScheme", {
	group = vim.api.nvim_create_augroup("BuflineHighlights", { clear = true }),
	callback = set_bufline_highlights,
})

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

-- Move line up/down
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- indenting with visual mode
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "y", "mcy`c")

-- copy filepath to clipboard
vim.keymap.set("n", "<leader>cc", function()
	local path = vim.fn.expand("%:P")
	vim.fn.setreg("+", path)
	print("file:", path)
end)

vim.keymap.set("n", "++", [["+y]])
vim.keymap.set("v", "++", [[mc"+y`c]])
vim.keymap.set("n", "+++", ":w<cr>")

vim.keymap.set("n", "<leader>d", function()
	vim.diagnostic.open_float(nil, { focus = false })
end)

vim.keymap.set("n", "<s-tab>", ":bp<CR>")
vim.keymap.set("n", "<tab>", ":bn<CR>")
vim.keymap.set("n", "<leader>x", ":BD<CR>")

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

-- AutoCmd
local augroup = vim.api.nvim_create_augroup("user_config", { clear = true })

vim.api.nvim_create_autocmd({ "TextYankPost" }, {
	group = augroup,
	callback = function()
		vim.hl.on_yank()
	end,
})

-- Return to last edit position when opening files
vim.api.nvim_create_autocmd("BufReadPost", {
	group = augroup,
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		local lcount = vim.api.nvim_buf_line_count(0)
		local line = mark[1]
		local ft = vim.bo.filetype
		if line > 0 and line <= lcount
				and vim.fn.index({ "commit", "gitrebase", "xxd" }, ft) == -1
				and not vim.o.diff then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

-- Auto-resize splits when window is resized
vim.api.nvim_create_autocmd("VimResized", {
	group = augroup,
	callback = function()
		vim.cmd("tabdo wincmd =")
	end,
})

-- Binding frequency miss type command
vim.cmd([[
  command! -bar -nargs=* -complete=file -range=% -bang W         <line1>,<line2>write<bang> <args>
  command! -bar -nargs=* -complete=file -range=% -bang Wq        <line1>,<line2>wq<bang> <args>
  command! -bar                                  -bang Q         quit<bang>
]])

-- Statusline
local function statusline_active()
	local bufline_width = math.floor(vim.o.columns * 0.9)
	return table.concat({
		require("bufline").bufferstr(bufline_width),
		"%= %f %*",
	})
end

_G.StatuslineActive = statusline_active

local statusline_group = vim.api.nvim_create_augroup("StatuslineAutocmds", { clear = true })

local function set_window_statusline(is_active)
	vim.wo.statusline = is_active and "%!v:lua.StatuslineActive()" or "%= %f"
end

vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter", "BufAdd" }, {
	group = statusline_group,
	pattern = "*",
	callback = function()
		set_window_statusline(true)
	end,
})

vim.api.nvim_create_autocmd({ "WinLeave", "BufLeave" }, {
	group = statusline_group,
	pattern = "*",
	callback = function()
		set_window_statusline(false)
	end,
})
