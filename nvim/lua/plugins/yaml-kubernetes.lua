return {
  {
    "b0o/schemastore.nvim",
    lazy = true,
  },
  {
    "mosheavni/yaml-companion.nvim",
    lazy = true,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "b0o/schemastore.nvim",
      "mosheavni/yaml-companion.nvim",
    },
    opts = function(_, opts)
      opts.servers.yamlls = {
        settings = {
          yaml = {
            schemaStore = { enable = false, url = "" },
            schemas = require("schemastore").yaml.schemas(),
            validate = true,
            completion = true,
            hover = true,
          },
        },
      }

      opts.servers.helm_ls = {
        settings = {
          ["helm-ls"] = {
            yamlls = { path = "yaml-language-server" },
          },
        },
      }

      opts.setup = opts.setup or {}
      opts.setup.yamlls = function(_, server_opts)
        local cfg = require("yaml-companion").setup({
          builtin_matchers = {
            kubernetes = { enabled = true },
          },
          lspconfig = server_opts,
        })
        vim.lsp.config("yamlls", cfg)
        vim.lsp.enable("yamlls")

        -- yaml-companion only detects the schema once, at LSP attach time.
        -- Re-run detection after edits/saves so a `kind:` typed after attach
        -- (e.g. in a new buffer) still gets picked up without a manual reload.
        vim.api.nvim_create_autocmd({ "InsertLeave", "BufWritePost" }, {
          pattern = { "*.yaml", "*.yml" },
          callback = function(args)
            require("yaml-companion").ctx.schedule_refresh(args.buf)
          end,
        })

        return true
      end
    end,
  },
}
