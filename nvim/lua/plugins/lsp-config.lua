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
			local lspconfig = require("lspconfig")
			
			-- Setup each server with proper configuration
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			
			lspconfig.rust_analyzer.setup({
				capabilities = capabilities,
			})
			
			lspconfig.clangd.setup({
				capabilities = capabilities,
				filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
			})
			
			lspconfig.jdtls.setup({
				capabilities = capabilities,
			})
			
			lspconfig.dockerls.setup({
				capabilities = capabilities,
			})
			
			lspconfig.docker_compose_language_service.setup({
				capabilities = capabilities,
			})
			
			lspconfig.marksman.setup({
				capabilities = capabilities,
			})
			
			-- Key mappings for LSP functions
			vim.keymap.set("n", "K", vim.lsp.buf.hover, { noremap = true, silent = true })
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { noremap = true, silent = true })
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, { noremap = true, silent = true })
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { noremap = true, silent = true })
		end,
	},
}
