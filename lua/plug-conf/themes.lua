local status_ok, kanagawa_config = pcall(require, "kanagawa")
if status_ok then
    --local default_colors = require("kanagawa.colors").setup()
    kanagawa_config.setup({
        undercurl = true, -- enable undercurls
        commentStyle = { italic = true },
        functionStyle = {},
        keywordStyle = { italic = true },
        statementStyle = { bold = true },
        typeStyle = {},
        variablebuiltinStyle = { italic = true },
        specialReturn = true, -- special highlight for the return keyword
        specialException = true, -- special highlight for exception handling keywords
        transparent = false, -- do not set background color
        dimInactive = false, -- dim inactive window `:h hl-NormalNC`
        globalStatus = false, -- adjust window separators highlight for laststatus=3
        terminalColors = true, -- define vim.g.terminal_color_{0,17}
        colors = {},
        overrides = {},
    })
    -- setup must be called before loading
end

local status_dra, dracula_config = pcall(require, "dracula")
if status_dra then
   dracula_config.setup({
        -- customize dracula color palette
        colors = {
            bg = "#282A36",
            fg = "#F8F8F2",
            selection = "#44475A",
            comment = "#6272A4",
            red = "#FF5555",
            orange = "#FFB86C",
            yellow = "#F1FA8C",
            green = "#50fa7b",
            purple = "#BD93F9",
            cyan = "#8BE9FD",
            pink = "#FF79C6",
            bright_red = "#FF6E6E",
            bright_green = "#69FF94",
            bright_yellow = "#FFFFA5",
            bright_blue = "#D6ACFF",
            bright_magenta = "#FF92DF",
            bright_cyan = "#A4FFFF",
            bright_white = "#FFFFFF",
            menu = "#21222C",
            visual = "#3E4452",
            gutter_fg = "#4B5263",
            nontext = "#3B4048",
        },
        -- show the '~' characters after the end of buffers
        show_end_of_buffer = true, -- default false
        -- use transparent background
        transparent_bg = true, -- default false
        -- set custom lualine background color
        lualine_bg_color = "#44475a", -- default nil
        -- set italic comment
        italic_comment = true, -- default false
        -- overrides the default highlights see `:h synIDattr`
        overrides = {
            -- Examples
            -- NonText = { fg = dracula.colors().white }, -- set NonText fg to white
            -- NvimTreeIndentMarker = { link = "NonText" }, -- link to NonText highlight
            -- Nothing = {} -- clear highlight of Nothing
        },
    })
end

local status_tok, tokyonight_config = pcall(require, "tokyonight")
if status_tok then
    tokyonight_config.setup({
        -- your configuration comes here
        -- or leave it empty to use the default settings
        style = "night", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
        transparent = false, -- Enable this to disable setting the background color
        terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
        styles = {
            -- Style to be applied to different syntax groups
            -- Value is any valid attr-list value for `:help nvim_set_hl`
            comments = { italic = true },
            keywords = { italic = true },
            functions = {},
            variables = {},
            -- Background styles. Can be "dark", "transparent" or "normal"
            sidebars = "dark", -- style for sidebars, see below
            floats = "dark", -- style for floating windows
        },
        sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
        day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
        hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
        dim_inactive = false, -- dims inactive windows
        lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold

        --- You can override specific color groups to use other groups or a hex color
        --- function will be called with a ColorScheme table
        --- colors ColorScheme
        on_colors = function(colors) end,

        --- You can override specific highlights to use other groups or a hex color
        --- function will be called with a Highlights and ColorScheme table
        --- param highlights Highlights
        --- param colors ColorScheme
        on_highlights = function(highlights, colors) end,
    })
end

local status_grv, gruvbox_config = pcall(require, "gruvbox")
if status_grv then
    gruvbox_config.setup({
        undercurl = true,
        underline = true,
        bold = true,
        italic = true,
        strikethrough = true,
        invert_selection = false,
        invert_signs = false,
        invert_tabline = false,
        invert_intend_guides = false,
        inverse = true, -- invert background for search, diffs, statuslines and errors
        contrast = "", -- can be "hard", "soft" or empty string
        overrides = {},
    })
    -- setup must be called before loading
end

local status_one, onenord_config = pcall(require, "onenord")
if status_one then
    onenord_config.setup({
        theme = "dark", -- "dark" or "light". Alternatively, remove the option and set vim.o.background instead
        borders = true, -- Split window borders
        fade_nc = false, -- Fade non-current windows, making them more distinguishable
        -- Style that is applied to various groups: see `highlight-args` for options
        styles = {
            comments = "NONE",
            strings = "NONE",
            keywords = "NONE",
            functions = "NONE",
            variables = "NONE",
            diagnostics = "underline",
        },
        disable = {
            background = false, -- Disable setting the background color
            cursorline = false, -- Disable the cursorline
            eob_lines = true, -- Hide the end-of-buffer lines
        },
        -- Inverse highlight for different groups
        inverse = {
            match_paren = false,
        },
        custom_highlights = {}, -- Overwrite default highlight groups
        custom_colors = {}, -- Overwrite default colors
    })
    -- setup must be called before loading
end

