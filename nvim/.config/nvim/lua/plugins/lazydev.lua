return {
    {
        "folke/lazydev.nvim",
        ft = "lua",
        cond = function() return not vim.g.vscode end,
        opts = {
            library = {
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                { path = "snacks.nvim", words = { "Snacks" } },
                { path = "lazy.nvim", words = { "LazyVim" } },
            },
        },
    },
    -- Wire lazydev as a blink.cmp source
    {
        "saghen/blink.cmp",
        opts = {
            sources = {
                providers = {
                    lazydev = {
                        name = "LazyDev",
                        module = "lazydev.integrations.blink",
                        score_offset = 100,
                    },
                },
            },
        },
    },
}
