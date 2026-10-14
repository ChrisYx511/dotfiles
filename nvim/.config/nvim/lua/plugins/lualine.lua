return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'echasnovski/mini.icons' },
    event = "VeryLazy",
    cond = function()
        return not vim.g.vscode -- disable in vscode
    end,
    config = function()
        require('lualine').setup {
            sections = {
                lualine_c = {
                    {
                        'filename',
                        file_status = true, -- displays file status (readonly status, modified status)
                        path = 1            -- 0 = just filename, 1 = relative path, 2 = absolute path
                    }
                },
                lualine_x = { 'lsp_status', 'encoding', 'fileformat', 'filetype' },
            },
            inactive_sections = {
                lualine_c = {
                    {
                        'filename',
                        file_status = true, -- displays file status (readonly status, modified status)
                        path = 1            -- 0 = just filename, 1 = relative path, 2 = absolute path
                    }
                }
            },

        }
    end

}
