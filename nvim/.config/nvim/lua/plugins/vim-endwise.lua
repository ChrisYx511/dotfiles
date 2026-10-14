return {
    "tpope/vim-endwise",
    event = "InsertEnter",
    cond = function() return not vim.g.vscode end,
}
