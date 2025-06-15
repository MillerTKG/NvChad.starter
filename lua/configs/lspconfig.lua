require('nvchad.configs.lspconfig').defaults()

vim.lsp.config('autohotkey_lsp', {
	autostart = true,
	cmd = {
		'node',
		vim.fn.expand('$HOME/.vscode/extensions/thqby.vscode-autohotkey2-lsp-2.6.9/server/dist/server.js'),
		'--stdio',
	},
	filetypes = { 'ahk', 'autohotkey', 'ah2' },
	init_options = {
		ActionWhenV1IsDetected = 'Continue',
		AutoLibInclude = 'Local',
		CommentTags = '^;;\\s*(?<tag>.+)',
		CompleteFunctionParens = true,
		fullySemanticToken = true,
		Diagnostics = {
			ClassStaticMemberCheck = true,
			ParamsCheck = true,
		},
		FormatOptions = {
			array_style = 'none',
			brace_style = 'One True Brace',
			break_chained_methods = false,
			ignore_comment = false,
			indent_string = '\t',
			max_preserve_newlines = 2,
			object_style = 'none',
			preserve_newlines = true,
			space_after_double_colon = true,
			space_before_conditional = true,
			space_in_empty_paren = false,
			space_in_other = true,
			space_in_paren = false,
			wrap_line_length = 0,
		},
		InterpreterPath = 'C:/Program Files/AutoHotkey/v2/AutoHotkey.exe',
		SymbolFoldinFromOpenBrace = true,
		SymbolFoldingFromOpenBrace = true,
		locale = 'en-us',
	},
	single_file_support = true,
	flags = {
		debounce_text_changes = 500,
	},
	root_markers = {
		'package.json',
	},
	-- capabilities = require('nvchad.configs.lspconfig').capabilities,
	-- on_attach = require('nvchad.configs.lspconfig').on_attach,
})

vim.lsp.enable('autohotkey_lsp')

local servers = { 'html', 'cssls' }
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers
