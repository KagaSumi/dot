-- lsp.lua

local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  local keymap = vim.keymap.set
  keymap('n', 'gd', vim.lsp.buf.definition, opts)
  keymap('n', 'K', vim.lsp.buf.hover, opts)
  keymap('n', '<leader>vws', vim.lsp.buf.workspace_symbol, opts)
  keymap('n', '<leader>vd', vim.diagnostic.open_float, opts)
  keymap('n', '[d', vim.diagnostic.goto_next, opts)
  keymap('n', ']d', vim.diagnostic.goto_prev, opts)
  keymap('n', '<leader>vca', vim.lsp.buf.code_action, opts)
  keymap('n', '<leader>vrr', vim.lsp.buf.references, opts)
  keymap('n', '<leader>vrn', vim.lsp.buf.rename, opts)
  keymap('i', '<C-h>', vim.lsp.buf.signature_help, opts)
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {
    'pylsp',
    'eslint',
  },
  handlers = {
    lsp_zero.default_setup,
  }
})

-- CMP setup
local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = {
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ['<C-Space>'] = cmp.mapping.complete(),
}

cmp.setup({
  mapping = cmp_mappings,
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
  },
})

-- Diagnostic display
vim.diagnostic.config({
  virtual_text = true,
})

