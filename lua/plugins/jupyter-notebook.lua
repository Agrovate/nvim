vim.g.molten_image_provider = "image.nvim"

vim.g.molten_auto_open_output = false
vim.g.molten_auto_open_html_in_browser = false

vim.g.molten_output_win_max_height = 20
vim.g.molten_output_win_max_width = 120

vim.g.molten_wrap_output = true
vim.g.molten_output_virt_lines = true

vim.g.molten_use_border_highlight = true

require("image").setup({
	backend = "ueberzug",

	processor = "magick_cli",

	integrations = {
		markdown = {
			enabled = true,
			clear_in_insert_mode = false,
			download_remote_images = true,
			only_render_image_at_cursor = false,

			filetypes = {
				"markdown",
				"quarto",
			},
		},

		neorg = {
			enabled = false,
		},

		typst = {
			enabled = false,
		},

		html = {
			enabled = false,
		},

		css = {
			enabled = false,
		},
	},

	max_width = 100,
	max_height = 20,

	window_overlap_clear_enabled = true,
	editor_only_render_when_focused = false,
})

local map = vim.keymap.set

map("n", "<leader>mi", "<cmd>MoltenInit<CR>", { desc = "Molten: initialize" })

map("n", "<leader>me", "<cmd>MoltenEvaluateOperator<CR>", { desc = "Molten: evaluate" })

map("v", "<leader>me", ":<C-u>MoltenEvaluateVisual<CR>", { desc = "Molten: evaluate selection" })

map("n", "<leader>mr", "<cmd>MoltenReevaluateCell<CR>", { desc = "Molten: re-evaluate cell" })

map("n", "<leader>mo", "<cmd>MoltenEnterOutput<CR>", { desc = "Molten: enter output" })

map("n", "<leader>mh", "<cmd>MoltenHideOutput<CR>", { desc = "Molten: hide output" })

map("n", "<leader>ms", "<cmd>MoltenShowOutput<CR>", { desc = "Molten: show output" })

map("n", "<leader>md", "<cmd>MoltenDelete<CR>", { desc = "Molten: delete output" })

map("n", "<leader>mK", "<cmd>MoltenInterrupt<CR>", { desc = "Molten: interrupt" })

map("n", "<leader>mR", "<cmd>MoltenRestart<CR>", { desc = "Molten: restart kernel" })

map("n", "<leader>mx", "<cmd>MoltenReevaluateAll<CR>", { desc = "Molten: evaluate all" })
