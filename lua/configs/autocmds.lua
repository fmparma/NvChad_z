local augroup = vim.api.nvim_create_augroup("user_cmds", { clear = true })

local function update_git_env_for_dotfiles()
    -- Auto change ENV variables to enable
    -- bare git repository for dotfiles after
    -- loading saved session
    local home = vim.fn.expand("~")
    local git_dir = home .. "/dotfiles"

    if vim.env.GIT_DIR ~= nil and vim.env.GIT_DIR ~= git_dir then
        return
    end

    -- check dotfiles dir exists on current machine
    if vim.fn.isdirectory(git_dir) ~= 1 then
        vim.env.GIT_DIR = nil
        vim.env.GIT_WORK_TREE = nil
        return
    end

    -- check if the current working directory should belong to dotfiles
    local cwd = vim.loop.cwd()
    if vim.startswith(cwd, home .. "/.config/") or cwd == home or cwd == home .. "/.local/bin" then
        if vim.env.GIT_DIR == nil then
            -- export git location into ENV
            vim.env.GIT_DIR = git_dir
            vim.env.GIT_WORK_TREE = home
        end
    else
        if vim.env.GIT_DIR == git_dir then
            -- unset variables
            vim.env.GIT_DIR = nil
            vim.env.GIT_WORK_TREE = nil
        end
    end
end

vim.api.nvim_create_autocmd("DirChanged", {
    pattern = { "*" },
    group = augroup,
    desc = "Update git env for dotfiles after changing directory",
    callback = function()
        update_git_env_for_dotfiles()
    end,
})

vim.api.nvim_create_autocmd("User", {
    pattern = { "SessionLoadPost" },
    group = augroup,
    desc = "Update git env for dotfiles after loading session",
    callback = function()
        update_git_env_for_dotfiles()
    end,
})

-- user event that loads after new buffers
vim.api.nvim_create_autocmd({ "BufRead" }, {
    pattern = { "*.c", "*.h" },
    group = vim.api.nvim_create_augroup("NewFileTemplate", { clear = true }),
    desc = "Opening new *.c or *.h file",
    callback = function(args)
        local file = vim.api.nvim_buf_get_name(args.buf)
        local file_size = vim.fn.getfsize(file)

        if file_size == 0 then
            local buftype = vim.api.nvim_get_option_value("buftype", { buf = args.buf })
            local temp_dir = vim.fn.stdpath("config") .. "\\template"

            if file:match("%.c$") and buftype ~= "nofile" then
                -- vim.notify("Opening source file: " .. temp_dir .. "\\template.c.tp")
                local temp_cont = vim.fn.readfile(temp_dir .. "\\template.c.tp")
                vim.fn.writefile(temp_cont, file)
            elseif file:match("%.h$") and buftype ~= "nofile" then
                -- vim.notify("Opening header file: " .. temp_dir .. "\\template.c.tp")
                local temp_cont = vim.fn.readfile(temp_dir .. "\\template.h.tp")
                vim.fn.writefile(temp_cont, file)
            end

            -- Close and reopen file
            vim.api.nvim_command("e!")
        end
    end,
})

-- You can add this in your init.lua
-- or a global plugin
vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'Enable inlay hints',
    callback = function(event)
        local id = vim.tbl_get(event, 'data', 'client_id')
        local client = id and vim.lsp.get_client_by_id(id)
        if client == nil or not client.supports_method('textDocument/inlayHint') then
            return
        end

        vim.lsp.inlay_hint.enable(true, { bufnr = event.buf })
    end,
})

-- Set filetype for .cla
-- vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
--     group = vim.api.nvim_create_augroup("SetClaFiletype", { clear = true }),
--     desc = "Opening new *.cla file",
--
--     callback = function(args)
--         local file = vim.api.nvim_buf_get_name(args.buf)
--         local buftype = vim.api.nvim_get_option_value("buftype", { buf = args.buf })
--         if file:match("%.cla$") and buftype ~= "nofile" then
--             vim.cmd("setfiletype cla")
--         end
--     end
-- })
