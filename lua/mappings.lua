-- require "nvchad.mappings"

local map = vim.keymap.set

-- NOTE: Disable the spacebar key's default behavior in Normal and Visual modes
map({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- NOTE: For conciseness
local function opts(desc)
	return { noremap = true, silent = true, desc = desc }
end

map('n', '<leader>cs', '<cmd>NvCheatsheet<CR>', { desc = 'Toggle Nv[C]heat[S]heet' })

map({ 'n', 'x' }, '<leader>fm', function()
	require('conform').format({ async = true, lsp_format = 'fallback', lsp_fallback = true })
end, { desc = 'general format file' })

-- NOTE: global lsp mappings
map('n', '<leader>ds', vim.diagnostic.setloclist, { desc = 'LSP diagnostic loclist' })

-- NOTE: tabufline
map('n', '<leader>b', '<cmd>enew<CR>', { desc = 'buffer new' })

map('n', '<tab>', function()
	require('nvchad.tabufline').next()
end, { desc = 'buffer goto next' })

map('n', '<S-tab>', function()
	require('nvchad.tabufline').prev()
end, { desc = 'buffer goto prev' })

map('n', '<leader>x', function()
	require('nvchad.tabufline').close_buffer()
end, { desc = 'buffer close' })

-- NOTE: Comment
-- map("n", "<leader>/", "gcc", { desc = "toggle comment", remap = true })
-- map("v", "<leader>/", "gc", { desc = "toggle comment", remap = true })

-- NOTE: nvimtree
-- map('n', '<C-n>', '<cmd>NvimTreeToggle<CR>', { desc = 'nvimtree toggle window' })
map('n', '<leader>e', '<cmd>NvimTreeFocus<CR>', { desc = 'nvimtree focus window' })

-- NOTE: telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

-- NOTE: Slightly advanced example of overriding default behavior and theme
vim.keymap.set('n', '<leader>/', function()
	-- You can pass additional configuration to Telescope to change the theme, layout, etc.
	builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({
		winblend = 10,
		previewer = false,
	}))
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<leader>s/', function()
	builtin.live_grep({
		grep_open_files = true,
		prompt_title = 'Live Grep in Open Files',
	})
end, { desc = '[S]earch [/] in Open Files' })

-- NOTE: Shortcut for searching your Neovim configuration files
vim.keymap.set('n', '<leader>sn', function()
	builtin.find_files({ cwd = vim.fn.stdpath('config') })
end, { desc = '[S]earch [N]eovim files' })

-- map("n", "<leader>sh", "<cmd>Telescope help_tags<CR>", { desc = "help page" })
--
-- map("n", "<leader>sf", "<cmd>Telescope find_files<cr>", { desc = "find files" })
-- map("n", "<leader>ss", "<cmd>Telescope builtin<cr>", { desc = "[S]earch [S]elect Telescope" })
-- map("n", "<leader>sw", "<cmd>Telescope grep_string<CR>", { desc = "Search current Word" })
-- map("n", "<leader>sg", "<cmd>Telescope live_grep<CR>", { desc = "live grep" })
--
-- map("n", "<leader>sr", "<cmd>Telescope resume<CR>", { desc = "find oldfiles" })
-- map("n", "<leader>s.", "<cmd>Telescope oldfiles<CR>", { desc = "find oldfiles" })
-- map("n", "<leader><leader>", "<cmd>Telescope buffers<CR>", { desc = "find buffers" })
-- map("n", "<leader>/", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "find in current buffer" })

-- map("n", "<leader>ma", "<cmd>Telescope marks<CR>", { desc = "find marks" })
-- map("n", "<leader>cm", "<cmd>Telescope git_commits<CR>", { desc = "git commits" })
-- map("n", "<leader>gt", "<cmd>Telescope git_status<CR>", { desc = "git status" })

-- map("n", "<leader>pt", "<cmd>Telescope terms<CR>", { desc = "pick hidden term" })
map('n', '<leader>th', function()
	require('nvchad.themes').open()
end, { desc = 'NvChad [T][H]emes' })

-- map(
--   "n",
--   "<leader>sa",
--   "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
--   { desc = "find all files" }
-- )

-- NOTE: terminal
map('t', '<C-x>', '<C-\\><C-N>', { desc = 'terminal escape terminal mode' })

-- NOTE: new terminals
map('n', '<leader>h', function()
	require('nvchad.term').new({ pos = 'sp' })
end, { desc = 'terminal new horizontal term' })

map('n', '<leader>v', function()
	require('nvchad.term').new({ pos = 'vsp' })
end, { desc = 'terminal new vertical term' })
--
-- NOTE: toggleable
map({ 'n', 't' }, '<A-v>', function()
	require('nvchad.term').toggle({ pos = 'vsp', id = 'vtoggleTerm' })
end, { desc = 'terminal toggleable vertical term' })

map({ 'n', 't' }, '<A-h>', function()
	require('nvchad.term').toggle({ pos = 'sp', id = 'htoggleTerm' })
end, { desc = 'terminal toggleable horizontal term' })

map({ 'n', 't' }, '<A-i>', function()
	require('nvchad.term').toggle({ pos = 'float', id = 'floatTerm' })
end, { desc = 'terminal toggle floating term' })

-- NOTE: whichkey
map('n', '<leader>wK', '<cmd>WhichKey <CR>', { desc = 'whichkey all keymaps' })

map('n', '<leader>wk', function()
	vim.cmd('WhichKey ' .. vim.fn.input('WhichKey: '))
end, { desc = 'whichkey query lookup' })

-- map("n", ";", ":", { desc = "CMD enter command mode" })
-- map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- NOTE: save file
map('n', '<C-s>', '<cmd> w <CR>', opts('Save File'))

-- NOTE: save file without auto-formatting
map('n', '<leader><C-s>n', '<cmd>noautocmd w <CR>', opts('Save with [N]o Formatting'))
--
-- NOTE: quit file
map('n', '<C-q>', '<cmd> q <CR>', opts('Quit File'))

-- NOTE: delete single character without copying into register
map('n', 'x', '"_x', opts('Single delete [no register]'))

-- NOTE: Vertical scroll and center
map('n', '<C-d>', '<C-d>zz', opts())
map('n', '<C-u>', '<C-u>zz', opts())

-- NOTE: Find and center
map('n', 'n', 'nzzzv', opts())
map('n', 'N', 'Nzzzv', opts())
-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
map('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
-- map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- map('n', '<leader>pv', vim.cmd.Ex, { desc = 'Open Directory Listing' })

--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
map('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- NOTE: Navigate between splits
map('n', '<C-h>', ':wincmd h<CR>', opts())
map('n', '<C-l>', ':wincmd l<CR>', opts())
map('n', '<C-j>', ':wincmd j<CR>', opts())
map('n', '<C-k>', ':wincmd k<CR>', opts())

-- NOTE: Navigate between splits with arrow keys
map('n', '<C-left>', ':wincmd h<CR>', opts())
map('n', '<C-right>', ':wincmd l<CR>', opts())
map('n', '<C-up>', ':wincmd j<CR>', opts())
map('n', '<C-down>', ':wincmd k<CR>', opts())

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
-- vim.api.nvim_create_autocmd('TextYankPost', {
--   desc = 'Highlight when yanking (copying) text',
--   group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
--   callback = function()
--     vim.highlight.on_yank()
--   end,
-- })

-- vim: ts=2 sts=2 sw=2 et
