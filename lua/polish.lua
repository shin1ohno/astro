vim.cmd [[colorscheme nord]]
vim.cmd [[autocmd VimEnter * if exists(':Dotenv') | exe 'Dotenv ~/.env' | endif]]
vim.opt.conceallevel = 1 --for obsidian
