-- Merge blink.cmp's capabilities into Neovim's default LSP capabilities so
-- servers receive the full picture (built-in + completion extensions).
local ok, blink = pcall(require, 'blink.cmp')
if ok then
  vim.lsp.config('*', {
    capabilities = blink.get_lsp_capabilities(
      vim.lsp.protocol.make_client_capabilities()
    ),
  })
end

vim.lsp.enable('lua_ls')
vim.lsp.enable('gopls')
vim.lsp.enable('postgres_lsp')
