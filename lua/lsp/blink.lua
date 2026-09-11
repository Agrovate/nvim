-- refuses to work on another machine idk why so build from source
-- require('blink.cmp').build():pwait()

local mini_snippets = require("mini.snippets")
mini_snippets.setup({
    snippets = {
        mini_snippets.gen_loader.from_lang(),
    },
    mappings = {
        expand = "",
    }
})

require("blink.cmp").setup({

    keymap     = BlinkKeymap,
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
