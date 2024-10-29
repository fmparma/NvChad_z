-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
    theme = "flexoki",

    -- hl_override = {
    -- 	Comment = { italic = true },
    -- 	["@comment"] = { italic = true },
    -- },
}

M.ui = {
    -- statusline = {
    --   theme = "default",
    --   separator_style = "arrow",
    --   order = nil,
    --   modules = nil,
    -- },

    telescope = { style = "bordered" },

}

M.nvdash = {
    load_on_startup = true,
    -- header = {
    --     "/^v^\\                   |    |    |                  ",
    --     "                      )_)  )_)  )_)      /^v^\\     ",
    --     "    /^v^\\            )___))___))___)\\              ",
    --     "                   )____)____)____)\\\\            ",
    --     "               _____|____|____|___\\\\\\__       ",
    --     "                  \\                  /              ",
    --     "            ^^^^^^^^ ^^^^^ ^^^^^ ^^^^^ ^^^ ^^^^   ",
    --     "              ^^^^  ^^ ^^^  ^ ^^^ ^^^ ^^^ <>< ^^^ ",
    --     "                 ><> ^^^   ^^   ><> ^^    ^^^^  ^^",
    --     "                                                  ",
    -- },
    -- buttons = {
    --   { "🔎 Find File", "Spc f f", "Telescope find_files" },
    --   { "📋 Recent Files", "Spc f o", "Telescope oldfiles" },
    --   { "🚀 Open Session", "Spc s r", "SessionSearch" },
    --   { "👋 Bookmarks", "Spc m a", "Telescope marks" },
    --   { "🎨 Themes", "Spc t h", "Telescope themes" },
    --   { "  Mappings", "Spc c h", "NvCheatsheet" },
    --   { "  Keymaps", ":Telescope keymaps", "Keymap list" },
    -- },
    -- header = {
    --   "                            ",
    --   "     ▄▄         ▄ ▄▄▄▄▄▄▄   ",
    --   "   ▄▀███▄     ▄██ █████▀    ",
    --   "   ██▄▀███▄   ███           ",
    --   "   ███  ▀███▄ ███           ",
    --   "   ███    ▀██ ███           ",
    --   "   ███      ▀ ███           ",
    --   "   ▀██ █████▄▀█▀▄██████▄    ",
    --   "     ▀ ▀▀▀▀▀▀▀ ▀▀▀▀▀▀▀▀▀▀   ",
    --   "                            ",
    --   "     Powered By  eovim    ",
    --   "                            ",
    -- },

    header = {
        "██╗███╗   ██╗████████╗███████╗██████╗      ██████╗  ██████╗ ",
        "██║████╗  ██║╚══██╔══╝██╔════╝██╔══██╗    ██╔════╝ ██╔═══██╗",
        "██║██╔██╗ ██║   ██║   █████╗  ██████╔╝    ██║  ███╗██║   ██║",
        "██║██║╚██╗██║   ██║   ██╔══╝  ██╔══██╗    ██║   ██║██║   ██║",
        "██║██║ ╚████║   ██║   ███████╗██║  ██║    ╚██████╔╝╚██████╔╝",
        "╚═╝╚═╝  ╚═══╝   ╚═╝   ╚══════╝╚═╝  ╚═╝     ╚═════╝  ╚═════╝",
        "                                                           ",
    },

    buttons = {
        { txt = "🔎  Find File", keys = "ff", cmd = "Telescope find_files" },
        { txt = "📋  Recent Files", keys = "fo", cmd = "Telescope oldfiles" },
        { txt = "󰈭  Find Word", keys = "fw", cmd = "Telescope live_grep" },
        { txt = "🎨  Themes", keys = "th", cmd = ":lua require('nvchad.themes').open()" },
        { txt = "  Mappings", keys = "ch", cmd = "NvCheatsheet" },
        { txt = "🚀 Open Session", keys = "sr", cmd = "SessionSearch" },
        { txt = "  Keymaps", keys = ":Telescope keymaps", cmd = "Keymap list" },

        { txt = "─", hl = "NvDashLazy", no_gap = true, rep = true },

        {
            txt = function()
                local stats = require("lazy").stats()
                local ms = math.floor(stats.startuptime) .. " ms"
                return "  Loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms
            end,
            hl = "NvDashLazy",
            no_gap = true,
        },

        { txt = "─", hl = "NvDashLazy", no_gap = true, rep = true },
    },
}

return M
