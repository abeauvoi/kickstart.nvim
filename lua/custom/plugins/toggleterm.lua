return {
  'akinsho/toggleterm.nvim',
  version = '*',
  opts = {
    open_mapping = [[<c-\>]],
    autochdir = true,
    direction = 'tab',
    shell = vim.o.shell,
    on_open = function()
      local opts = { buffer = 0 }
      vim.keymap.set('t', 'jk', [[<c-\><c-n>]], opts)
    end,
  },
}
