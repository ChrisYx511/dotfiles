return {
    -- Enable Copilot language server for NES
    {
        "neovim/nvim-lspconfig",
        opts = function(_, opts)
            vim.lsp.config("copilot", {})
            vim.lsp.enable("copilot")
        end,
    },

    -- Sidekick
    {
        "folke/sidekick.nvim",
        cond = function() return not vim.g.vscode end,
        opts = function()
            -- Toggle NES
            Snacks.toggle({
                name = "Sidekick NES",
                get = function()
                    return require("sidekick.nes").enabled
                end,
                set = function(state)
                    require("sidekick.nes").enable(state)
                end,
            }):map("<leader>uN")
        end,
        -- stylua: ignore
        keys = {
            -- NES in normal mode: Tab accepts next edit suggestion
            {
                "<tab>",
                function()
                    local ok, nes = pcall(require, "sidekick.nes")
                    if ok and nes.have() and (nes.jump() or nes.apply()) then
                        return
                    end
                    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<tab>", true, false, true), "n", false)
                end,
                desc = "Accept NES",
                mode = "n",
            },
            { "<leader>a", "", desc = "+ai", mode = { "n", "v" } },
            { "<c-.>", function() require("sidekick.cli").focus() end, desc = "Sidekick Focus", mode = { "n", "t", "i", "x" } },
            { "<leader>aa", function() require("sidekick.cli").toggle() end, desc = "Sidekick Toggle CLI" },
            { "<leader>as", function() require("sidekick.cli").select() end, desc = "Select CLI" },
            { "<leader>ad", function() require("sidekick.cli").close() end, desc = "Detach a CLI Session" },
            { "<leader>at", function() require("sidekick.cli").send({ msg = "{this}" }) end, mode = { "x", "n" }, desc = "Send This" },
            { "<leader>af", function() require("sidekick.cli").send({ msg = "{file}" }) end, desc = "Send File" },
            { "<leader>av", function() require("sidekick.cli").send({ msg = "{selection}" }) end, mode = { "x" }, desc = "Send Visual Selection" },
            { "<leader>ap", function() require("sidekick.cli").prompt() end, mode = { "n", "x" }, desc = "Sidekick Select Prompt" },
        },
    },

    -- Snacks picker integration
    {
        "folke/snacks.nvim",
        optional = true,
        opts = {
            picker = {
                actions = {
                    sidekick_send = function(...)
                        return require("sidekick.cli.picker.snacks").send(...)
                    end,
                },
                win = {
                    input = {
                        keys = {
                            ["<a-a>"] = { "sidekick_send", mode = { "n", "i" } },
                        },
                    },
                },
            },
        },
    },
}
