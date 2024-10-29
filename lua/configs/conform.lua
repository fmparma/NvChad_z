local options = {
    formatters_by_ft = {
        lua = { "stylua" },
        python = { "isort", "black" },
        rust = { "rustfmt", lsp_format = "fallback" },
        C = { "clang-format" },
        -- css = { "prettier" },
        -- html = { "prettier" },
    },

    -- clangd = {
    --     filetypes = { 'c', 'cpp', 'c++', 'cs' },
    --     args = { '--style=WebKit' },
    --     map_cursor_to_line = true,
    --     map_cursor_to_submission = true,
    --     map_cursor_to_end = true,
    --     map_cursor_to_next = true,
    --     map_cursor_to_previous = true,
    -- },
    -- format_on_save = {
    --   -- These options will be passed to conform.format()
    --   timeout_ms = 500,
    --   lsp_fallback = true,
    -- },
}

return options
