-- vim.pack.add { "RedsXDD/neopywal.nvim", as = "neopywal" }
vim.pack.add { 'https://github.com/RedsXDD/neopywal.nvim' }
require('neopywal').setup {
  notify = 'warn',
}
vim.cmd.colorscheme 'neopywal'

local vue_language_server_path = vim.fn.stdpath 'data' .. '/mason/packages/vue-language-server/node_modules/@vue/language-server'

local vue_plugin = {
  name = '@vue/typescript-plugin',
  location = vue_language_server_path,
  languages = { 'vue' },
  configNamespace = 'typescript',
}

vim.lsp.config('ts_ls', {
  filetypes = {
    'typescript',
    'javascript',
    'typescriptreact',
    'javascriptreact',
    'vue',
  },
  init_options = {
    plugins = {
      vue_plugin,
    },
  },
})

vim.lsp.config('vue_ls', {})

vim.lsp.enable {
  'ts_ls',
  'vue_ls',
}

vim.pack.add { 'https://github.com/ymic9963/mdnotes.nvim' }
require('mdnotes').setup {
  -- Config here
}

vim.pack.add {
  'https://github.com/OXY2DEV/markview.nvim',
}
require('markview').setup {
  latex = {
    enable = true,
    blocks = {
      enable = true,

      hl = 'MarkviewCode',
      pad_char = ' ',
      pad_amount = 3,

      text = '  LaTeX ',
      text_hl = 'MarkviewCodeInfo',
    },
  },
}

vim.pack.add { { src = 'https://github.com/lervag/vimtex', version = 'v2.15' } }
