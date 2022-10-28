local group = vim.api.nvim_create_augroup("user_config", { clear = true })

vim.api.nvim_create_autocmd("BufWritePost", { command = "PackerCompile", group = group, pattern = "plugins.lua" })

vim.api.nvim_create_autocmd("BufWritePre", { group = group, callback = function() vim.lsp.buf.format {} end })
