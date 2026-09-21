return {
    root_markers = {
        ".git",
        "pyproject.toml",
        ".py",
        "requirements.txt",
    },

    settings = {
        python = {
            pythonPath = vim.fn.getcwd() .. "/.venv/bin/python",
            venvPath = vim.fn.getcwd() .. ".",
        },
    },
}
