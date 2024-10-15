local function map(mode, lhs, rhs, opts)
	local options = { noremap=true, silent=true }
	if opts then
		options = vim.tbl_extend('force', options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Screen navigation
map('n', "<C-Left>", "<C-w>h")
map('n', "<C-Down>", "<C-w>j")
map('n', "<C-Up>", "<C-w>k")
map('n', "<C-Right>", "<C-w>l")

-- For leader
map('n', " ", "<NOP>")

-- Terminal
map('n', "<leader>ft", ":FloatermNew --name=myfloat --height=0.8 --width=0.7 --autoclose=2 zsh<CR>")
map('n', "t", ":FloatermToggle myfloat<CR>")
map('t', "<Esc>", "<C-\\><C-n>:q<CR>")

-- Telescope
map('n', "<leader>o", ":Telescope find_files<CR>")
map('n', "<leader>f", ":Telescope live_grep<CR>")

-- Nvim-Tree
map('n', "<leader>td", ":NvimTreeToggle<CR>")
