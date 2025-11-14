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
					"gopls",
					--"sqlls",
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

			vim.lsp.config.marksman = {
				capabilities = capabilities,
			}

			vim.lsp.config.gopls = {
				capabilities = capabilities,
				cmd = { "gopls" },
				filetypes = { "go", "gomod", "gowork", "gotmpl" },
				root_dir = vim.fs.root(0, { "go.work", "go.mod", ".git" }),
				settings = {
					gopls = {
						usePlaceholders = true,
						completeUnimported = true,
						analyses = {
							unusedparams = true,
						},
					},
				},
			}

			--vim.lsp.config.sqlls = {
			--	capabilities = capabilities,
			--}

			-- Enable the servers
			vim.lsp.enable({
				"lua_ls",
				"rust_analyzer",
				"marksman",
				"clangd",
				"jdtls",
				"gopls",
				--"sqlls",
			})

			-- Key mappings for LSP functions
			vim.keymap.set("n", "K", vim.lsp.buf.hover, { noremap = true, silent = true, desc = "Hover" })
			vim.keymap.set(
				{ "n", "v" },
				"<leader>ca",
				vim.lsp.buf.code_action,
				{ noremap = true, silent = true, desc = "Code action" }
			)
			vim.keymap.set(
				"n",
				"gd",
				vim.lsp.buf.definition,
				{ noremap = true, silent = true, desc = "Go to definiton" }
			)
			vim.keymap.set(
				"n",
				"<leader>rn",
				vim.lsp.buf.rename,
				{ noremap = true, silent = true, desc = "Rename in current buffer" }
			)
		end,
	},
}
