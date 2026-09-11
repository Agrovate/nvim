vim.pack.add({
    {
        src = "https://github.com/nvim-treesitter/nvim-treesitter",
        version = "main",
    },
    {src = "https://github.com/ThePrimeagen/harpoon", version = "harpoon2"},
    {src = "https://github.com/ellisonleao/gruvbox.nvim"},
    {src = "https://github.com/nvim-lualine/lualine.nvim"},
    {src = "https://github.com/nvim-lua/plenary.nvim"},
    {src = "https://github.com/nvim-telescope/telescope.nvim"},
    {src = "https://github.com/stevearc/oil.nvim"},
    {src = "https://github.com/EdenEast/nightfox.nvim"},
    {src = "https://github.com/nvim-mini/mini.nvim", name="mini.nvim"},
    {src = "https://github.com/lewis6991/gitsigns.nvim"},
    {src = "https://github.com/sheng-tse/jupynvim"},

    --LSP installs
    {src = "https://github.com/neovim/nvim-lspconfig"},
    {src = "https://github.com/mason-org/mason.nvim"},
    {src = "https://github.com/mrcjkb/rustaceanvim"},
    {src = "https://github.com/stevearc/conform.nvim"},
})

vim.pack.add({ 'https://github.com/saghen/blink.lib', 'https://github.com/saghen/blink.cmp' })
vim.cmd("packloadall")

require("options")
require("theme")
require("plugins.oil")
require("plugins.mini-mini")
require("plugins.treesitter")
require("plugins.jupy")
require("lsp.blink")
require("lsp.diagnostics")
require("lsp.rustacean")
require("plugins.conform")
require("keybinds")
require("gitsigns").setup({})
