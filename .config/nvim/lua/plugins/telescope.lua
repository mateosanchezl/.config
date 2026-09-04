return {
  "nvim-telescope/telescope.nvim",
  version = "*",

  dependencies = {
    { "nvim-treesitter/nvim-treesitter", "nvim-lua/plenary.nvim" },
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
  },

  cmd = "Telescope",

  opts = {
    defaults = {
      preview = true,
      color_devicons = false,
      prompt_prefix = " ",
      selection_caret = " ",
      entry_prefix = " ",
      sorting_strategy = "ascending",
      path_display = { "smart" },
      layout_config = {
        horizontal = {
          prompt_position = "top",
          preview_width = 0.60,
          results_width = 0.40,
        },
        width = 0.95,
        height = 0.95,
      },
    },

    extensions = {
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = "smart_case",
      },
    },
  },

  config = function(_, opts)
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    opts.defaults.mappings = {
      n = {
        ["q"] = actions.close,
      },
    }

    telescope.setup(opts)
    telescope.load_extension("fzf")
  end,
}
