return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    cond = function() return not vim.g.vscode end,
    opts = {
        preset = "helix",
        spec = {
            { "<leader>a", group = "ai" },
            { "<leader>b", group = "buffer" },
            { "<leader>c", group = "code" },
            { "<leader>d", group = "debug" },
            { "<leader>f", group = "find" },
            { "<leader>g", group = "git" },
            { "<leader>h", group = "harpoon" },
            { "<leader>m", group = "metals" },
            { "<leader>q", group = "session" },
            { "<leader>s", group = "search" },
            { "<leader>t", group = "terminal" },
            { "<leader>u", group = "ui" },
            { "<leader>w", group = "window" },
            { "<leader>x", group = "diagnostics" },
            { "[", group = "prev" },
            { "]", group = "next" },
            { "g", group = "goto" },
        },
    },
    keys = {
        {
            "<leader>?",
            function() require("which-key").show({ global = false }) end,
            desc = "Buffer keymaps",
        },
    },
}
