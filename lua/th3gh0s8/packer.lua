vim.cmd([[
augroup packer_user_config
autocmd!
autocmd BufWritePost packer.lua source <afile> | PackerSync
augroup end
]])
-- Only required if you have packer configured as `opt`
local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
local is_bootstap =false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    is_bootstap = true
    vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim'.. install_path)
    vim.cmd [[packadd packer.nvim]]
end

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use({
        'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
            vim.cmd('colorscheme rose-pine')
        end
    })

    use({'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'})
    use('nvim-treesitter/playground')
    use('theprimeagen/harpoon')
    use('mbbill/undotree')
    use('tpope/vim-fugitive')

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
            {'rafamadriz/friendly-snippets'},
        }
    }

    use("folke/zen-mode.nvim")
    use("github/copilot.vim")
    use("eandrju/cellular-automaton.nvim")
    use('ThePrimeagen/vim-be-good')
    use("nvim-tree/nvim-web-devicons")

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }


    local has_plugins, plugins = pcall(require, 'coustom.plugins')
    if has_plugins then
        plugins(use)
    end


    if packer_bootstrap then
        require('packer').sync()
    end
end)

