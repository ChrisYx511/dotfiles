return {
    "saghen/blink.cmp",
    version = "*",
    event = { "InsertEnter", "CmdlineEnter" },
    cond = function() return not vim.g.vscode end,
    dependencies = {
        "rafamadriz/friendly-snippets",
        { "fang2hou/blink-copilot" },
    },
    opts = {
        snippets = { preset = "default" },
        appearance = {
            use_nvim_cmp_as_default = false,
            nerd_font_variant = "mono",
        },
        completion = {
            accept = {
                auto_brackets = { enabled = true },
            },
            menu = {
                draw = {
                    treesitter = { "lsp" },
                },
            },
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 200,
            },
            ghost_text = {
                enabled = vim.g.ai_cmp,
            },
            list = {
                selection = { auto_insert = true }
            },
        },
        sources = {
            default = { "lazydev", "lsp", "path", "snippets", "buffer", "copilot" },
            providers = {
                copilot = {
                    name = "copilot",
                    module = "blink-copilot",
                    score_offset = 100,
                    async = true,
                },
            },
        },
        cmdline = {
            enabled = true,
            keymap = { preset = "cmdline" },
            completion = {
                list = { selection = { preselect = false } },
                menu = {
                    auto_show = function(ctx)
                        return vim.fn.getcmdtype() == ":"
                    end,
                },
                ghost_text = { enabled = true },
            },
        },
        keymap = {
            preset = "enter",
            ["<C-y>"] = { "select_and_accept" },
        },
    },
    config = function(_, opts)
        -- Tab keymap: snippet forward -> sidekick NES -> copilot accept -> fallback
        if not opts.keymap["<Tab>"] then
            opts.keymap["<Tab>"] = {
                function(cmp)
                    if cmp.snippet_active() then
                        return cmp.snippet_forward()
                    end
                end,
                function()
                    local ok, nes = pcall(require, "sidekick.nes")
                    if ok and nes.have() and (nes.jump() or nes.apply()) then
                        return true
                    end
                end,
                function()
                    local ok, suggestion = pcall(require, "copilot.suggestion")
                    if ok and suggestion.is_visible() then
                        suggestion.accept()
                        return true
                    end
                end,
                "fallback",
            }
        end
        if not opts.keymap["<S-Tab>"] then
            opts.keymap["<S-Tab>"] = {
                function(cmp)
                    if cmp.snippet_active() then
                        return cmp.snippet_backward()
                    end
                end,
                "fallback",
            }
        end
        require("blink.cmp").setup(opts)
    end,
}
