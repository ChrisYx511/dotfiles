return {
    "mason-org/mason-lspconfig.nvim",
    opts = {
        automatic_enable = {
            exclude = {
                "metals",
                "denols",
                "ts_ls"
            }
        }
    },
    cond = (function() return not vim.g.vscode end),
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    },
    event = { "BufReadPre", "BufNewFile" },
    config = function(_, opts)
        vim.lsp.config('denols', {
            root_markers = { "deno.json", "deno.jsonc" },
        })

        vim.lsp.config('ts_ls', {
            root_markers = { "package.json" },
            root_dir = function(bufnr, on_dir)
                -- The project root is where the LSP can be started from
                -- As stated in the documentation above, this LSP supports monorepos and simple projects.
                -- We select then from the project root, which is identified by the presence of a package
                -- manager lock file.
                local root_markers = { 'package-lock.json', 'yarn.lock', 'pnpm-lock.yaml', 'bun.lockb', 'bun.lock' }
                -- Give the root markers equal priority by wrapping them in a table
                root_markers = vim.fn.has('nvim-0.11.3') == 1 and { root_markers }
                    or vim.list_extend(root_markers)
                local project_root = vim.fs.root(bufnr, root_markers)
                if project_root then
                    on_dir(project_root)
                end
            end,

            workspace_required = true
        })
        require("mason").setup({})
        require("mason-lspconfig").setup(opts)
        vim.lsp.enable({ "ts_ls" })
    end
}
