return {
    settings = {
        basedpyright = {
            analysis = {
                autoSearchPaths = true,
                diagnosticMode = "openFilesOnly",
                useLibraryCodeForTypes = true,
                -- Options: "off", "basic", "standard", "strict"
                typeCheckingMode = "standard",
            },
        },
    },
}
