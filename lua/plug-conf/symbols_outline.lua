local status_ok, _ = pcall(require, "symbols-outline")
if not status_ok then
    --vim.notify("cannot load plugin symbols-outline")
    require("util.notify").notify("cannot load plugin symbols-ouline","error","Plugin")
    return
end

local M = {}


local function config_symbols_outline(config)
    local opts = {
        highlight_hovered_item = true,
        show_guides = true,
        auto_preview = true,
        position = "right",
        relative_width = true,
        width = 25,
        auto_close = true,
        show_numbers = true,
        show_relative_numbers = true,
        show_symbol_details = true,
        preview_bg_highlight = "Pmenu",
        keymaps = { -- These keymaps can be a string or a table for multiple keys
        },
        lsp_blacklist = {},
        symbol_blacklist = {},
        symbols = {
            File = { icon = "", hl = "TSURI" },
            Module = { icon = "", hl = "TSNamespace" },
            Namespace = { icon = "", hl = "TSNamespace" },
            Package = { icon = "", hl = "TSNamespace" },
            Class = { icon = "𝓒", hl = "TSType" },
            Method = { icon = "ƒ", hl = "TSMethod" },
            Property = { icon = "", hl = "TSMethod" },
            Field = { icon = "", hl = "TSField" },
            Constructor = { icon = "", hl = "TSConstructor" },
            Enum = { icon = "練", hl = "TSType" },
            Interface = { icon = "ﰮ", hl = "TSType" },
            Function = { icon = "", hl = "TSFunction" },
            Variable = { icon = "", hl = "TSConstant" },
            Constant = { icon = "", hl = "TSConstant" },
            String = { icon = "𝓐", hl = "TSString" },
            Number = { icon = "#", hl = "TSNumber" },
            Boolean = { icon = "⊨", hl = "TSBoolean" },
            Array = { icon = "", hl = "TSConstant" },
            Object = { icon = "⦿", hl = "TSType" },
            Key = { icon = "🔐", hl = "TSType" },
            Null = { icon = "NULL", hl = "TSType" },
            EnumMember = { icon = "", hl = "TSField" },
            Struct = { icon = "𝓢", hl = "TSType" },
            Event = { icon = "🗲", hl = "TSType" },
            Operator = { icon = "+", hl = "TSOperator" },
            TypeParameter = { icon = "𝙏", hl = "TSParameter" },
        },
    }
    config.setup(opts)
end

function M.setup()
    config_symbols_outline(require("symbols-outline"))
end

return M
