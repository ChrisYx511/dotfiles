return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    cond = function() return not vim.g.vscode end,
    opts = {
        bigfile = { enabled = true },
        quickfile = { enabled = true },
        indent = { enabled = true },
        notifier = { enabled = true },
        input = { enabled = true },
        words = { enabled = true },
        scroll = { enabled = true },
        statuscolumn = { enabled = true },
        terminal = { enabled = true },
        dashboard = {
            enabled = true,
            preset = {
                keys = {
                    { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
                    { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
                    { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
                    { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
                    { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
                    { icon = " ", key = "s", desc = "Restore Session", action = ":AutoSession search" },
                    { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
                    { icon = " ", key = "q", desc = "Quit", action = ":qa" },
                },
            },
            sections = {
                { section = "header" },
                { section = "keys", gap = 1, padding = 1 },
                { section = "startup" },
            },
        },
    },
    keys = {
        { "<leader>bd", function() Snacks.bufdelete() end, desc = "Delete buffer" },
        { "<leader>un", function() Snacks.notifier.hide() end, desc = "Dismiss notifications" },
        { "<leader>nh", function() Snacks.notifier.show_history() end, desc = "Notification history" },
        -- Terminal
        { "<leader>tt", function() Snacks.terminal() end, desc = "Toggle terminal" },
        { "<leader>tv", function() Snacks.terminal(nil, { win = { position = "right", width = 0.4 } }) end, desc = "Terminal (vertical split)" },
        { "<leader>th", function() Snacks.terminal(nil, { win = { position = "bottom", height = 0.3 } }) end, desc = "Terminal (horizontal split)" },
        { "<C-/>", function() Snacks.terminal() end, desc = "Toggle terminal", mode = { "n", "t" } },
    },
}
