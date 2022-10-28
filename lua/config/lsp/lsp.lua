local nvim_lsp = require "lspconfig"

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}

local servers = {
  "bashls",
  "dockerls",
  "jsonls",
  "pyright",
  "sumneko_lua",
  "terraformls",
  "texlab",
  "tsserver",
  "yamlls",
  "rust_analyzer",
}

for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    before_init = function(_, config)
      if lsp == "pyright" then config.settings.python.pythonPath = utils.get_python_path(config.root_dir) end
    end,
    capabilities = capabilities,
    flags = { debounce_text_changes = 150 },
    settings = {},
  }
end
