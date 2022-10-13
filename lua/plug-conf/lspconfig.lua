local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
    --vim.notify("lspconfig not found!")
    require("util.notify").notify("cannot load plugin lspconfig","error","Plugin")
    return
end

local M = {}


local function config_lspconfig(handler)
    local opts = {
        on_attach = handler.on_attach(),
        capabilities = handler.capabilities(),
    }

    -- Enable some language servers with the additional completion capabilities offered by nvim-cmp

    local servers = { "clangd", "pyright", "gopls", "rust_analyzer", "sumneko_lua" }
    for _, lsp in ipairs(servers) do
        -- todo debug eg print sth
        local lsp_opt = opts
        if string.match(lsp, "gopls") then
            lsp_opt = vim.tbl_deep_extend("force", require("lsp/ls/gopls"), opts)
        end
        if string.match(lsp, "clangd") then
            lsp_opt = vim.tbl_deep_extend("force", require("lsp/ls/clangd"), opts)
        end
        if string.match(lsp, "rust_analyzer") then
            lsp_opt = vim.tbl_deep_extend("force", require("lsp/ls/rust_analyzer"), opts)
        end
        if string.match(lsp, "sumneko_lua") then
            lsp_opt = vim.tbl_deep_extend("force", require("lsp/ls/lualsp"), opts)
        end

        lspconfig[lsp].setup(lsp_opt)
    end

end

local function ext_config_golang()
    -- if current file is not gofile then return
    function _G._Go_Package_Complete()
        local get_pkgs = function()
            local results = {}
            local list_pkg = io.popen("gopkgs"):read("*all")
            for line in list_pkg:gmatch("[^\n\r]+") do
                table.insert(results, line)
            end
            return results
        end

        local co = coroutine.create(function()
            local selectco = assert(coroutine.running(), 'main thread!')
            local items = get_pkgs()
            vim.ui.select(items, { prompt = "Import Packages Path" }, function(choice)
                coroutine.resume(selectco, choice)
            end)
            local value = coroutine.yield()
            -- if cancel when select , then skip the following step, only return
            if (value == nil or value == '') then
                return
            end

            local inputco = coroutine.running()
            vim.ui.input({ prompt = "Input Alias Pkg Name:" }, function(input)
                coroutine.resume(inputco, input)
            end)
            local aliase = coroutine.yield()

            local pos = vim.api.nvim_win_get_cursor(0)[2]
            local line = vim.api.nvim_get_current_line()
            local next_line = line:sub(0, pos + 1) .. "\t" .. aliase .. "\"" .. value .. "\"" .. line:sub(pos + 2)
            vim.api.nvim_set_current_line(next_line)
            vim.lsp.buf.formatting()
        end)
        coroutine.resume(co)
    end

    vim.keymap.set("n", "<leader>lI", "<cmd>lua _Go_Package_Complete()<cr>", { desc = "Import Package" })

end

function M.setup()
    local handler = require("lsp/handler")
    handler.setup()
    config_lspconfig(handler)

    ext_config_golang()

end

return M
