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
			-- Setup each server with proper configuration using the new API
			vim.lsp.config.lua_ls = {
				capabilities = capabilities,
			}

			vim.lsp.config.rust_analyzer = {
				capabilities = capabilities,
			}

			vim.lsp.config.clangd = {
				capabilities = capabilities,
				filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
			}

			vim.lsp.config.jdtls = {
				capabilities = capabilities,
			}

			vim.lsp.config.dockerls = {
				capabilities = capabilities,
			}

			vim.lsp.config.docker_compose_language_service = {
				capabilities = capabilities,
			}

			vim.lsp.config.marksman = {
				capabilities = capabilities,
			}

			-- Enable the servers
			vim.lsp.enable({
				"lua_ls",
				"rust_analyzer",
				"clangd",
				"jdtls",
				"dockerls",
				"docker_compose_language_service",
				"marksman",
			})

			-- Key mappings for LSP functions
			vim.keymap.set("n", "K", vim.lsp.buf.hover, { noremap = true, silent = true })
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { noremap = true, silent = true })
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, { noremap = true, silent = true })
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { noremap = true, silent = true })
		end,
	},
}
