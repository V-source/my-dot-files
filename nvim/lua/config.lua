--
--
--
-- esto no toma efecto debido a que la terminal es la que determina el tipo de futen y el tamaño
--
-- vim.opt.guifont = {"FiraCode Nerd Font", ":h18"}
-- cursor vertical
vim.cmd [[
 let &t_SI = "\e[5 q"
 let &t_EI = "\e[2 q"
]]
---------------------------------------------
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
-- vim.opt.wrap = false
vim.opt.incsearch = true
vim.opt.clipboard = 'unnamedplus'
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.signcolumn = 'yes'
-- vim.opt.updatetime = 100
vim.opt.showcmd = false
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.cmd("set expandtab")
vim.cmd("set shiftwidth=2")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set cursorline")
vim.cmd("set cursorcolumn")
vim.cmd("set number relativenumber")
vim.cmd("set encoding=utf-8")
vim.cmd("set autoindent")
vim.cmd("syntax on")
vim.cmd("set wildmenu")
vim.cmd("set wildmode=list:longest")
vim.cmd("set guioptions-=m")
vim.cmd("let &t_ut=''")
vim.cmd("set nobackup")
vim.cmd("set nowritebackup")
vim.cmd("set noswapfile")
-- vim.cmd("set nofoldenable")
-- vim.cmd("set foldlevel=99")
-- -- vim.opt.foldmethod = "indent"
-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
-- vim.opt.foldcolumn = "0"
-- vim.opt.foldtext = ""

-- vim.cmd("set lazyredraw")
vim.cmd("set ttyfast")
--
vim.o.winblend = 0 -- works perfect for noice and notify
vim.o.pumblend = 0 -- works perfect for autocompletion width noice and notify
vim.g.mapleader = " "
vim.opt.termguicolors = true

----------------------------------------------
vim.opt.termguicolors = true
----------------------------------------------
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- select all
keymap.set("n", "<C-a>", "gg<S-v>G", opts)

-- new tab
keymap.set("n", "te", ":tabedit", opts)
-- keymap.set("n", "<C><Tab>", ":tabnext<Return>", opts)
-- keymap.set("n", "<C><S-Tab>", ":tabprev<Return>", opts)

-- split window
keymap.set("n", "<leader>sh", ":split<Return>", opts)
keymap.set("n", "<leader>sv", ":vspli<Return>", opts)
keymap.set("n", "<leader>sx", "<cmd>close<CR>", opts)

-- move window
keymap.set("n", "<C-h>", "<C-w>h")
keymap.set("n", "<C-l>", "<C-w>l")
keymap.set("n", "<C-j>", "<C-w>j")
keymap.set("n", "<C-k>", "<C-w>k")

-- resize window
keymap.set("n", "<S-h>", "<C-w><")
keymap.set("n", "<S-l>", "<C-w>>")
keymap.set("n", "<S-j>", "<C-w>-")
keymap.set("n", "<S-k>", "<C-w>+")

-- arrastrar un caracter hacia la derecha
-- keymap.set("i", "<C-t>", "<Esc>xpa", opts)
keymap.set("i", "<C-l>", "<Esc>xpa", opts)
keymap.set("i", "<C-h>", "<Esc>xhhpa", opts)
-- abcdefghijklmnop

-- nueva line en modo edicion
keymap.set("i", "<C-K>", "<Esc>O", opts) -- hacia arribaA
keymap.set("i", "<C-J>", "<Esc>o", opts) -- hacia abajo

-- mover linea hacia arribay abajo
-- keymap.set("n", "<A-k>", 'V:m-2<CR>', opts)
-- keymap.set("n", "<A-j>", 'V:m+1<CR>', opts)
-- keymap.set("v", "<leader>j", ':m+1 <CR>', opts)
keymap.set({ "i" }, "<A-k>", '<Esc> :m-2 <CR>i', opts)
keymap.set({ "i" }, "<A-j>", '<Esc> :m+1 <CR>i', opts)
keymap.set({ 'n' }, "<A-k>", '<Esc> :m-2 <CR>', opts)
keymap.set({ 'n' }, "<A-j>", '<Esc> :m+1 <CR>', opts)

-- guardar cambios
keymap.set({ "i", "n" }, "<C-s>", "<Esc>:w<CR>", opts)  -- un archivo
keymap.set({ "i", "n" }, "<A-CR>", "<Esc>:w<CR>", opts) -- un archivo
keymap.set({ "i", "n" }, "<A-w>", "<Esc>:w<CR>", opts)  -- un archivo
-- keymap.set("n", "<A-;>", "<Esc>:wa<CR>", opts) -- todos los archivos
keymap.set("n", "<S-s>", "<Esc>:wa<CR>", opts)          -- todos los archivos

keymap.set({ "i" }, "<A-n>", "<Esc>:nohls<CR>i", opts)
keymap.set({ "n" }, "<A-n>", "<Esc>:nohls<CR>", opts)
-- salir del modo insert (por defecto)
-- <A-l/j/h/k/> \\ <A-l> es la mejor opcion

-- NO RECUERDO PARA QUE ES
vim.keymap.set({ 'n', 'v' }, 'd', '"_d', { noremap = true })
vim.keymap.set({ 'n', 'v' }, 'D', '"_D', { noremap = true })
vim.keymap.set({ 'n', 'v' }, 'c', '"_c', { noremap = true })
vim.keymap.set({ 'n', 'v' }, 'C', '"_C', { noremap = true })


vim.keymap.set({ 'n', 'v' }, '<leader>flc', ":foldclose<CR>", opts)
vim.keymap.set({ 'n', 'v' }, '<leader>flo', ":foldopen<CR>", opts)
