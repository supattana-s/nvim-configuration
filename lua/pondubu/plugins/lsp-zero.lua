return {
    {
        {
            'VonHeikemen/lsp-zero.nvim',
            branch = 'v3.x',
            lazy = true,
            config = false,
            init = function()
                -- Disable automatic setup, we are doing it manually
                vim.g.lsp_zero_extend_cmp = 0
                vim.g.lsp_zero_extend_lspconfig = 0
            end,
        },
        {
            'williamboman/mason.nvim',
            lazy = false,
            config = true,
        },

        -- Autocompletion
        {
            'hrsh7th/nvim-cmp',
            event = 'InsertEnter',
            dependencies = {
                { 'L3MON4D3/LuaSnip' },
            },
            config = function()
                -- Here is where you configure the autocompletion settings.
                local lsp_zero = require('lsp-zero')
                lsp_zero.extend_cmp()

                -- And you can configure cmp even more, if you want to.
                local cmp = require('cmp')
                local cmp_action = lsp_zero.cmp_action()

                cmp.setup({
                    formatting = lsp_zero.cmp_format(),
                    mapping = cmp.mapping.preset.insert({
                        ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
                        ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
                        ["<C-y>"] = cmp.mapping.confirm({ select = true }),
                        ["<C-Space>"] = cmp.mapping.complete(),
                        ['<Tab>'] = cmp_action.tab_complete(),
                        ['<S-Tab>'] = cmp_action.select_prev_or_fallback(),
                    })
                })
            end
        },

        -- LSP
        {
            'neovim/nvim-lspconfig',
            cmd = 'LspInfo',
            event = { 'BufReadPre', 'BufNewFile' },
            dependencies = {
                { 'hrsh7th/cmp-nvim-lsp' },
                { 'williamboman/mason-lspconfig.nvim' },
            },
            config = function()
                -- This is where all the LSP shenanigans will live
                local lsp_zero = require('lsp-zero')
                lsp_zero.extend_lspconfig()

                lsp_zero.on_attach(function(client, bufnr)
                    -- see :help lsp-zero-keybindings
                    -- to learn the available actions
                    lsp_zero.default_keymaps({ buffer = bufnr })
                end)

                require('mason-lspconfig').setup({
                    ensure_installed = {
                        -- your lsp below
                        'gopls',
                        'tsserver',
                        'pyright',
                        'rust_analyzer',
                        'lua_ls'
                    },
                    handlers = {
                        lsp_zero.default_setup,
                    }
                })

                -- format on save
                lsp_zero.format_on_save({
                    format_opts = {
                        async = false,
                        timeout_ms = 10000,
                    },
                    servers = {
                        ['tsserver'] = { 'javascript', 'typescript' },
                        ['rust_analyzer'] = { 'rust' },
                        ['lua_ls'] = { 'lua' },
                        ['gopls'] = { 'go' },
                    }
                })
            end
        }
    }
}
