-- [[ Setting options ]]
-- See `:help vim.o`

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

-- Default tabwidth
vim.o.tabstop = 4
vim.o.shiftwidth = 4

-- Highlight groups:
-- Extra-long lines
vim.api.nvim_set_hl(0, 'ExtraLongLines', { fg = '#FFFFFF', bg = '#FF0000', bold = true })

--colorscheme
vim.cmd 'colorscheme ayu'
