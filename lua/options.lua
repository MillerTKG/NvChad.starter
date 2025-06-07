require 'nvchad.options'

-- [[ Setting options ]]
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
-- vim.g.mapleader = ' '
-- vim.g.maplocalleader = ' '
--
-- NOTE: Nerd Font
vim.g.have_nerd_font = true

-- NOTE: Shell Options
vim.o.shell = 'powershell'
vim.o.shellcmdflag =
  '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;'
vim.o.shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
vim.o.shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
vim.o.shellquote = ''
vim.o.shellxquote = ''

-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- NOTE: Line Number Rules
vim.opt.number = true
vim.opt.relativenumber = true
vim.o.numberwidth = 4

-- NOTE: Mouse Rules
--  Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- NOTE: Show Mode Rules
--  Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- NOTE: Clipboard Rules
--  Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

-- NOTE: Indenting Rules
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.breakindent = true

-- NOTE: File Rules
vim.opt.undofile = true
vim.o.swapfile = true
vim.o.backup = false
vim.o.writebackup = true

-- NOTE: Case Rules
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- NOTE: Column Rules
vim.opt.signcolumn = 'yes'

-- NOTE: Time Rules
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- NOTE: Split Rules
vim.opt.splitright = true
vim.opt.splitbelow = true

-- NOTE: List Rules
--  Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- NOTE: Substitution Rules
--  Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- NOTE: Cursor Rules
vim.opt.cursorline = true
vim.opt.scrolloff = 10

-- NOTE: Save Rules
--  if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
--  instead raise a dialog asking if you wish to save the current file(s)
--  See `:help 'confirm'`
vim.opt.confirm = true

-- NOTE: GUI Rules
vim.opt.termguicolors = true

-- NOTE: Matchpairs
-- vim.opt.matchpairs:append "':'"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
