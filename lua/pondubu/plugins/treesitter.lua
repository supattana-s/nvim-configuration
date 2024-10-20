return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        dependencies = {
            "windwp/nvim-ts-autotag",
        },
        config = function()
            local configs = require("nvim-treesitter.configs")

            configs.setup({
                ensure_installed = { "c", "lua", "go", "rust", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "typescript", "html", "tsx" },
                sync_install = false,
                highlight = { enable = true },
                indent = { enable = true },
            })
        end
    },
    {
        'windwp/nvim-ts-autotag',
        -- opts = {},
        config = function()
            -- require 'nvim-ts-autotag'.setup()
            require('nvim-ts-autotag').setup({
                opt = {
                    enable_close = true,         -- Auto close tags
                    enable_rename = true,        -- Auto rename pairs of tags
                    enable_close_on_slash = true -- Auto close on trailing </
                }
            })
        end,
    }
}
