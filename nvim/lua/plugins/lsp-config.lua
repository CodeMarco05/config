return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"rust_analyzer",
					"marksman",
					"clangd",
          "jdtls",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- Set global capabilities for all servers
			vim.lsp.config('*', {
				capabilities = capabilities,
			})

			-- Enable LSP servers
			vim.lsp.enable('lua_ls')
			vim.lsp.enable('dockerls')
			vim.lsp.enable('docker_compose_language_service')
			vim.lsp.enable('rust_analyzer')
			vim.lsp.enable('clangd')
			vim.lsp.enable('jdtls')

			-- Key mappings for LSP functions
			vim.keymap.set("n", "K", vim.lsp.buf.hover, { noremap = true, silent = true })
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { noremap = true, silent = true })
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { noremap = true, silent = true }) -- Go to Definition
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { noremap = true, silent = true }) -- Rename
		end,
	},
}
