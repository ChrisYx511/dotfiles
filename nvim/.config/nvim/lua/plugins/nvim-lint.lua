return {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    cond = function() return not vim.g.vscode end,
    config = function()
        local lint = require("lint")
        lint.linters_by_ft = {
            fish = { "fish" },
        }
        vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
            callback = function()
                lint.try_lint()
            end,
        })
    end,
}
