

return {
  "echasnovski/mini.files",

  config = function()
    require('mini.files').setup({})
    vim.keymap.set('n', '<leader>pf', "<cmd>lua MiniFiles.open()<CR>")
    vim.keymap.set('n', '<leader>pc', "<cmd>lua MiniFiles.close()<CR>")
  end
}
