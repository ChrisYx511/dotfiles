return {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    priority = 1000,
    config = function()
        vim.cmd("colorscheme rose-pine")
    end,
    cond = (function() return not vim.g.vscode end),
}