local status_nig, nightfox_config = pcall(require, "nightfox")
if status_nig then
    nightfox_config.setup({
        options = {
            -- Compiled file's destination location
            compile_path = vim.fn.stdpath("cache") .. "/nightfox",
            compile_file_suffix = "_compiled", -- Compiled file suffix
            transparent = false, -- Disable setting background
            terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
            dim_inactive = false, -- Non focused panes set to alternative background
            styles = { -- Style to be applied to different syntax groups
                comments = "NONE", -- Value is any valid attr-list value `:help attr-list`
                conditionals = "NONE",
                constants = "NONE",
                functions = "NONE",
                keywords = "NONE",
                numbers = "NONE",
                operators = "NONE",
                strings = "NONE",
                types = "NONE",
                variables = "NONE",
            },
            inverse = { -- Inverse highlight for different types
                match_paren = false,
                visual = false,
                search = false,
            },
            modules = { -- List of various plugins and additional options
                -- ...
            },
        },
        palettes = {},
        specs = {},
        groups = {},
    })
end
-- Nordfox

local status_odp, onedarkpro_config = pcall(require, "onedarkpro")
if status_odp then
    onedarkpro_config.setup({
        dark_theme = "onedark", -- The default dark theme
        light_theme = "onelight", -- The default light theme
        colors = {}, -- Override default colors by specifying colors for 'onelight' or 'onedark' themes
        highlights = {}, -- Override default highlight groups
        --ft_highlights = {}, -- Override default highlight groups for specific filetypes
        plugins = { -- Override which plugin highlight groups are loaded
            -- See the Supported Plugins section for a list of available plugins
        },
        styles = { -- Choose from "bold,italic,underline"
            strings = "NONE", -- Style that is applied to strings.
            comments = "NONE", -- Style that is applied to comments
            keywords = "NONE", -- Style that is applied to keywords
            functions = "NONE", -- Style that is applied to functions
            variables = "NONE", -- Style that is applied to variables
            virtual_text = "NONE", -- Style that is applied to virtual text
        },
        options = {
            bold = false, -- Use the colorscheme's opinionated bold styles?
            italic = false, -- Use the colorscheme's opinionated italic styles?
            underline = false, -- Use the colorscheme's opinionated underline styles?
            undercurl = false, -- Use the colorscheme's opinionated undercurl styles?
            cursorline = false, -- Use cursorline highlighting?
            transparency = false, -- Use a transparent background?
            terminal_colors = false, -- Use the colorscheme's colors for Neovim's :terminal?
            window_unfocused_color = false, -- When the window is out of focus, change the normal background?
        },
   })
end

local statuscat_ok, catppuccin = pcall(require, "catppuccin")
if not statuscat_ok then
	vim.notify("catppuccin not found")
	return
end

catppuccin.setup({
	flavour = "mocha", -- latte, frappe, macchiato, mocha
    background = { -- :h background
        light = "latte",
        dark = "mocha",
    },
    transparent_background = false,
    term_colors = false,
    dim_inactive = {
        enabled = false,
        shade = "dark",
        percentage = 0.15,
    },
    no_italic = false, -- Force no italic
    no_bold = false, -- Force no bold
    styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
    },
    color_overrides = {},
    custom_highlights = {},
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        telescope = true,
        notify = false,
        mini = false,
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
    },
})

local github_status, github = pcall(require, "github-theme")
if not statuscat_ok then
	vim.notify("github not found")
	return
end

github.setup({
    theme_style = "dark_colorblind",
    function_style = "italic",
    comment_style = "italic",
    keyword_style = "italic",
    variable_style = "italic",
    sidebars = {"qf", "vista_kind", "terminal", "packer"},

    -- Change the "hint" color to the "orange" color, and make the "error" color bright #FF5555
    colors = {hint = "orange", error = "#FF5555"},

    -- Overwrite the highlight groups
    overrides = function(c)
        return {
        htmlTag = {fg = c.red, bg = "#282c34", sp = c.hint, style = "underline"},
        DiagnosticHint = {link = "LspDiagnosticsDefaultHint"},
        -- this will remove the highlight groups
        TSField = {},
        }
    end
})

local status_calvera, calvera_config = pcall(require, "calvera-dark")
if status_calvera then
    calvera_config.setup({
        calvera_italic_keywords = false,
        calvera_borders = true,
        calvera_contrast = true,
        calvera_hide_eob = true,
        calvera_custom_colors = {contrast = "#0f111a"}
    })
end


local status_onenvim, onenvim_config = pcall(require, "one-nvim")
if status_onenvim then
    onenvim_config.setup({
        one_nvim_transparent_bg = true
    })
end

local status_doom, doom_config = pcall(require, "doom-one")
if status_doom then
    doom_config.setup({
        -- Add color to cursor
		doom_one_cursor_coloring = false,
		-- Set :terminal colors
		doom_one_terminal_colors = true,
		-- Enable italic comments
		doom_one_italic_comments = false,
		-- Enable TS support
		doom_one_enable_treesitter = true,
		-- Color whole diagnostic text or only underline
        doom_one_diagnostics_text_color = false,
		-- Enable transparent background
		doom_one_transparent_background = false,

        -- Pumblend transparency
		doom_one_pumblend_enable = false,
		doom_one_pumblend_transparency = 20,

        -- Plugins integration
		doom_one_plugin_neorg = true,
		doom_one_plugin_barbar = false,
		doom_one_plugin_telescope = false,
		doom_one_plugin_neogit = true,
		doom_one_plugin_nvim_tree = true,
	    doom_one_plugin_dashboard = true,
		doom_one_plugin_startify = true,
		doom_one_plugin_whichkey = true,
		doom_one_plugin_indent_blankline = true,
		doom_one_plugin_vim_illuminate = true,
		doom_one_plugin_lspsaga = false,
    })
end


