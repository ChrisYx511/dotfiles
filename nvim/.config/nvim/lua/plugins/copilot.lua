return {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    event = "BufReadPost",
    cond = function() return not vim.g.vscode end,
    opts = {
        suggestion = {
            -- When ai_cmp is true, blink.cmp handles ghost text via blink-copilot
            enabled = not vim.g.ai_cmp,
            auto_trigger = true,
            hide_during_completion = vim.g.ai_cmp,
            keymap = {
                accept = false, -- handled by blink.cmp
                next = "<M-]>",
                prev = "<M-[>",
            },
        },
        panel = { enabled = false },
        filetypes = {
            markdown = true,
            help = true,
        },
    },
}
