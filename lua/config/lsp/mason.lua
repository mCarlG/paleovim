require("mason").setup {
	ui = {
		check_outdated_packages_on_open = true,
		border = "none",
		icons = {
			package_installed = "◍",
			package_pending = "◍",
			package_uninstalled = "◍",
		},
		keymaps = {
			toggle_package_expand = "<CR>",
			install_package = "i",
			update_package = "u",
			check_package_version = "c",
			update_all_packages = "U",
			check_outdated_packages = "C",
			uninstall_package = "X",
			cancel_installation = "<C-c>",
			apply_language_filter = "<C-f>",
		},
	},
}

require("mason-lspconfig").setup {}

require("mason-lspconfig").setup_handlers {
	function(server_name) require("lspconfig")[server_name].setup {} end,
}

require("mason-tool-installer").setup {
	ensure_installed = {
		-- LSP
		"bash-language-server",
		"clangd",
		"dockerfile-language-server",
		"json-lsp",
		"typescript-language-server",
		"texlab",
		"lua-language-server",
		"pyright",
		"terraform-ls",
		"yaml-language-server",
		"rust-analyzer",
		-- Formatter
		"black",
		"prettier",
		"stylua",
		-- Linter
		"eslint_d",
		"shellcheck",
		"tflint",
		"vale",
		"yamllint",
		-- DAP
		"debugpy",
	},
	auto_update = false,
	run_on_start = true,
	start_delay = 3000,
}
