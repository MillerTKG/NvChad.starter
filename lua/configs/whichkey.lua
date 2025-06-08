-- require('nvchad.configs.lspconfig').defaults()
-- require 'nvchad.configs.whichkey'
--
-- local M = {}
--
return {
  delay = 0,
  triggers = {
    { '<auto>', mode = 'nixsotc' },
    { 's', mode = { 'n', 'v' } },
  },
  spec = {
    -- { "<leader>c", group = "[C]ode", mode = { "n", "x" } },
    -- { "<leader>d", group = "[D]ocument" },
    -- { "<leader>r", group = "[R]ename" },
    { '<leader>s', group = '[S]earch' },
    -- { "<leader>w", group = "[W]orkspace" },
    { '<leader>t', group = '[T]oggle' },
    -- { "<leader>h", group = "Git [H]unk", mode = { "n", "v" } },
    { '<leader>p', group = 'Custom', mode = { 'n' } },
    -- { "<leader><C-s>", group = "[S]ave Operations", mode = { "n" } },
    { '<leader>c', group = '[C]heatsheet', mode = { 'n' } },
  },
}
