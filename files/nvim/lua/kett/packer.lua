vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use 'tpope/vim-fugitive'

    use 'tpope/vim-commentary'

    use {
        'airblade/vim-gitgutter',
        branch = 'main'
    }

    use 'ap/vim-css-color'

    use {
        'nvim-lualine/lualine.nvim',
        config = function ()
            require("lualine").setup({
                theme = 'auto',
                sections = {
                    lualine_a = {'mode'},
                    lualine_b = {
                        'branch',
                        'diff',
                        {
                            'diagnostics',
                            symbols = {
                                error = "E",
                                warn = "W",
                                info = "I",
                                hint = "H",
                            },
                            diagnostics_color = {
                                error = 'DiagnosticError', -- Changes diagnostics' error color.
                                warn  = 'DiagnosticWarn',  -- Changes diagnostics' warn color.
                                info  = 'DiagnosticInfo',  -- Changes diagnostics' info color.
                                hint  = 'DiagnosticHint',  -- Changes diagnostics' hint color.
                            },
                        }
                    },
                    lualine_c = {'filename'},
                    lualine_x = {
                        'encoding',
                        {
                            'fileformat',
                            symbols = {
                                unix = "unix",
                                dos = "dos",
                                mac = "mac",
                            }
                        },
                        'filetype'
                    },
                    lualine_y = {'progress'},
                    lualine_z = {'location'}
                },
            })
        end
    }

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            {
                'williamboman/mason.nvim',
                config = function ()
                    require("mason").setup()
                end
            },
            {'williamboman/mason-lspconfig.nvim'},

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'saadparwaiz1/cmp_luasnip'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'},

            -- Snippets
            {'L3MON4D3/LuaSnip'},
        }
    }

    use 'HiPhish/rainbow-delimiters.nvim'
    use 'mbbill/undotree'
    use 'simrat39/symbols-outline.nvim'

    use 'JoshPorterDev/nvim-base16'

    use 'RRethy/nvim-align'

    use {
        "epwalsh/obsidian.nvim",
        requires = {
            -- Required.
            "nvim-lua/plenary.nvim",
        },
        config = function()
            require("obsidian").setup({

                ui = {
                    enable = false,
                },

                dir = "~/Documents/Writes/Obsidian/Kodex/",
                disable_frontmatter = true,

                daily_notes = {
                    folder = "Daily Notes",
                    date_format = "%Y-%m-%d",
                },
                mappings = {
                    ["gf"] = {
                        action = function()
                            return require("obsidian").util.gf_passthrough()
                        end,
                        opts = {
                            noremap = false,
                            expr = true,
                            buffer = true,
                        }
                    }
                },

                templates ={
                    subdir = "Templates",
                    date_format = "%Y-%m-%d",
                    time_format = "%H:%M:%S",
                },

                note_id_func = function (title)
                    if title == nil
                        then
                            return tostring(os.time())
                        end
                    return title
                end,

            })
        end,
    }

    use {
        'folke/zen-mode.nvim',
        config = function()
            require("zen-mode").setup({
                window = {
                    width = 85,
                    backdrop = 0.8,
                },
            })
        end,
    }

end)

