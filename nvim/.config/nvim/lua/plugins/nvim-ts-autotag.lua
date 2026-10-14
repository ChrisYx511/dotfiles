return {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    cond = function() return not vim.g.vscode end,
    opts = {},
}
