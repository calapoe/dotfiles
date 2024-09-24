return {

    {
        "nvim-lua/plenary.nvim",
        name = "plenary"
    },

  "github/copilot.vim",
  "eandrju/cellular-automaton.nvim",
  "ThePrimeagen/harpoon",
  "echasnovski/mini.nvim",
}

-- {
--   {
--     'nvim-telescope/telescope.nvim', version = '0.1.8',
--     -- or                            , branch = '0.1.x',
--     dependencies= { {'nvim-lua/plenary.nvim'} }
--   },
--
--   {
--     'rose-pine/neovim',
--     name = 'rose-pine',
--     config = function()
--       vim.cmd('colorscheme rose-pine')
--     end
--   },
--
--   'nvim-treesitter/nvim-treesitter',
--   'nvim-treesitter/playground',
--   'ThePrimeagen/harpoon',
--   'mbbill/undotree',
--   'tpope/vim-fugitive',
--
--   {'ThePrimeagen/git-worktree.nvim', dependencies= {
--     { 'nvim-telescope/telescope.nvim' },
--   }
--   },
--
--   
--
--   {'numToStr/Comment.nvim', config = function()
--     require('Comment').setup()
--   end},
--
--   {'nvim-neotest/neotest', dependencies= {
--     {'nvim-lua/plenary.nvim'},
--     {"nvim-treesitter/nvim-treesitter"},
--     {"nvim-neotest/nvim-nio"},
--     {"antoinemadec/FixCursorHold.nvim"},
--     {"marilari88/neotest-vitest"},
--     {"nvim-neotest/neotest-plenary"},
--   }},
--
--   {'hedyhli/outline.nvim',
--     config = function()
--       vim.keymap.set("n", "<leader>o", "<cmd>Outline<CR>")
--       require('outline').setup({
--         outline_window = {
--           -- position = 'left',
--         },
--       })
--     end},
--
--   {'edte/normal-colon.nvim', config = function()
--     require('normal-colon').setup()
--   end},
--
--   'sindrets/diffview.nvim',
--
--   'tpope/vim-surround',
--
--   'stevearc/oil.nvim',
--
--   'echasnovski/mini.nvim',
-- <<<<<<< HEAD
--
--   {
--     "williamboman/mason.nvim",
--     "williamboman/mason-lspconfig.nvim",
--     "neovim/nvim-lspconfig",
--     'hrsh7th/nvim-cmp',
--     'hrsh7th/cmp-nvim-lsp',
--     'L3MON4D3/LuaSnip',
--     'saadparwaiz1/cmp_luasnip',
--   },
-- =======
-- >>>>>>> eac3235 (working nvim)
-- }
