return {
    --Catppuccino Theme
    "catppuccin/nvim",
    lazy = false,
    name = 'catppuccin',
    priority = 1000,
    config = function()
        require("catppuccin").setup({
            flavour = "frappe", -- latte, frappe, macchiato, mocha
            background = {      -- :h background
                light = "latte",
                dark = "frappe",
            },
            transparent_background = true, -- disables setting the background color.
            show_end_of_buffer = false,    -- shows the '~' characters after the end of buffers
            term_colors = false,           -- sets terminal colors (e.g. `g:terminal_color_0`)
            dim_inactive = {
                enabled = false,           -- dims the background color of inactive window
                shade = "dark",
                percentage = 0.15,         -- percentage of the shade to apply to the inactive window
            },
            no_italic = false,             -- Force no italic
            no_bold = false,               -- Force no bold
            no_underline = false,          -- Force no underline
            styles = {                     -- Handles the styles of general hi groups (see `:h highlight-args`):
                comments = { "italic" },   -- Change the style of comments
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
                treesitter = true,
                notify = false,
                mini = false,
                -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
                telescope = {
                    enabled = true
                }
            },
        })

        -- setup must be called before loading
        vim.cmd([[colorscheme catppuccin]])
        ------------------------------------------------------------------

        --Dracula Theme
        -- 'Mofiqul/dracula.nvim',
        -- priority = 1000, -- make sure to load this brefore all the other
        -- config = function()
        --
        --     local dracula = require("dracula")
        --     dracula.setup({
        --          -- customize dracula color palette
        --          colors = {
        --            bg = "#282A36",
        --            fg = "#F8F8F2",
        --            selection = "#44475A",
        --            comment = "#6272A4",
        --            red = "#FF5555",
        --            orange = "#FFB86C",
        --            yellow = "#F1FA8C",
        --            green = "#50fa7b",
        --            purple = "#BD93F9",
        --            cyan = "#8BE9FD",
        --            pink = "#FF79C6",
        --            bright_red = "#FF6E6E",
        --            bright_green = "#69FF94",
        --            bright_yellow = "#FFFFA5",
        --            bright_blue = "#D6ACFF",
        --            bright_magenta = "#FF92DF",
        --            bright_cyan = "#A4FFFF",
        --            bright_white = "#FFFFFF",
        --            menu = "#21222C",
        --            visual = "#3E4452",
        --            gutter_fg = "#4B5263",
        --            nontext = "#3B4048",
        --            white = "#ABB2BF",
        --            black = "#191A21",
        --          },
        --  -- show the '~' characters after the end of buffers
        --  show_end_of_buffer = true, -- default false
        --  -- use transparent background
        --  transparent_bg = true, -- default false
        --  })
        --
        --     -- load th ecolorscheme here
        --     vim.cmd([[colorscheme dracula-soft]])

        -------------------------------------------------------------------

        -- customize further
        --
        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
        --
        vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = '#87CEFA', bold = true })
        vim.api.nvim_set_hl(0, 'LineNr', { fg = 'white', bold = true })
        vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = '#FFC0CB', bold = true })
    end,
    -------------------------------------------------------------------
}
