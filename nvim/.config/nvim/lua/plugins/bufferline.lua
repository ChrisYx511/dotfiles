return {
    "akinsho/bufferline.nvim",
    version = "*",
    event = "VeryLazy",
    cond = function() return not vim.g.vscode end,
    dependencies = { "echasnovski/mini.icons" },
    opts = {
        options = {
            diagnostics = "nvim_lsp",
            always_show_bufferline = false,
            offsets = {
                {
                    filetype = "trouble",
                    text = "Diagnostics",
                    highlight = "Directory",
                    text_align = "left",
                },
            },
        },
    },
    keys = {
        { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev buffer" },
        { "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
        { "[b", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev buffer" },
        { "]b", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
        { "<leader>bp", "<cmd>BufferLineTogglePin<cr>", desc = "Toggle pin" },
        { "<leader>bP", "<cmd>BufferLineGroupClose ungrouped<cr>", desc = "Delete non-pinned buffers" },
        { "<leader>bo", "<cmd>BufferLineCloseOthers<cr>", desc = "Delete other buffers" },
        { "<leader>bl", "<cmd>BufferLineCloseLeft<cr>", desc = "Delete buffers to the left" },
        { "<leader>br", "<cmd>BufferLineCloseRight<cr>", desc = "Delete buffers to the right" },
        { "<leader>bj", "<cmd>BufferLinePick<cr>", desc = "Pick buffer" },
    },
}
