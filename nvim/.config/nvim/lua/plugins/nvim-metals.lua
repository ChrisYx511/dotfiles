return {
    "scalameta/nvim-metals",
    ft = { "scala", "sbt", "java" },
    dependencies = {
        "mfussenegger/nvim-dap",
    },
    opts = function()
        local metals_config = require("metals").bare_config()
        metals_config.init_options.statusBarProvider = "off"

        metals_config.on_attach = function(client, bufnr)
            local function map(mode, l, r, desc)
                vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
            end

            map("n", "<leader>mc", vim.lsp.codelens.run, "Metals codelens")
            map("n", "<leader>mw", function() require("metals").hover_worksheet() end, "Metals hover worksheet")
            map("n", "<leader>ma", vim.diagnostic.setqflist, "All workspace diagnostics")
            map("n", "<leader>me", function() vim.diagnostic.setqflist({ severity = "E" }) end, "Workspace errors")
            map("n", "<leader>mW", function() vim.diagnostic.setqflist({ severity = "W" }) end, "Workspace warnings")
            map("n", "<leader>mm", function() require("telescope").extensions.metals.commands() end, "Metals commands")

            map("n", "[d", function() vim.diagnostic.jump({ count = -1, float = true }) end, "Prev diagnostic")
            map("n", "]d", function() vim.diagnostic.jump({ count = 1, float = true }) end, "Next diagnostic")

            require("metals").setup_dap()
        end

        return metals_config
    end,
    config = function(self, metals_config)
        local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
        vim.api.nvim_create_autocmd("FileType", {
            pattern = self.ft,
            callback = function()
                require("metals").initialize_or_attach(metals_config)
            end,
            group = nvim_metals_group,
        })
    end,
}
