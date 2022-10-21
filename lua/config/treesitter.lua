local settings = require("settings")
require("nvim-treesitter.configs").setup({
	ensure_installed = settings.treesitter_ensure_installed,
	ignore_install = {},
	highlight = {
		enable = true,
		disable = {},
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<CR>",
			scope_incremental = "<CR>",
			node_incremental = "<TAB>",
			node_decremental = "<S-TAB>",
		},
	},
	endwise = {
		enable = true,
	},
	markid = { enable = true },
	indent = { enable = true },
	autopairs = { enable = true },
	textobjects = {
		select = {
			enable = true,
			lookahead = true,
			keymaps = {
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
				["il"] = "@loop.inner",
	        		["ib"] = "@block.inner",
	        		["ab"] = "@block.outer",
	        		["ir"] = "@parameter.inner",
		        	["ar"] = "@parameter.outer",
			},
		},
	},
	rainbow = {
		enable = true,
		extended_mode = true,
		max_file_lines = 2000,
	},
})
