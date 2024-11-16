local function my_on_attach(bufnr)
    local api = require "nvim-tree.api"

    api.config.mappings.default_on_attach(bufnr)

    -- custom mappings
    vim.keymap.set("n", "<C-T>", api.tree.toggle)
    vim.keymap.set("n", "T", api.tree.open)
    vim.keymap.set("n", "?", api.tree.toggle_help)
end


return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("nvim-tree").setup({
            view = {
                width = 25,
            },
            on_attach = my_on_attach
        }
        )
    end,
}
