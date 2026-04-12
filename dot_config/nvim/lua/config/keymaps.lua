vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap("i", "jk", "<Esc>", opts)

-- LuaSnip: jump between snippet placeholders
keymap({ "i", "s" }, "<C-l>", function()
  local ls = require("luasnip")
  if ls.jumpable(1) then ls.jump(1) end
end, opts)
keymap({ "i", "s" }, "<C-h>", function()
  local ls = require("luasnip")
  if ls.jumpable(-1) then ls.jump(-1) end
end, opts)

-- Window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)

keymap("n", "<leader>q", ":q<CR>", opts)
keymap("n", "<C-q>", ":wq<CR>", opts)
keymap("n", "<C-s>", ":w<CR>", opts)

-- Move lines in visual mode
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Yank to system clipboard
keymap("v", "<leader>y", '"+y', opts)

keymap("n", "gb", "<C-o>", vim.tbl_extend("force", opts, { desc = "Go back" }))

-- Buffer navigation
keymap("n", "<S-h>", ":bprevious<CR>", vim.tbl_extend("force", opts, { desc = "Prev buffer" }))
keymap("n", "<S-l>", ":bnext<CR>", vim.tbl_extend("force", opts, { desc = "Next buffer" }))
keymap("n", "<leader>bd", function()
  local bufs = vim.fn.getbufinfo({ buflisted = 1 })
  if #bufs > 1 then
    vim.cmd("bp|bd #")
  else
    vim.cmd("bd")
  end
end, vim.tbl_extend("force", opts, { desc = "Close buffer" }))

-- Find & replace word under cursor
keymap("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>", vim.tbl_extend("force", opts, { desc = "Replace word under cursor" }))

-- Clear search highlight
keymap("n", "<Esc>", ":nohlsearch<CR>", opts)
keymap("n", "<leader>e", ":Neotree<CR>", vim.tbl_extend("force", opts, { desc = "Toggle Neo-tree" }))

-- LSP keymaps — only active when an LSP server is attached to the buffer
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspKeymaps", { clear = true }),
  callback = function(event)
    local map = function(keys, func, desc)
      vim.keymap.set("n", keys, func, { buffer = event.buf, noremap = true, silent = true, desc = desc })
    end

    map("gd", vim.lsp.buf.definition, "Go to definition")
    map("<leader>d", vim.lsp.buf.hover, "Show hover")
    map("<leader>ca", vim.lsp.buf.code_action, "Code action")
    map("<leader>l", function()
      vim.lsp.buf.format({
        async = true,
        filter = function(client)
          local preferred = { "null-ls", "conform", "efm" }
          for _, name in ipairs(preferred) do
            if client.name == name then return true end
          end
          return true
        end,
      })
    end, "Format file")
    map("<leader>i", vim.diagnostic.open_float, "Show diagnostic")
    map("<leader>rd", function()
      vim.diagnostic.reset()
      vim.diagnostic.show()
    end, "Refresh diagnostics")
  end,
})
