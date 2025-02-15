vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use 'tpope/vim-fugitive'

    use 'tpope/vim-commentary'

    use 'tpope/vim-eunuch'

    use 'tpope/vim-surround'

    use 'tpope/vim-repeat'

    use {
        'airblade/vim-gitgutter',
        branch = 'main'
    }

    use {
        "catppuccin/nvim",
        config = function()
		require("catppuccin").setup({
			flavour = "mocha",
			transparent_background = false,
			term_colors = true,
			dim_inactive = {
				enabled = true,
				shade = "dark",
				percentage = 0.0, -- Counterintuitively, 0.0 is the darkest it goes.
				-- The color matches up with the backdrop color on zen-mode, set to 0.8
			},
            styles = {
            comments = { "italic" },
            conditionals = { "bold" },
            loops = {},
            functions = {},
            keywords = {},
            strings = {},
            variables = {},
            numbers = {},
            booleans = { "italic" },
            properties = {},
            types = {},
            operators = {},
        },
        custom_highlights = function (colors)
            return {
                Folded = { fg = colors.surface2, bg = colors.none }
            }
        end
		})
	end,
    }

    use {
        'norcalli/nvim-colorizer.lua',
        config = function ()
            require("colorizer").setup({
                'css',
                'javascript',
                'html',
                'svelte',
            })
        end
    }

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
        config = function ()
            require("telescope").setup{
                defaults = {
                    borderchars = {
                        "─", "│", "─", "│", "┌", "┐", "┘", "└"
                    }
                }
            }
        end,
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},

            {
                "dundalek/lazy-lsp.nvim",
                requires = { "neovim/nvim-lspconfig" },
                config = function()
                    require("lazy-lsp").setup {}
                end
            },

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

    use 'RRethy/nvim-align'

    use {
        'folke/zen-mode.nvim',
        config = function()
            require("zen-mode").setup({
                window = {
                    width = 80,
                    backdrop = 0.8,
                    options = {
                        number = false,
                        signcolumn = "no",
                    }
                },
            })
        end,
    }

    use 'lukas-reineke/indent-blankline.nvim'

    use {
        'stevearc/oil.nvim',
        config = function ()
            require("oil").setup({
                view_options = {
                    show_hidden = true,
                }
            })
        end
    }

    use 'Hoffs/omnisharp-extended-lsp.nvim' -- Workaround for Go to definition for C#

end)

