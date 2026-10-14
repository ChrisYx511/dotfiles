return {
    "mbbill/undotree",
    cond = function() return not vim.g.vscode end,
    keys = {
        { "<leader>uu", vim.cmd.UndotreeToggle, desc = "Toggle undotree" },
    },
}
