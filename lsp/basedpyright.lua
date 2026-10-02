return {
	settings = {
		basedpyright = {
			disableOrganizeImports = true,
			analysis = {
				autoSearchPaths = true,
				useLibraryCodeForTypes = true,
				diagnosticMode = "openFilesOnly",
				-- Options: "off", "basic", "standard", "strict"
				typeCheckingMode = "standard",
				diagnosticSeverityOverrides = {
					reportUnreachable = "warning",
					reportOptionalMemberAccess = false,
				},
			},
		},
	},
}
