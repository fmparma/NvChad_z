-- local M = {}
--
-- M.nvchad_init = function()
--   return require "nvchad.configs.telescope"
-- end
--
-- M.options = M.nvchad_init
-- -- themes, terms
-- table.insert(M.opts.extensions_list, "fzf")

dofile(vim.g.base46_cache .. "telescope")

local options = {
  defaults = {
    prompt_prefix = "   ",
    selection_caret = " ",
    entry_prefix = " ",
    sorting_strategy = "ascending",
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.55,
      },
      width = 0.87,
      height = 0.80,
    },
    mappings = {
      n = { ["q"] = require("telescope.actions").close },
    },
  },

  -- pickers = {
  --   find_files = {
  --     -- dropdown/cursor/ivy
  --     theme = "ivy",
  --   }
  -- },

  extensions_list = { "themes", "terms", "fzf" },
  extensions = {
    fzf = {
      -- false will only do exact matching
      fuzzy = true,
      -- override the generic sorter
      override_generic_sorter = true,
      -- override the file sorter
      override_file_sorter = true,
      -- or "ignore_case" or "respect_case", the default is "smart_case"
      case_mode = "smart_case",
    }
  },
}

return options
