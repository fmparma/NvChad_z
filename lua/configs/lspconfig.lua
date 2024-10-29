-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = { "html", "cssls", "rust_analyzer", "clangd", "pyright", "vim-language-server" }
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        on_attach = nvlsp.on_attach,
        on_init = nvlsp.on_init,
        capabilities = nvlsp.capabilities,
    }
end

-- pyright for python
lspconfig.pyright.setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
    filetypes = { "python" },
}

-- changd for C language
-- lspconfig.clangd.setup {
    -- on_attach = nvlsp.on_attach,
    -- on_init = nvlsp.on_init,
    -- capabilities = nvlsp.capabilities,
    -- c, cpp, objc, objcpp, cuda, proto
    -- filetypes = { "c", "cpp", "cla", "cc" },
    -- init_options = {
    --     queryProvider = {
    --         enabled = true,
    --         subsribe = {
    --             -- Only handle ".c", ".h", ".cla" file
    --             files = { ".h", ".H", ".c", ".C", ".cpp", ".CPP", ".cla", ".CLA" },
    --         },
    --     },
    -- },
-- }

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
