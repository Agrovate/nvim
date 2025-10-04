vim.g.mapleader = " "
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.cursorline = true
vim.opt.winborder = "rounded"
vim.opt.smartindent = true
vim.opt.guicursor = ""
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.wrap = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.updatetime = 50
vim.opt.colorcolumn = "80"

vim.opt.packpath:prepend(vim.fn.stdpath('data') .. '/site')
vim.pack.add({
		{src = "https://github.com/nvim-treesitter/nvim-treesitter", version = 'master'},
		{src = "https://github.com/ThePrimeagen/harpoon", version = "harpoon2"},
		{src = "https://github.com/ellisonleao/gruvbox.nvim"},
		{src = "https://github.com/nvim-lualine/lualine.nvim"},
		{src = "https://github.com/nvim-tree/nvim-web-devicons"},
		{ src = "https://github.com/neovim/nvim-lspconfig" },
		{ src = "https://github.com/mason-org/mason.nvim" },
		{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
		{ src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },
		{ src = "https://github.com/L3MON4D3/LuaSnip" },
		{ src = "https://github.com/rafamadriz/friendly-snippets" },
		{ src = "https://github.com/Saghen/blink.cmp" },
		{ src = "https://github.com/stevearc/dressing.nvim" },
		{src = "https://github.com/nvim-lua/plenary.nvim"},
		{src = "https://github.com/nvim-telescope/telescope.nvim"},
		{src = "https://github.com/stevearc/oil.nvim"},
})

require("oil").setup({
    keymaps = {
				[".."] = { "actions.parent", mode = "n" },
    }
})

--THEMES!!!!
vim.cmd('colorscheme gruvbox')
require("lualine").setup({
		options = {
				theme = 'auto'
		}
})



require('nvim-treesitter.configs').setup({
		ensure_installed = { "c", "lua", "vim", "markdown", "rust" },
		auto_install = false,
		sync_install = false,
		highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
		},
		indent = {
				enable = true,
		},
		ignore_install = {},
		modules = {},
})




-- LSP!!!!
require("mason").setup()
require("mason-lspconfig").setup()
require("mason-tool-installer").setup({
	ensure_installed = {
		"lua_ls",
		"stylua",
	}
})

vim.lsp.enable('lua_ls')
vim.lsp.enable('rust_analyzer')
require("luasnip.loaders.from_vscode").lazy_load()
require("blink.cmp").setup({
	signature = { enabled = true },
	completion = {
		documentation = { auto_show = true, auto_show_delay_ms = 500 },
		menu = {
			auto_show = true,
			draw = {
				treesitter = { "lsp" },
				columns = { { "kind_icon", "label", "label_description", gap = 1 }, { "kind" } },
			},
		},
	},
})

-- Custom Keybinds
vim.keymap.set('v', '<leader>y', '"+y', { desc = "Yank to system clipboard" })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "<leader>cd", "<Cmd>Oil<CR>")



--	Telescope Keybinds
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })



--	Harpoon Keybinds
require('telescope').load_extension('harpoon')
local harpoon = require("harpoon")
vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<leader>h", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end)
