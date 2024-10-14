require("lazy").setup({
	{
		"neovim/nvim-lspconfig",
		config = function()
			lspconfig = require("lspconfig")
			lspconfig.clangd.setup({})
			lspconfig.pyright.setup({
			on_attach = on_attach,
				settings = {
					pyright = {
						autoImportCompletion = true,
					},
					python = {
						analysis = {
							autoSearchPaths = true,
							diagnosticMode = 'openFilesOnly',
							useLibraryCodeForTypes = true,
							typeCheckingMode = 'off',
						},
					},
				},
			})
			lspconfig.rust_analyzer.setup({
				settings = {
					rust_analyzer = {
						useLibraryCodeForTypes = true,
						autoSearchPaths = true,
						autoImportCompletions = false,
						reportMissingImports = true,
						followImportForHints = true,
						cargo = {
							allFeatures = true,
						},
						checkOnSave = {
							command = "cargo clippy",
						},
					},
				},
			})
		end
	},
	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = { "lua", "rust", "toml" },
				auto_install = true,
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
				ident = { enable = true },
				rainbow = {
					enable = true,
					extended_mode = true,
					max_file_lines = nil,
				},
		})
		end,
	},
	{
		"hrsh7th/cmp-buffer",
	},
	{
		"hrsh7th/cmp-path",
	},
	{
		"hrsh7th/cmp-cmdline",
	},
	{
		"morhetz/gruvbox",
	},
	{
		"voldikss/vim-floaterm",
	},
	{
		"L3MON4D3/LuaSnip",
	},
	{
		"saadparwaiz1/cmp_luasnip",
	},
	{
		"hrsh7th/nvim-cmp",
		config = function()
			cmp = require("cmp")
			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					['<C-b>'] = cmp.mapping.scroll_docs(-4),
					['<C-f>'] = cmp.mapping.scroll_docs(4),
					['<C-Space>'] = cmp.mapping.complete(),
					['<C-e>'] = cmp.mapping.abort(),
					['<CR>'] = cmp.mapping.confirm({ select = true }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "path" },

				}, {
					{ name = "buffer" },
				})
			})
		end
	},
	{
		"hrsh7th/cmp-nvim-lsp",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			require("lspconfig")["pyright"].setup {
				capabilities = capabilities
			}
			require("lspconfig")["rust_analyzer"].setup {
				capabilities = capabilities
			}
			require("lspconfig")["clangd"].setup {
				capabilities = capabilities
			}
		end
	},
	{
		"nvim-tree/nvim-web-devicons",
	},
	{
		"nvim-tree/nvim-tree.lua",
		config = function()
			require("nvim-tree").setup {
				filters = {
					dotfiles = true,
				},
			}
		end
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release',
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("telescope").setup {
				extensions = {
					fzf = {
						fuzzy = true,
						override_generic_sorter = true,
						override_file_sorter = true,
						case_mode = "smart_case",
					},
				},
			}
			require("telescope").load_extension("fzf")
		end
	},
})
