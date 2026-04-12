return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    delay = 300,
    spec = {
      { "<leader>f",  group = "find" },
      { "<leader>c",  group = "code" },
      { "<leader>r",  group = "refresh" },
    },
  },
  keys = {
    {
      "<leader>?",
      function() require("which-key").show({ global = false }) end,
      desc = "Show buffer keymaps",
    },
  },
}
