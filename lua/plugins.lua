local settings = require("settings")
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

local function local_config(plugin)
	return string.format('require("config/%s")', plugin)
end

vim.cmd([[
	augroup packer_user_config
		autocmd!
		autocmd BufWritePost plugins.lua source <afile> | PackerCompile
	augroup end
]])

if fn.empty(fn.glob(install_path)) > 0 then
  Packer_Bootstrap = fn.system({
	  'git',
	  'clone',
	  '--depth',
	  '1',
	  'https://github.com/wbthomason/packer.nvim',
	  install_path
  })
  vim.api.nvim_command("packadd packer.nvim")
end

local packer = require("packer")

packer.init({
	enable = true,
	threshold = 0,
	max_jobs = 20,
	display = {
		open_window = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

packer.startup(function(use)

	use({ "lewis6991/impatient.nvim"})

	use({ "wbthomason/packer.nvim" })

	use({ "nvim-lua/plenary.nvim" })

	use({
		"williamboman/mason.nvim",
		cmd = "Mason*",
		module = "mason-tool-installer",
		requires = { "williamboman/mason-lspconfig.nvim", "WhoIsSethDaniel/mason-tool-installer.nvim" },
		config = local_config("lsp.mason"),
	})

	use({
		"neovim/nvim-lspconfig",
		config = local_config("lsp.lsp")
	})

	use({
		"windwp/nvim-autopairs",
		config = local_config("nvim-autopairs"),
	})

	use({
		"hrsh7th/nvim-cmp",
		requires = { "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-buffer", "hrsh7th/cmp-path", "hrsh7th/cmp-cmdline" },
		config = local_config("nvim-cmp"),
	})

	use({
		"L3MON4D3/LuaSnip",
		requires = { "saadparwaiz1/cmp_luasnip" },
		config = local_config("LuaSnip"),
	})

	use({
		"nvim-treesitter/nvim-treesitter",
		config = local_config("treesitter"),
		run = ":TSUpdate",
	})

	use({
		"folke/which-key.nvim",
		config = local_config("which-key"),
	})

	use({
		"nvim-tree/nvim-web-devicons",
		config = local_config("nvim-web-devicons"),
	})

	use({
		"nvim-tree/nvim-tree.lua",
		config = local_config("nvim-tree"),
	})

	use({
		"lewis6991/gitsigns.nvim",
		config = local_config("gitsigns")
	})

	use({
		"feline-nvim/feline.nvim",
		config = local_config("feline"),
	})

	use({
		"nanozuki/tabby.nvim",
		config = local_config("tabby"),
	})

	use({
		"norcalli/nvim-colorizer.lua",
		config = local_config("nvim-colorizer"),
	})

	use({
		"catppuccin/nvim",
		as = "catppuccin",
		config = local_config("themes.catppuccin"),
	})
end)
