return {
  -- Oil: Edit files like a buffer
  { "stevearc/oil.nvim", opts = {} },
  -- Snacks: High-performance 2026 UI essentials
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      indent = { enabled = true },
      input = { enabled = true },
      notifier = { enabled = true },
      scroll = { enabled = true }, -- Smooth 120Hz scrolling
    },
  },
}
