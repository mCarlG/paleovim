local nvim_lsp = require("lspconfig")
local utils = require("config.lsp.utils")

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
	nvim_lsp[lsp].setup({
    on_attach = function(client, bufnr)
      utils.custom_lsp_attach(client, bufnr)
    end,
    before_init = function(_, config)
      if lsp == "pyright" then
        config.settings.python.pythonPath = utils.get_python_path(config.root_dir)
      end
    end,
    capabilities = capabilities,
    flags = { debounce_text_changes = 150 },
    settings = {
    },
	})
end
