return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"mfussenegger/nvim-dap",
			"nvim-neotest/nvim-nio",
			"leoluz/nvim-dap-go",
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

			dap.adapters.codelldb = {
				type = "executable",
				command = "/home/marco/Documents/codelldb-linux-x64/extension/adapter/codelldb", -- or if not in $PATH: "/absolute/path/to/codelldb"

				-- On windows you may have to uncomment this:
				-- detached = false,
			}
			dap.configurations.cpp = {
				{
					name = "Launch file",
					type = "codelldb",
					request = "launch",
					program = function()
						return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
					end,
					cwd = "${workspaceFolder}",
					stopOnEntry = false,
				},
			}

			-- Setup Go debugging with nvim-dap-go
			require("dap-go").setup({
				dap_configurations = {
					{
						type = "go",
						name = "Attach remote",
						mode = "remote",
						request = "attach",
					},
				},
				delve = {
					path = vim.fn.expand("~/go/bin/dlv"),
				},
			})

			-- Initialize dapui
			dapui.setup()

			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end

			vim.keymap.set("n", "<Leader>dt", dap.toggle_breakpoint, {})
			vim.keymap.set("n", "<Leader>dc", dap.continue, {})
			vim.keymap.set("n", "<Leader>dso", dap.step_over, {})
			vim.keymap.set("n", "<Leader>dsi", dap.step_into, {})
			vim.keymap.set("n", "<Leader>dsu", dap.step_out, {})
			vim.keymap.set("n", "<Leader>dr", dap.repl.open, {})
		end,
	},
}
