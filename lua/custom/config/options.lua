-- [[ Setting options ]]
-- See `:help vim.o`

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

-- Default tabwidth
vim.o.tabstop = 4
vim.o.shiftwidth = 4

-- Highlight groups:
-- Extra-long lines
vim.api.nvim_set_hl(0, 'ExtraLongLines', { fg = '#FFFFFF', bg = '#9E0C0F' })

if vim.fn.has 'unix' == 1 and vim.fn.system 'uname' == 'Linux\n' then
  if vim.fn.executable 'zsh' == 1 then
    vim.opt.shell = 'zsh'
  else
    vim.opt.shell = 'bash'
  end
else
  -- Set PowerShell as the default shell if available
  if vim.fn.executable 'pwsh' == 1 then
    vim.opt.shell = 'pwsh'
  else
    vim.opt.shell = 'powershell'
  end

  -- Set common shell options for PowerShell
  vim.opt.shellcmdflag =
    "-NoLogo -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();$PSDefaultParameterValues['Out-File:Encoding']='utf8';Remove-Alias -Force -ErrorAction SilentlyContinue tee;"
  vim.opt.shellredir = '2>&1 | %%{ "$_" } | Out-File %s; exit $LastExitCode'
  vim.opt.shellpipe = '2>&1 | %%{ "$_" } | tee %s; exit $LastExitCode'
  vim.opt.shellquote = ''
  vim.opt.shellxquote = ''
end

--colorscheme
vim.cmd 'colorscheme ayu'
