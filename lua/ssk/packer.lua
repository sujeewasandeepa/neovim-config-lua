-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.1',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	use {'nyoom-engineering/oxocarbon.nvim'}
	use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},             -- Required
			{                                      -- Optional
			'williamboman/mason.nvim',
			run = function()
				pcall(vim.cmd, 'MasonUpdate')
			end,
		},
		{'williamboman/mason-lspconfig.nvim'}, -- Optional

		-- Autocompletion
		{'hrsh7th/nvim-cmp'},     -- Required
		{'hrsh7th/cmp-nvim-lsp'}, -- Required
		{'L3MON4D3/LuaSnip'},     -- Required
		}
	}

    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional
        },
        config = function()
            require("nvim-tree").setup {}
        end
    }       

    use ('ThePrimeagen/harpoon')

    use ('aktersnurra/no-clown-fiesta.nvim')

    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

    use "savq/melange-nvim"
    use "sainnhe/gruvbox-material"
    use "srcery-colors/srcery-vim"
    use {
        "ellisonleao/gruvbox.nvim",
        config = function ()
            require("gruvbox").setup({
                italic = {
                    strings = false,
                    comments = true,
                    operators = false,
                    folds = false,
                }
            })
        end
    }
    use "nordtheme/vim"
    use "folke/tokyonight.nvim"
    use "nanotech/jellybeans.vim"
    use "ishan9299/nvim-solarized-lua"
    use "sainnhe/sonokai"
    use {
        'fenetikm/falcon',
    }
    -- tabls
    use 'lewis6991/gitsigns.nvim' -- OPTIONAL: for git status
    use 'romgrk/barbar.nvim'
    -- neorg
    use {
        "nvim-neorg/neorg",
        config = function()
            require('neorg').setup {
                load = {
                    ["core.defaults"] = {}, -- Loads default behaviour
                    ["core.concealer"] = {}, -- Adds pretty icons to your documents
                    ["core.dirman"] = { -- Manages Neorg workspaces
                    config = {
                        workspaces = {
                            notes = "~/notes",
                        },
                    },
                    },
                },
            }
        end,
        run = ":Neorg sync-parsers",
        requires = "nvim-lua/plenary.nvim",
    }
end)
