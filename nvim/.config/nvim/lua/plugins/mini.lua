return {
    {
        "echasnovski/mini.icons",
        lazy = true,
        cond = function() return not vim.g.vscode end,
        opts = {},
        init = function()
            -- Compatibility shim for plugins expecting nvim-web-devicons
            package.preload["nvim-web-devicons"] = function()
                require("mini.icons").mock_nvim_web_devicons()
                return package.loaded["nvim-web-devicons"]
            end
        end,
    },
    {
        "echasnovski/mini.pairs",
        event = "InsertEnter",
        cond = function() return not vim.g.vscode end,
        opts = {},
    },
    {
        "echasnovski/mini.ai",
        event = "VeryLazy",
        cond = function() return not vim.g.vscode end,
        opts = function()
            local ai = require("mini.ai")
            return {
                n_lines = 500,
                custom_textobjects = {
                    o = ai.gen_spec.treesitter({ -- code block
                        a = { "@block.outer", "@conditional.outer", "@loop.outer" },
                        i = { "@block.inner", "@conditional.inner", "@loop.inner" },
                    }),
                    f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }),
                    c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }),
                    t = { "<([%p%w]-)%f[^<%w][^<>]->.-</%1>", "^<.->().googletag" },
                    d = { "%f[%d]%d+" }, -- digits
                    e = { -- word with case
                        { "%u[%l%d]+%f[^%l%d]", "%f[%S][%l%d]+%f[^%l%d]", "%f[%P][%l%d]+%f[^%l%d]", "^[%l%d]+%f[^%l%d]" },
                        "^().*()$",
                    },
                    u = ai.gen_spec.function_call(), -- function call (with dot)
                    U = ai.gen_spec.function_call({ name_pattern = "[%w_]" }), -- without dot
                },
            }
        end,
    },
    {
        "echasnovski/mini.files",
        cond = function() return not vim.g.vscode end,
        opts = {
            mappings = {
                go_in = "l",
                go_in_plus = "L",
                go_out = "h",
                go_out_plus = "H",
                synchronize = "=",
                show_help = "g?",
            },
            windows = {
                preview = true,
                width_preview = 40,
            },
        },
        keys = {
            {
                "<leader>e",
                function()
                    local mf = require("mini.files")
                    if not mf.close() then
                        mf.open(vim.api.nvim_buf_get_name(0), true)
                    end
                end,
                desc = "Explorer (current file)",
            },
            {
                "<leader>pv",
                function()
                    local mf = require("mini.files")
                    if not mf.close() then
                        mf.open(vim.api.nvim_buf_get_name(0), true)
                    end
                end,
                desc = "Explorer (current file)",
            },
            {
                "<leader>E",
                function()
                    local mf = require("mini.files")
                    if not mf.close() then
                        mf.open(vim.uv.cwd(), true)
                    end
                end,
                desc = "Explorer (cwd)",
            },
        },
    },
}
