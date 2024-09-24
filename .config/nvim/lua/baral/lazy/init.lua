return {
  {
    "nvim-lua/plenary.nvim",
    name = "plenary"
  },
  "github/copilot.vim",
  "eandrju/cellular-automaton.nvim",
  "ThePrimeagen/harpoon",
  {'ThePrimeagen/git-worktree.nvim',
    config = function()
      require("git-worktree").setup({
        change_directory_command = "tcd",
      })

      local worktree = require('git-worktree')
      vim.keymap.set('n', '<leader>cw', worktree.create_worktree(
        {vim.fn.input("path> ")}, {vim.fn.input("branch> ")}, "origin"))

    end,
  },
  "echasnovski/mini.nvim",
  {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    -- Optional dependencies
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
    config = function()
      require("oil").setup()
      vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
    end,
  },
}


