return {
  {
    "saghen/blink.cmp",
    version = "1.*",
    dependencies = {
      "rafamadriz/friendly-snippets",
      "L3MON4D3/LuaSnip",
    },
    opts = {
      keymap = {
  preset = "default",
  ["<CR>"] = { "accept", "fallback" },
  ["<Tab>"] = { "select_next", "fallback" },
  ["<S-Tab>"] = { "select_prev", "fallback" },
},
      appearance = { nerd_font_variant = "mono" },
      snippets = { preset = "luasnip" },
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },
      cmdline = {
        sources = { "path", "cmdline" },
      },
      completion = {
        menu = {
          draw = {
            columns = {
              { "label", "label_description", gap = 1 },
              { "kind_icon", "source_name", gap = 1 },
            },
          },
        },
        documentation = { auto_show = true },
      },
    },
    opts_extend = { "sources.default" },
    config = function(_, opts)
      require("luasnip.loaders.from_vscode").lazy_load()
      require("blink.cmp").setup(opts)
    end,
  },
}
