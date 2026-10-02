local function get_settings(root_dir)
	local result = vim.system({ "devenv", "lsp", "--print-config" }, { cwd = root_dir }):wait().stdout

	if result.code ~= 0 then
		return {}
	end

	return vim.json.decode(result.stdout)
end

vim.lsp.config("devenv-nixd", {
	cmd = { "devenv", "lsp" },
	filetypes = { "nix" },
	root_dir = function(bufnr, on_dir)
		local root = vim.fs.root(bufnr, {
			"devenv.nix",
			"devenv.yaml",
		})

		if root then
			on_dir(root)
		end
	end,
	on_new_config = function(config, root_dir)
		config.settings = get_settings(root_dir)
	end,
})

vim.lsp.enable("nixd")
