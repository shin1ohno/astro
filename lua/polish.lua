vim.cmd [[colorscheme nord]]
vim.cmd [[autocmd VimEnter * if exists(':Dotenv') | exe 'Dotenv ~/.env' | endif]]
vim.opt.conceallevel = 1 --for obsidian

vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
    vim.opt_local.breakindent = true
  end,
})
