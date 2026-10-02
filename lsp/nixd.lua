local hostname = vim.uv.os_gethostname()
local lowerhostname = string.lower(hostname)

local function is_devenv(root_dir)
	return vim.uv.fs_stat(root_dir .. "/devenv.nix") ~= nil or vim.uv.fs_stat(root_dir .. "/devenv.yaml") ~= nil
end

return {
	cmd = function(dispatchers, config)
		if is_devenv(config.root_dir) then
			return vim.lsp.rpc.start({ "devenv", "lsp" }, dispatchers, { cwd = config.root_dir })
		end

		return vim.lsp.rpc.start({ "nixd" }, dispatchers, { cwd = config.root_dir })
	end,

	filetypes = { "nix" },

	root_dir = function(bufnr, on_dir)
		local root = vim.fs.root(bufnr, {
			"devenv.nix",
			"devenv.yaml",
			"flake.nix",
			".git",
		})

		if root then
			on_dir(root)
		end
	end,

	settings = {
		nixd = {
			nixpkgs = {
				expr = "import <nixpkgs> { }",
			},

			formatting = {
				command = { "alejandra" },
			},

			options = {
				nixos = {
					expr = '(builtins.getFlake "~/.dotfiles/.nixos").nixosConfigurations.'
						.. lowerhostname
						.. ".options",
				},
			},
		},
	},
}
-- return {
-- 	cmd = { "nixd" },
-- 	filetypes = { "nix" },
-- 	root_markers = { "flake.nix", ".git" },
-- 	settings = {
-- 		nixd = {
-- 			nixpkgs = {
-- 				expr = "import <nixpkgs> { }",
-- 			},
-- 			formatting = {
-- 				command = { "alejandra" },
-- 			},
-- 			options = {
-- 				nixos = {
-- 					expr = '(builtins.getFlake "~/.dotfiles/.nixos").nixosConfigurations.'
-- 						.. lowerhostname
-- 						.. ".options",
-- 				},
-- 			},
-- 		},
-- 	},
-- }
