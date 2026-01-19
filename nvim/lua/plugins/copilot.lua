return {
	-- GitHub Copilot
	{
		"github/copilot.vim",
		event = "InsertEnter",
		config = function()
			-- Disable default tab mapping (optional, if you want custom keybindings)
			vim.g.copilot_no_tab_map = true

			-- Set Copilot to use specific Node.js version (optional)
			-- vim.g.copilot_node_command = "/path/to/node"

			-- Filetypes to disable Copilot
			vim.g.copilot_filetypes = {
				["*"] = true,
				["gitcommit"] = false,
				["gitrebase"] = false,
				["markdown"] = true,
				[".env"] = false,
			}

			-- Custom keybinding for accepting Copilot suggestions with Ctrl+Y (exclusive)
			vim.keymap.set("i", "<C-y>", 'copilot#Accept("")', { expr = true, replace_keycodes = false, silent = true })
		end,
	},
}
