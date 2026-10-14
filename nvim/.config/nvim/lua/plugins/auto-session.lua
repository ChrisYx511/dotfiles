return {
    "rmagatti/auto-session",
    lazy = false,
    cond = function() return not vim.g.vscode end,
    keys = {
        { "<leader>qr", "<cmd>AutoSession search<CR>", desc = "Session search" },
        { "<leader>qs", "<cmd>AutoSession save<CR>", desc = "Save session" },
        { "<leader>qa", "<cmd>AutoSession toggle<CR>", desc = "Toggle autosave" },
    },
    ---@module "auto-session"
    ---@type AutoSession.Config
    opts = {
        suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
        post_restore_cmds = {
            function()
                -- Trigger lazy-loading of plugins gated on BufReadPre (LSP, treesitter, etc.)
                -- by re-firing the event on the current buffer
                vim.api.nvim_exec_autocmds("BufReadPre", { buffer = 0 })

                -- Defer LspStart so lazy-loaded plugins have finished initializing
                vim.schedule(function()
                    -- Re-detect filetype on all restored buffers so LSP can match them
                    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
                        if vim.api.nvim_buf_is_valid(buf) and vim.bo[buf].buflisted and vim.bo[buf].buftype == "" then
                            vim.api.nvim_buf_call(buf, function()
                                vim.cmd("filetype detect")
                            end)
                        end
                    end
                end)
            end,
        },
        session_lens = {
            picker = "telescope",
            mappings = {
                delete_session = { "i", "<C-d>" },
                alternate_session = { "i", "<C-s>" },
                copy_session = { "i", "<C-y>" },
            },
        },
    },
}
