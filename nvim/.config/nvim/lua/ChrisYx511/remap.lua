vim.g.mapleader = " "

-- Move lines in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Join lines keeping cursor position
vim.keymap.set("n", "J", "mzJ`z")

-- Half-page jump with cursor centered
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Search with cursor centered
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Paste without yanking replaced text
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste (no yank)" })

-- Yank to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Yank line to clipboard" })

-- Delete to void register
vim.keymap.set({ "n", "v" }, "<leader>d", "\"_d", { desc = "Delete (no yank)" })

-- Escape from insert mode
vim.keymap.set("i", "<C-c>", "<Esc>")

-- Disable ex mode
vim.keymap.set("n", "Q", "<nop>")

-- Window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to below window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to above window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Splits
vim.keymap.set("n", "<leader>wv", "<C-w>v", { desc = "Split vertical" })
vim.keymap.set("n", "<leader>ws", "<C-w>s", { desc = "Split horizontal" })
vim.keymap.set("n", "<leader>wq", "<C-w>q", { desc = "Close split" })
vim.keymap.set("n", "<leader>wo", "<C-w>o", { desc = "Close other splits" })
vim.keymap.set("n", "<leader>w=", "<C-w>=", { desc = "Equal width splits" })

-- Resize panes
vim.keymap.set("n", "<S-Up>", "<cmd>resize +2<CR>", { desc = "Increase height" })
vim.keymap.set("n", "<S-Down>", "<cmd>resize -2<CR>", { desc = "Decrease height" })
vim.keymap.set("n", "<S-Right>", "<cmd>vertical resize +2<CR>", { desc = "Increase width" })
vim.keymap.set("n", "<S-Left>", "<cmd>vertical resize -2<CR>", { desc = "Decrease width" })

-- Search and replace word under cursor
vim.keymap.set("n", "<leader>sr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Search & replace word" })

-- Make file executable
vim.keymap.set("n", "<leader>cx", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Make file executable" })

-- Terminal escape
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
