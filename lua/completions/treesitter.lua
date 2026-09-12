require("nvim-treesitter.configs").setup({

    highlight = { enable = true },
    indent = { enable = true },
    ensure_installed = {
        "c",
        "lua",
        "vim",
        "markdown",
        "rust",
        "cpp",
        "python",
        "go",
        "qmljs",
        "bash",
        "html",
        --        "latex",
        "javascript",
        "json",
        "tsx",
        "typescript",
        "yaml",
    },
})
