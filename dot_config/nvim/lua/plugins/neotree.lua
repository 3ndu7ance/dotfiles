return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    window = {
      width = 35,
      mappings = {
        ["<CR>"] = "open",       -- was <space>, which conflicts with <leader>
        ["l"]    = "open",
        ["h"]    = "close_node",
        ["a"]    = "add",
        ["d"]    = "delete",
        ["r"]    = "rename",
        ["y"]    = "copy_to_clipboard",
        ["x"]    = "cut_to_clipboard",
        ["p"]    = "paste_from_clipboard",
        ["s"]    = "open_split",
        ["v"]    = "open_vsplit",
        ["H"]    = "toggle_hidden",
        ["R"]    = "refresh",
        ["."]    = "set_root",
      },
    },
  },
}
