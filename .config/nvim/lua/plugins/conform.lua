return {
  "stevearc/conform.nvim",
  event = "BufWritePre",
  cmd = { "ConformInfo" },

  opts = function()
    local util = require "conform.util"

    return {
      formatters_by_ft = {
        lua = { "stylua" },
        go = { "gofumpt", "goimports" },
        javascript = { "prettierd", "prettier", "eslint_d" },
        typescript = { "prettierd", "prettier", "eslint_d" },
        vue = { "prettierd", "prettier" },
        php = { "pint" },
        css = { "prettierd", "prettier" },
        html = { "prettierd", "prettier" },
        json = { "prettierd", "prettier" },
        yaml = { "prettierd", "prettier" },
        markdown = { "prettierd", "prettier" },
        python = { "black" },
        rust = { "rustfmt" },
      },

      formatters = {
        pint = {
          command = "app/laravel/vendor/bin/pint",
          args = { "$FILENAME" },
          cwd = util.root_file { "pint.json", "composer.json" },
          require_cwd = true,
        },
      },

      format_on_save = {
        timeout_ms = 5000,
        lsp_fallback = true,
      },
    }
  end,
}
