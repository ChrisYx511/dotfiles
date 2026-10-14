return {
    {
        "p00f/clangd_extensions.nvim",
        cond = function() return not vim.g.vscode end,
        lazy = true,
        opts = {
            inlay_hints = {
                inline = false,
            },
            ast = {
                role_icons = {
                    type = "",
                    declaration = "",
                    expression = "",
                    statement = "",
                    specifier = "",
                    ["template argument"] = "",
                },
                kind_icons = {
                    Compound = "",
                    Recovery = "",
                    TranslationUnit = "",
                    PackExpansion = "",
                    TemplateTypeParm = "",
                    TemplateTemplateParm = "",
                    TemplateParamObject = "",
                },
            },
        },
    },
    -- Configure clangd LSP with enhanced flags
    {
        "neovim/nvim-lspconfig",
        opts = {},
        ft = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
        init = function()
            vim.api.nvim_create_autocmd("FileType", {
                pattern = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
                once = true,
                callback = function()
                    vim.lsp.config("clangd", {
                        cmd = {
                            "clangd",
                            "--background-index",
                            "--clang-tidy",
                            "--header-insertion=iwyu",
                            "--completion-style=detailed",
                            "--function-arg-placeholders",
                            "--fallback-style=llvm",
                        },
                        root_markers = {
                            ".clangd",
                            ".clang-tidy",
                            ".clang-format",
                            "compile_commands.json",
                            "compile_flags.txt",
                            "configure.ac",
                            ".git",
                        },
                        capabilities = {
                            offsetEncoding = { "utf-16" },
                        },
                        init_options = {
                            usePlaceholders = true,
                            completeUnimported = true,
                            clangdFileStatus = true,
                        },
                    })
                    vim.lsp.enable("clangd")
                end,
            })
        end,
        keys = {
            { "<leader>cH", "<cmd>ClangdSwitchSourceHeader<cr>", desc = "Switch source/header", ft = { "c", "cpp", "objc", "objcpp" } },
        },
    },
    -- Add clangd to mason-lspconfig exclusion
    {
        "mason-org/mason-lspconfig.nvim",
        opts = function(_, opts)
            opts.automatic_enable = opts.automatic_enable or {}
            opts.automatic_enable.exclude = opts.automatic_enable.exclude or {}
            if not vim.tbl_contains(opts.automatic_enable.exclude, "clangd") then
                table.insert(opts.automatic_enable.exclude, "clangd")
            end
        end,
    },
}
