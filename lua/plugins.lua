local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

------------------------------------------------
----      Bootstrap, AutoCompile Packer,
------------------------------------------------
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = vim.fn.system({
        "git",
        "clone",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    })
    vim.api.nvim_command("packadd packer.nvim")
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerInstall
  augroup end
]])

local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

------------------------------------------------
----      Config Packer Some Behavior
------------------------------------------------
packer.init({
    max_jobs = 50,
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "rounded" })
        end,
    },
})

------------------------------------------------
----      Packer Manager Plugins
------------------------------------------------
return require("packer").startup(function(use)
    use("wbthomason/packer.nvim") -- Packer can manage itselfplugin

    ------------------------------------------------
    ----      ColorsTheme , UI               -------
    ------------------------------------------------
    use({ -- colorstheme
        "rebelot/kanagawa.nvim",
        "ellisonleao/gruvbox.nvim",
        "rmehri01/onenord.nvim",
        "olimorris/onedarkpro.nvim",
        "EdenEast/nightfox.nvim",
        "folke/tokyonight.nvim",
        "Mofiqul/dracula.nvim",
        "catppuccin/nvim", as = "catppuccin",
        "projekt0n/github-nvim-theme",
        "yashguptaz/calvera-dark.nvim",
        "Th3Whit3Wolf/one-nvim",
        "NTBBloodbath/doom-one.nvim",
        config = function()
            require("plug-conf.themes")
        end,
    })
    use({
        "kyazdani42/nvim-web-devicons",
        config = function()
            require("nvim-web-devicons").setup({ default = true })
        end,
    })
    use({ --- alpha is a fast and fully customizable greeter for neovim.
        "goolord/alpha-nvim",
        requires = { "kyazdani42/nvim-web-devicons" },
        config = function()
            require("plug-conf.dashboard")
        end,
    })
    use({
        "nvim-lualine/lualine.nvim",
        config = function()
            require("plug-conf.lualine")
        end,
    })
    use({
        "simrat39/symbols-outline.nvim",
        config = function()
            require("plug-conf.symbols_outline").setup()
        end,
    })

    use({
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            require("plug-conf.trouble").setup()
        end,
    })

    use({
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require("plug-conf.treesitter").setup()
        end,
    })
    use({
        "akinsho/bufferline.nvim",
        tag = "v2.*",
        config = function()
            require("plug-conf.bufferline").setup()
        end,
        requires = "kyazdani42/nvim-web-devicons",
    })

    ------------------------------------------------
    ----      Windows Manager
    ------------------------------------------------
    use({
        "akinsho/toggleterm.nvim",
        tag = "v2.*",
        config = function()
            require("plug-conf.term").setup()
        end,
    })

    ------------------------------------------------
    ----      Fuzz Finder Plugins
    ------------------------------------------------
    use({
        "nvim-telescope/telescope.nvim",
        requires = { "nvim-telescope/telescope-ui-select.nvim" },
        config = function()
            require("plug-conf.telescope").setup()
        end,
    })
    use({
        "nvim-telescope/telescope-fzf-native.nvim",
        requires = { "nvim-lua/plenary.nvim" },
        after = { "telescope.nvim" },
        run = "make",
        config = function()
            require("telescope").load_extension("fzf")
        end,
    })


    ------------------------------------------------
    ----      Misc Helper Plugins
    ------------------------------------------------
    use({
        --"kyazdani42/nvim-tree.lua", -- directory browser
        "nvim-tree/nvim-tree.lua",
        requires = { 'nvim-tree/nvim-web-devicons' },
        tag = 'nightly',
        config = function()
            require("plug-conf.tree").setup()
        end,
    })

    --use({
        --"JoosepAlviste/nvim-ts-context-commentstring",
    --})
    use({
        "b3nj5m1n/kommentary",
        config = function()
            require("plug-conf.komment").setup()
        end,
    })

    use({
        "windwp/nvim-autopairs",
        config = function()
            require("plug-conf.autopairs").setup()
        end,
    })

    use({
        "stevearc/aerial.nvim",
        config = function()
            require("plug-conf.aerial").setup()
        end,
    })

    use({
        "phaazon/hop.nvim",
        branch = "v2",
        config = function()
            require("plug-conf.hop").setup()
        end,
    })

    use({ -- Standalone UI for nvim-lsp progress. Eye candy for the impatient.
        "j-hui/fidget.nvim",
        config = function()
            require("fidget").setup({ timer = { fidget_decay = 500, task_decay = 500, spinner_rate = 125 } })
        end,
    })

    ----------------------------------------------------------------
    ----      Completion , Diagnostics , Snippets,  LSP
    ----------------------------------------------------------------
    use({
        "hrsh7th/nvim-cmp",
        config = function()
            require("plug-conf.cmp").setup()
        end,
        requires = {
            { "hrsh7th/cmp-path" }, -- path completion plugin
            { "hrsh7th/cmp-buffer" }, -- buffer completion plugin
            { "hrsh7th/cmp-nvim-lsp" }, -- lsp
            -- snippet support
            {
                "L3MON4D3/LuaSnip",
                config = function()
                    require("plug-conf.luasnip").setup()
                end,
            },
            { "saadparwaiz1/cmp_luasnip" }, -- completete for snippets
            -- { "honza/vim-snippets" },
            -- { "rafamadriz/friendly-snippets" },
        },
    })
    use({
        "neovim/nvim-lspconfig",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            "antoinemadec/FixCursorHold.nvim",
            "RRethy/vim-illuminate",
        },
        config = function()
            require("plug-conf.lspconfig").setup()
        end,
    })
    use({ -- rust lsp
        "simrat39/rust-tools.nvim",
        requires = { "neovim/nvim-lspconfig", ft = "rust" },
    })
    use({ -- lsp_signature
        "ray-x/lsp_signature.nvim",
        config = function()
            require("plug-conf.lspsignature")
        end,
    })
    use({
        "williamboman/nvim-lsp-installer",
        config = function ()
            require("plug-conf.nvim-lsp-installer")
        end
    })

    ----------------------------------------------------------------
    ----      Dap Debugger
    ----------------------------------------------------------------
    use({
        "michaelb/sniprun",
        run = "bash ./install.sh",
        config = function()
            require("plug-conf.sniprun").setup()
        end,
    })
    use({
        "mfussenegger/nvim-dap",
        config = function()
            require("plug-conf.dap").setup()
        end,
    })
    use({
        "rcarriga/nvim-dap-ui",
        after = "nvim-dap",
        module = "dapui",
        config = function()
            require("plug-conf.dap-ui").setup()
        end,
    })
    use({
        "theHamsta/nvim-dap-virtual-text",
        after = "nvim-dap",
        config = function()
            require("plug-conf.dap-vt")
        end,
    })
    use({
        "rcarriga/nvim-notify",
        config = function ()
            require("plug-conf.notify").setup()
        end
    })
    use({
        "nvim-telescope/telescope-dap.nvim",
        after = { "telescope.nvim", "nvim-dap" },
        config = function()
            require("telescope").load_extension("dap")
        end,
    })

    ----------------------------------------------------------------
    ----      Unit Test
    ----------------------------------------------------------------
    use({
        "nvim-neotest/neotest",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-neotest/neotest-go",
            "rouge8/neotest-rust",
        },
        config = function()
            require("plug-conf.neotest").setup()
        end,
    })

    ----------------------------------------------------------------
    ----      Git Plugins
    ----------------------------------------------------------------
    use({
        "lewis6991/gitsigns.nvim",
        config = function()
            require("plug-conf.gitsigns").setup()
        end,
    })

    ----------------------------------------------------------------
    ----      Some Misc Plugin (but should placed at the end)
    ----------------------------------------------------------------
    use({ "wakatime/vim-wakatime" }) -- wakatime

    use({ -- which key
        "folke/which-key.nvim",
        config = function()
            require("plug-conf.which-key").setup()
        end,
    })
    -- With the release of Neovim 0.6 we were given the start of extensible core UI hooks
    use({
        "stevearc/dressing.nvim",
        config = function()
            require("plug-conf.dressing").setup()
        end,
    })

    -- draw acssi
    use({ "jbyuki/venn.nvim" })


    -- A high-performance color highlighter for Neovim which has no external dependencies! Written in performant Luajit.
    use({
        "Akianonymus/nvim-colorizer.lua",
        config = function()
            require("plug-conf.colorizer").setup()
        end
    })
    use({ -- rust lsp
        "jose-elias-alvarez/null-ls.nvim",
        requires = { "nvim-lua/plenary.nvim", },
        config = function()
            require("plug-conf.null-ls").setup()
        end
    })

    use({
        "karb94/neoscroll.nvim",
        config = function()
            require("plug-conf.neoscroll").setup()
        end
    })

    -------------------------------------------- 
    -- 
    -------------------------------------------- 
    --  Automatically set up your configuration after cloning packer.nvim
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
