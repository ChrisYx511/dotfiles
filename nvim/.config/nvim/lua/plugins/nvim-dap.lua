return {
    "mfussenegger/nvim-dap",
    cond = function() return not vim.g.vscode end,
    dependencies = {
        -- Mason DAP bridge: auto-install debug adapters
        {
            "jay-babu/mason-nvim-dap.nvim",
            dependencies = "mason-org/mason.nvim",
            cmd = { "DapInstall", "DapUninstall" },
            opts = {
                automatic_installation = true,
                handlers = {},
            },
        },
        -- DAP UI
        {
            "rcarriga/nvim-dap-ui",
            dependencies = "nvim-neotest/nvim-nio",
            keys = {
                { "<leader>du", function() require("dapui").toggle({}) end, desc = "DAP UI" },
                { "<leader>de", function() require("dapui").eval() end, desc = "Eval", mode = { "n", "v" } },
            },
            opts = {},
            config = function(_, opts)
                local dap = require("dap")
                local dapui = require("dapui")
                dapui.setup(opts)
                dap.listeners.after.event_initialized["dapui_config"] = function()
                    dapui.open({})
                end
                dap.listeners.before.event_terminated["dapui_config"] = function()
                    dapui.close({})
                end
                dap.listeners.before.event_exited["dapui_config"] = function()
                    dapui.close({})
                end
            end,
        },
        -- Inline variable display
        {
            "theHamsta/nvim-dap-virtual-text",
            opts = {},
        },
        -- Go debugging (Delve)
        {
            "leoluz/nvim-dap-go",
            opts = {},
        },
        -- Ruby debugging (debug.rb)
        {
            "suketa/nvim-dap-ruby",
            config = function()
                require("dap-ruby").setup()
            end,
        },
    },
    keys = {
        { "<leader>dc", function() require("dap").continue() end, desc = "Continue" },
        { "<leader>da", function() require("dap").continue({ before = get_args }) end, desc = "Run with args" },
        { "<leader>dC", function() require("dap").run_to_cursor() end, desc = "Run to cursor" },
        { "<leader>dg", function() require("dap").goto_() end, desc = "Go to line (no execute)" },
        { "<leader>do", function() require("dap").step_over() end, desc = "Step over" },
        { "<leader>di", function() require("dap").step_into() end, desc = "Step into" },
        { "<leader>dO", function() require("dap").step_out() end, desc = "Step out" },
        { "<leader>dj", function() require("dap").down() end, desc = "Down" },
        { "<leader>dk", function() require("dap").up() end, desc = "Up" },
        { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle breakpoint" },
        { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: ")) end, desc = "Breakpoint condition" },
        { "<leader>dL", function() require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: ")) end, desc = "Log point" },
        { "<leader>dr", function() require("dap").repl.toggle() end, desc = "Toggle REPL" },
        { "<leader>dl", function() require("dap").run_last() end, desc = "Run last" },
        { "<leader>dt", function() require("dap").terminate() end, desc = "Terminate" },
        { "<leader>dP", function() require("dap").pause() end, desc = "Pause" },
        { "<leader>dh", function() require("dap.ui.widgets").hover() end, desc = "Hover", mode = { "n", "v" } },
        { "<leader>dp", function() require("dap.ui.widgets").preview() end, desc = "Preview", mode = { "n", "v" } },
        { "<leader>df", function() local w = require("dap.ui.widgets"); w.centered_float(w.frames) end, desc = "Frames" },
        { "<leader>ds", function() local w = require("dap.ui.widgets"); w.centered_float(w.scopes) end, desc = "Scopes" },
        { "<leader>dw", function() require("dap.ui.widgets").hover() end, desc = "Widgets" },
        -- Go-specific
        { "<leader>dGt", function() require("dap-go").debug_test() end, desc = "Debug Go test", ft = "go" },
        { "<leader>dGl", function() require("dap-go").debug_last_test() end, desc = "Debug last Go test", ft = "go" },
        -- F-keys as secondary bindings
        { "<F5>", function() require("dap").continue() end, desc = "DAP Continue" },
        { "<F10>", function() require("dap").step_over() end, desc = "DAP Step over" },
        { "<F11>", function() require("dap").step_into() end, desc = "DAP Step into" },
        { "<F12>", function() require("dap").step_out() end, desc = "DAP Step out" },
    },
    config = function()
        -- Custom signs for breakpoints
        vim.fn.sign_define("DapBreakpoint", { text = " ", texthl = "DiagnosticError" })
        vim.fn.sign_define("DapBreakpointCondition", { text = " ", texthl = "DiagnosticWarn" })
        vim.fn.sign_define("DapBreakpointRejected", { text = " ", texthl = "DiagnosticError" })
        vim.fn.sign_define("DapLogPoint", { text = " ", texthl = "DiagnosticInfo" })
        vim.fn.sign_define("DapStopped", { text = "󰁕 ", texthl = "DiagnosticWarn", linehl = "DapStoppedLine", numhl = "DapStoppedLine" })
    end,
}
