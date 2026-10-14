return {
    -- Highlight and search TODO/FIXME/HACK comments
    {
        "folke/todo-comments.nvim",
        event = "VeryLazy",
        cond = function() return not vim.g.vscode end,
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {},
        keys = {
            { "]t", function() require("todo-comments").jump_next() end, desc = "Next TODO" },
            { "[t", function() require("todo-comments").jump_prev() end, desc = "Prev TODO" },
            { "<leader>xt", "<cmd>Trouble todo toggle<cr>", desc = "TODO (Trouble)" },
            { "<leader>ft", "<cmd>TodoTelescope<cr>", desc = "Find TODO" },
        },
    },
    -- Better comment syntax via treesitter
    {
        "folke/ts-comments.nvim",
        event = "VeryLazy",
        opts = {},
    },
    -- Git signs in the gutter
    {
        "lewis6991/gitsigns.nvim",
        event = "VeryLazy",
        cond = function() return not vim.g.vscode end,
        opts = {
            signs = {
                add = { text = "▎" },
                change = { text = "▎" },
                delete = { text = "" },
                topdelete = { text = "" },
                changedelete = { text = "▎" },
                untracked = { text = "▎" },
            },
            on_attach = function(bufnr)
                local gs = package.loaded.gitsigns
                local function map(mode, l, r, desc)
                    vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
                end
                map("n", "]h", function() gs.nav_hunk("next") end, "Next hunk")
                map("n", "[h", function() gs.nav_hunk("prev") end, "Prev hunk")
                map({ "n", "v" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>", "Stage hunk")
                map({ "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>", "Reset hunk")
                map("n", "<leader>ghS", gs.stage_buffer, "Stage buffer")
                map("n", "<leader>ghu", gs.undo_stage_hunk, "Undo stage hunk")
                map("n", "<leader>ghR", gs.reset_buffer, "Reset buffer")
                map("n", "<leader>ghp", gs.preview_hunk_inline, "Preview hunk inline")
                map("n", "<leader>ghb", function() gs.blame_line({ full = true }) end, "Blame line")
                map("n", "<leader>ghd", gs.diffthis, "Diff this")
            end,
        },
    },
}
