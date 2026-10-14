return {
    "tpope/vim-fugitive",
    cond = function() return not vim.g.vscode end,
    cmd = "Git",
    keys = {
        { "<leader>gs", vim.cmd.Git, desc = "Git status" },
    },
}
