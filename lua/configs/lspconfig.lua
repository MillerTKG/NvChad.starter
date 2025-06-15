require('nvchad.configs.lspconfig').defaults()
require('lua.configs.lspconfigs.autohotkey')

local servers = { 'html', 'cssls' }
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers
