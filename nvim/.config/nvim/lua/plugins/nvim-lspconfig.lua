return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    cond = function() return not vim.g.vscode end,
    config = function()
        -- Diagnostics configuration
        vim.diagnostic.config({
            underline = true,
            update_in_insert = false,
            virtual_text = {
                spacing = 4,
                source = "if_many",
                prefix = "●",
            },
            severity_sort = true,
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = " ",
                    [vim.diagnostic.severity.WARN] = " ",
                    [vim.diagnostic.severity.HINT] = " ",
                    [vim.diagnostic.severity.INFO] = " ",
                },
            },
        })

        -- Enable inlay hints globally
        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(args)
                local client = vim.lsp.get_client_by_id(args.data.client_id)
                if client and client:supports_method("textDocument/inlayHint") then
                    vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
                end

                -- Enable codelens
                if client and client:supports_method("textDocument/codeLens") then
                    vim.lsp.codelens.refresh()
                    vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
                        buffer = args.buf,
                        callback = vim.lsp.codelens.refresh,
                    })
                end

                -- LSP folding
                if client and client:supports_method("textDocument/foldingRange") then
                    local win = vim.api.nvim_get_current_win()
                    if vim.wo[win].foldmethod == "manual" then
                        vim.wo[win].foldmethod = "expr"
                        vim.wo[win].foldexpr = "v:lua.vim.lsp.foldexpr()"
                    end
                    vim.opt.foldlevelstart = 99
                end
            end,
        })

        -- Keymaps
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Goto definition" })
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Goto declaration" })
        vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "References" })
        vim.keymap.set("n", "gI", vim.lsp.buf.implementation, { desc = "Goto implementation" })
        vim.keymap.set("n", "gy", vim.lsp.buf.type_definition, { desc = "Goto type definition" })
        vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover" })
        vim.keymap.set("n", "gK", vim.lsp.buf.signature_help, { desc = "Signature help" })
        vim.keymap.set("i", "<c-k>", vim.lsp.buf.signature_help, { desc = "Signature help" })
        vim.keymap.set({ "n", "x" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
        vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { desc = "Rename" })
        vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, { desc = "Format" })
        vim.keymap.set("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line diagnostics" })
        vim.keymap.set({ "n", "x" }, "<leader>cc", vim.lsp.codelens.run, { desc = "Run codelens" })
        vim.keymap.set("n", "<leader>cC", vim.lsp.codelens.refresh, { desc = "Refresh codelens" })
        vim.keymap.set("n", "<leader>ci", vim.lsp.buf.incoming_calls, { desc = "Incoming calls" })
        vim.keymap.set("n", "<leader>co", vim.lsp.buf.outgoing_calls, { desc = "Outgoing calls" })

        -- Diagnostic navigation
        vim.keymap.set("n", "]d", function() vim.diagnostic.jump({ count = 1, float = true }) end, { desc = "Next diagnostic" })
        vim.keymap.set("n", "[d", function() vim.diagnostic.jump({ count = -1, float = true }) end, { desc = "Prev diagnostic" })

        -- Toggle inlay hints
        vim.keymap.set("n", "<leader>uh", function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
        end, { desc = "Toggle inlay hints" })
    end,
}
