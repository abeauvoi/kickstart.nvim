return {
  'Shatur/neovim-ayu',
  config = function()
    vim.cmd.colorscheme = 'ayu'
    vim.cmd.background = 'dark'
    vim.g.ayucolor = 'dark'
  end,
}
