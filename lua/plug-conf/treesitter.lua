local status_ok, _ = pcall(require, "nvim-treesitter")
if not status_ok then
    --vim.notify("nvim-treesitter not found!")
    require("util.notify").notify("cannot load plugin nvim-treesitter","error","Plugin")
    return
end

local M = {}

local function config_nvim_treesitter(config)
    config.setup({
        ensure_installed = {
            "c",
            "cpp",
            "python",
            "go",
            "rust",
            "lua",
            "bash",
            "json",
        },
        -- Install parsers synchronously (only applied to `ensure_installed`)
        sync_install = false,
        auto_install = true,
        -- auto tag with nvim-ts-autotag
        autotag = { enable = true },
        autopairs = { enable = true },
        highlight = {
            enable = true,
            disable = { "c","cpp" },
            additional_vim_regex_higlighting = true,
        },
        indent = { enable = true, disable = { "" } },
        context_commentstring = {
            enable = true,
            config = {
                go = { __default = "// %s", __multiline = "/* %s */" },
                rust = { __default = "// %s", __multiline = "/* %s */" },
                c = { __default = "// %s", __multiline = "/* %s */" },
                python = { __default = "# %s", __multiline = "# %s" },
            },
        },
    })

    -- vim.o.foldmethod = "expr"
    -- vim.o.foldexpr = "nvim_treesitter#foldexpr()"

end

function M.setup()
    -- do config
    config_nvim_treesitter(require("nvim-treesitter.configs"))
end

return M
