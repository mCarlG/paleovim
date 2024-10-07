local function map(mode, lhs, rhs, opts)
	local options = { noremap=true, silent=true }
	if opts then
		options = vim.tbl_extend('force', options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map('n', " ", "<NOP>")
map('n', "<leader>ft", ":FloatermNew --name=myfloat --height=0.8 --width=0.7 --autoclose=2 zsh <CR> ")
map('n', "t", ":FloatermToggle myfloat<CR>")
map('t', "<Esc>", "<C-\\><C-n>:q<CR>")
