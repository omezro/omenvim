-- local lspconfig = require("lspconfig")
local util = require("lspconfig/util")

return {
    cmd = { "gopls", "serve", "-debug=localhost:8098" },
    filetypes = { "go", "gomod" },
    root_dir = util.root_pattern("go.work", "go.mod", ".git"),
    settings = {
        gopls = {
            symbolStyle = "Full", -- Full| Dynamic | Package
            ------------------------------------------------
            ----      Analyses Setting
            ------------------------------------------------
            analyses = {
                unusedparams = true,
                unreachable = true,
                fillstruct = true,
            },
            ------------------------------------------------
            ----      Complete Setting
            ------------------------------------------------
            usePlaceholders = true, -- placeholders enables placeholders for function parameters or struct fields in completion responses.
            -- completionBudget = "0ms", -- completionBudget is the soft latency goal for completion requests
            matcher = "Fuzzy", -- matcher sets the algorithm that is used when calculating completion candidates. CaseInsensitive | CaseSensitive | Fuzzy
            completeUnimported = true,
            deepCompletion = true, -- If true, this turns on the ability to return completions from deep inside relevant entities, rather than just the locally accessible ones.
            -- experimentalWatchedFileDelay = "10ms"

        },
    },
    single_file_support = true,
}
