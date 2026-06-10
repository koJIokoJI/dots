-- vim.pack.add { "RedsXDD/neopywal.nvim", as = "neopywal" }
vim.pack.add { 'https://github.com/RedsXDD/neopywal.nvim' }
require('neopywal').setup({
  notify="warn"
})
vim.cmd.colorscheme('neopywal')
