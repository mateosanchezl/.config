local parsers = {
  "lua",
  "luadoc",
  "printf",
  "vim",
  "vimdoc",
  "go",
  "gomod",
  "gosum",
  "javascript",
  "typescript",
  "tsx",
  "vue",
  "php",
  "html",
  "css",
  "json",
  "yaml",
  "markdown",
  "markdown_inline",
  "python",
  "graphql",
  "prisma",
}

return {
  "nvim-treesitter/nvim-treesitter",

  lazy = false,
  build = ":TSUpdate",

  config = function()
    local treesitter = require("nvim-treesitter")

    treesitter.setup()

    treesitter.install(parsers)

    vim.api.nvim_create_autocmd("FileType", {
      pattern = parsers,
      callback = function()
        vim.treesitter.start()

        vim.bo.indentexpr =
          "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}
