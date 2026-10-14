return {
    "MeanderingProgrammer/render-markdown.nvim",
    cond = function() return not vim.g.vscode end,
    ft = { "markdown" },
    dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.icons" },
    opts = {},
    keys = {
        { "<leader>um", "<cmd>RenderMarkdown toggle<cr>", desc = "Toggle Markdown rendering", ft = "markdown" },
    },
}
