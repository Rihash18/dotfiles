vim.g.mapleader = " "           --Set <Leader> to Space
vim.g.maplocalleader = " "      --Local Leader

local keymap = vim.keymap.set
local opts = {noremap = true, silent = true}

--RESIZE WINDOWS
keymap("n", "<C-Up", "<cmd>resize -2<CR>", opts)
keymap("n", "<C-Down", "<cmd>resize +2<CR>", opts)
keymap("n", "<C-Left", "<cmd>resize -2<CR>", opts)
keymap("n", "<C-Right", "<cmd>resize +2<CR>", opts)

--BETTER INDENTATION
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

--MOVE SELETED lINES
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)

--BETTER SCROLLING
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)

--BETTER SEARCH
keymap("n", "n", "nzzzv", opts)          -- Next result & center
keymap("n", "N", "Nzzzv", opts)          -- Previous result & center

--DELETE WITHOUT YANKING
keymap("n", "x", '"_x', opts)
keymap({"n", "v"}, "<leader>d", '"_d', opts)
keymap("x", "<leader>p", '"_dP', opts)

--BUFFER NAVIGATION
keymap("n", "<leader>bn", "<cmd>BufferLineCycleNext<CR>", { desc = "Next Buffer" })
keymap("n", "<leader>bp", "<cmd>BufferLineCyclePrev<CR>", { desc = "Previous Buffer" })
keymap("n", "<leader>bx", "<cmd>bdelete<CR>", { desc = "Close Buffer" })
keymap("n", "<leader>bo", "<cmd>enew<CR>", { desc = "New Buffer" })

--WINDOW SPLITS
keymap("n", "<leader>sv", "<cmd>vsplit<CR>", { desc = "Split vertical" })
keymap("n", "<leader>sh", "<cmd>split<CR>", { desc = "Split horizontal" })
keymap("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close split" })
keymap("n", "<leader>se", "<C-w>=", { desc = "Equal splits" })
keymap("n", "<leader>sm", "<C-w>o", { desc = "Maximize split" })

--COLORSCHEMES
vim.keymap.set('n', '<leader>themes', ':Telescope colorscheme<CR>', { desc = 'Telescope colorschemes' })

