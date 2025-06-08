return {
  'folke/which-key.nvim',
  event = 'VimEnter',
  -- -- keys = { "<leader>", "<c-w>", '"', "'", "`", "c", "v", "g" },
  cmd = 'WhichKey',
  opts = function()
    return require 'configs.whichkey'
  end,
  -- opts = function()
  --   --   -- dofile(vim.g.base46_cache .. "whichkey")
  --   return require 'nvchad.configs.whichkey'
  -- end,
}
