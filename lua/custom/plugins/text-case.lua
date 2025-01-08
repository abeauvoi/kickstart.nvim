return {
  'johmsalas/text-case.nvim',
  dependencies = {
    'nvim-telescope/telescope.nvim',
  },
  config = function()
    require('textcase').setup {}
    require('telescope').load_extension 'textcase'

    -- Define key mappings for text-case operations
    local opts = { noremap = true, silent = true }
    vim.api.nvim_set_keymap('n', 'gau', "<cmd>lua require('textcase').current_word('to_upper_case')<CR>", opts)
    vim.api.nvim_set_keymap('n', 'gal', "<cmd>lua require('textcase').current_word('to_lower_case')<CR>", opts)
    vim.api.nvim_set_keymap('n', 'gas', "<cmd>lua require('textcase').current_word('to_snake_case')<CR>", opts)
    vim.api.nvim_set_keymap('n', 'gad', "<cmd>lua require('textcase').current_word('to_dash_case')<CR>", opts)
    vim.api.nvim_set_keymap('n', 'gan', "<cmd>lua require('textcase').current_word('to_constant_case')<CR>", opts)
    vim.api.nvim_set_keymap('n', 'ga,', "<cmd>lua require('textcase').current_word('to_comma_case')<CR>", opts)
    vim.api.nvim_set_keymap('n', 'gaa', "<cmd>lua require('textcase').current_word('to_phrase_case')<CR>", opts)
    vim.api.nvim_set_keymap('n', 'gac', "<cmd>lua require('textcase').current_word('to_camel_case')<CR>", opts)
    vim.api.nvim_set_keymap('n', 'gap', "<cmd>lua require('textcase').current_word('to_pascal_case')<CR>", opts)
    vim.api.nvim_set_keymap('n', 'gat', "<cmd>lua require('textcase').current_word('to_title_case')<CR>", opts)
    vim.api.nvim_set_keymap('n', 'gaf', "<cmd>lua require('textcase').current_word('to_path_case')<CR>", opts)

    vim.api.nvim_set_keymap('n', 'gaU', "<cmd>lua require('textcase').lsp_rename('to_upper_case')<CR>", opts)
    vim.api.nvim_set_keymap('n', 'gaL', "<cmd>lua require('textcase').lsp_rename('to_lower_case')<CR>", opts)
    vim.api.nvim_set_keymap('n', 'gaS', "<cmd>lua require('textcase').lsp_rename('to_snake_case')<CR>", opts)
    vim.api.nvim_set_keymap('n', 'gaD', "<cmd>lua require('textcase').lsp_rename('to_dash_case')<CR>", opts)
    vim.api.nvim_set_keymap('n', 'gaN', "<cmd>lua require('textcase').lsp_rename('to_constant_case')<CR>", opts)
    vim.api.nvim_set_keymap('n', 'ga,', "<cmd>lua require('textcase').lsp_rename('to_comma_case')<CR>", opts)
    vim.api.nvim_set_keymap('n', 'gaA', "<cmd>lua require('textcase').lsp_rename('to_phrase_case')<CR>", opts)
    vim.api.nvim_set_keymap('n', 'gaC', "<cmd>lua require('textcase').lsp_rename('to_camel_case')<CR>", opts)
    vim.api.nvim_set_keymap('n', 'gaP', "<cmd>lua require('textcase').lsp_rename('to_pascal_case')<CR>", opts)
    vim.api.nvim_set_keymap('n', 'gaT', "<cmd>lua require('textcase').lsp_rename('to_title_case')<CR>", opts)
    vim.api.nvim_set_keymap('n', 'gaF', "<cmd>lua require('textcase').lsp_rename('to_path_case')<CR>", opts)

    vim.api.nvim_set_keymap('n', 'geu', "<cmd>lua require('textcase').operator('to_upper_case')<CR>", opts)
    vim.api.nvim_set_keymap('n', 'gel', "<cmd>lua require('textcase').operator('to_lower_case')<CR>", opts)
    vim.api.nvim_set_keymap('n', 'ges', "<cmd>lua require('textcase').operator('to_snake_case')<CR>", opts)
    vim.api.nvim_set_keymap('n', 'ged', "<cmd>lua require('textcase').operator('to_dash_case')<CR>", opts)
    vim.api.nvim_set_keymap('n', 'gen', "<cmd>lua require('textcase').operator('to_constant_case')<CR>", opts)
    vim.api.nvim_set_keymap('n', 'ge,', "<cmd>lua require('textcase').operator('to_comma_case')<CR>", opts)
    vim.api.nvim_set_keymap('n', 'gea', "<cmd>lua require('textcase').operator('to_phrase_case')<CR>", opts)
    vim.api.nvim_set_keymap('n', 'gec', "<cmd>lua require('textcase').operator('to_camel_case')<CR>", opts)
    vim.api.nvim_set_keymap('n', 'gep', "<cmd>lua require('textcase').operator('to_pascal_case')<CR>", opts)
    vim.api.nvim_set_keymap('n', 'get', "<cmd>lua require('textcase').operator('to_title_case')<CR>", opts)
    vim.api.nvim_set_keymap('n', 'gef', "<cmd>lua require('textcase').operator('to_path_case')<CR>", opts)
  end,
  keys = {
    'ga',
    { 'ga.', '<cmd>TextCaseOpenTelescope<CR>', mode = { 'n', 'x' }, desc = 'Telescope' },
  },
  cmd = {
    'Subs',
    'TextCaseOpenTelescope',
    'TextCaseOpenTelescopeQuickChange',
    'TextCaseOpenTelescopeLSPChange',
    'TextCaseStartReplacingCommand',
  },
  lazy = false,
}
