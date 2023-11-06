vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use 'tpope/vim-fugitive'

    use {
        'airblade/vim-gitgutter',
        branch = 'main'
    }

    use 'ap/vim-css-color'

    use 'nvim-lualine/lualine.nvim'

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
            {'williamboman/mason.nvim'},
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
		})
	end,
    }

    use 'RRethy/nvim-align'
    use 'OmniSharp/Omnisharp-vim'

    use {
        "epwalsh/obsidian.nvim",
        requires = {
            -- Required.
            "nvim-lua/plenary.nvim",
        },
        config = function()
            require("obsidian").setup({

                dir = "~/Documents/Writes/Obsidian/Kodex/",
                disable_frontmatter = true,

                daily_notes = {
                    folder = "Daily Notes",
                    date_format = "%Y-%m-%d",
                },
                mappings = {
                    ["gf"] = require("obsidian.mapping").gf_passthrough(),
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

