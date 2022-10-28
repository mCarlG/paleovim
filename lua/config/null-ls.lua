local null_ls = require "null-ls"
null_ls.setup {
  sources = {
    null_ls.builtins.formatting.astyle,
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.beautysh,
    null_ls.builtins.formatting.gofmt,
    null_ls.builtins.formatting.goimports,
    null_ls.builtins.formatting.latexindent,
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.mdformat,
    null_ls.builtins.formatting.prettierd,
    null_ls.builtins.formatting.rustfmt,
  },
}
