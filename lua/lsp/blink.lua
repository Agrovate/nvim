-- require('blink.cmp').build():pwait()
require("blink.cmp").setup({

    keymap     = {
        preset = "none",
        ["<C-Space>"] = { "show", "hide" },
        ["<C-y>"] = { "accept", "fallback" },
        ["<C-j>"] = { "select_next", "fallback" },
        ["<C-k>"] = { "select_prev", "fallback" },
        ["<Tab>"] = { "snippet_forward", "fallback" },
        ["<S-Tab>"] = { "snippet_backward", "fallback" },
    },

    fuzzy      = {
        implementation = "prefer_rust",
    },

    appearance = { nerd_font_variant = "mono" },

    completion = {
        menu = {
            auto_show = false,
            border = "rounded",
            min_width = 40,
            auto_show_delay_ms = 50,
        },

        list = {
            selection = {
                preselect = false,
                auto_insert = true,
            },
        },
    },

    snippets   = { preset = "mini_snippets" },
    sources    = { default = { "lsp", "snippets", "buffer", "path" } },
})

vim.lsp.config["*"] = {
    capabilities = require("blink.cmp").get_lsp_capabilities(),
}

vim.lsp.enable({
    "lua_ls",
    "pyright",
    "bashls",
    "ts_ls",
    "gopls",
    "clangd",
    "rust_analyzer",
    "nixd",
    "nil",
})

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(event)
        local opts = { buffer = event.buf }

        -- Keymaps (Native Neovim functions)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', '[d', function() vim.diagnostic.jump({ count = -1, float = true }) end, opts)
        vim.keymap.set('n', ']d', function() vim.diagnostic.jump({ count = 1, float = true }) end, opts)
        vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
        vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)

        if vim.lsp.get_client_by_id(event.data.client_id).supports_method('textDocument/formatting') then
            vim.api.nvim_create_autocmd('BufWritePre', {
                buffer = event.buf,
                callback = function()
                    vim.lsp.buf.format({ bufnr = event.buf, id = event.data.client_id, timeout_ms = 2000 })
                end,
            })
        end
    end,
})
