-- local tree = require('git-worktree')
require("git-worktree").setup({
    change_directory_command = "lcd", -- default: "cd",
    update_on_change = true, -- default: true,
    update_on_change_command = "e.", -- default: "e .",
    clearjumps_on_change = true, -- default: true,
    autopush = false, -- default: false,
})

-- require("telescope").load_extension("git_worktree")
