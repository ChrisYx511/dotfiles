return {
    "tpope/vim-surround",
    event = "VeryLazy",
    cond = function() return not vim.g.vscode end,
}
