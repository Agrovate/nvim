local hostname = vim.uv.os_gethostname()
local lowerhostname = string.lower(hostname)

local function get_devenv_settings(root_dir)
	local result = vim.system({
		"devenv",
		"lsp",
		"--print-config",
	}, {
		cwd = root_dir,
	}):wait()

	if result.code ~= 0 then
		return nil
	end

	return vim.json.decode(result.stdout)
end

return {
	cmd = { "nixd" },
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

	on_new_config = function(config, root_dir)
		local has_devenv = vim.uv.fs_stat(root_dir .. "/devenv.nix") ~= nil
			or vim.uv.fs_stat(root_dir .. "/devenv.yaml") ~= nil

		if has_devenv then
			config.settings = get_devenv_settings(root_dir)
		else
			config.settings = {
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
			}
		end
	end,
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
