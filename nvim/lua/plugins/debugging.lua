return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

			-- Initialize dapui
			dapui.setup()

			dap.adapters.lldb = {
				type = "executable",
				command = "/usr/bin/lldb-dap", -- Use lldb-dap, not lldb
				name = "lldb",
			}

			dap.configurations.cpp = {
				{
					name = "Launch",
					type = "lldb",
					request = "launch",
					program = function()
						return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
					end,
					cwd = vim.fn.getcwd(),
					stopOnEntry = true, -- TEMPORARILY set to true for testing
					args = {},
				},
			}

			-- C configuration (same as C++)
			dap.configurations.c = dap.configurations.cpp

			-- Rust configuration
			dap.configurations.rust = {
				{
					name = "Launch",
					type = "lldb",
					request = "launch",
					program = function()
						return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
					end,
					cwd = "${workspaceFolder}",
					stopOnEntry = false,
					args = {},
				},
			}

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
	{
		{
			"nvim-neotest/neotest",
			dependencies = {
				"nvim-neotest/nvim-nio",
				"nvim-lua/plenary.nvim",
				"antoinemadec/FixCursorHold.nvim",
				"nvim-treesitter/nvim-treesitter",
			},
		},
	},
}
