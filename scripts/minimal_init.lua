vim.cmd [[set runtimepath+=.]]
vim.cmd [[runtime! plugin/plenary.vim]]
vim.cmd [[runtime! plugin/nvim-treesitter.vim]]

vim.cmd [[au BufRead,BufNewFile *.conf set filetype=hocon]]

vim.o.swapfile = false
vim.bo.swapfile = false

-- luacheck: ignore 631
vim.cmd [[
    if has('win32')
		  let &shell = has('win32') ? 'powershell' : 'pwsh'
      let &shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;'
      let &shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
      let &shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
      set shellquote= shellxquote=
    endif
]]

require("nvim-treesitter.configs").setup {
  indent = { enable = true },
  highlight = { enable = true },
}
