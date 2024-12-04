return {
  'Luxed/ayu-vim',
  priority = 1000,
  config = function()
    vim.cmd.colorscheme = 'ayu'
    vim.cmd.background = 'dark'
    vim.g.ayucolor = 'dark'
  end,
}
