return {
  {
    "olimorris/codecompanion.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter" },
    opts = {
      strategies = {
        chat = { adapter = "ollama" },
        inline = { adapter = "ollama" },
      },
      opts = {
        log_level = "DEBUG", -- or "TRACE"
      },
      adapters = {
        ollama = function()
          return require("codecompanion.adapters").extend("ollama", {
            schema = {
              model = { default = "qwen2.5-coder:7b" },
              num_ctx = { default = 16384 }, -- The 16k window
              num_predict = { default = -1 }, -- Let Mono speak until finished
              temperature = { default = 0.2 }, -- Keep the logic sharp/precise
            },
            opts = {
              log_level = "DEBUG", -- or "TRACE"
            },
          })
        end,
      },
    },
  },
}
