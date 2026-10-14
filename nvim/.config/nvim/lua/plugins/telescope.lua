return {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
        "nvim-telescope/telescope-ui-select.nvim",
        "echasnovski/mini.icons",
        "nvim-telescope/telescope-live-grep-args.nvim",
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    },
    cond = (function() return not vim.g.vscode end),
    config = function()
        require('telescope').setup {
            defaults = {
                file_ignore_patterns = { "node_modules", "%.rbi" },
            },
            extensions = {
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown {

                        layout_config = {
                            width = function(_, max_columns, _)
                                if max_columns > 80 then
                                    return math.floor(max_columns * 0.8)
                                else
                                    return max_columns
                                end
                            end,
                        }
                    },
                }
            }
        }
        require('telescope').load_extension('ui-select')
        require('telescope').load_extension("live_grep_args")
        require('telescope').load_extension('fzf')
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
        vim.keymap.set('n', '<leader>fg', require('telescope').extensions.live_grep_args.live_grep_args,
            { desc = 'Telescope live grep' })
        vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
        vim.keymap.set('n', '<C-p>', builtin.find_files, { desc = 'Telescope find files' })
        vim.keymap.set('n', '<C-g>', builtin.git_files, { desc = 'Telescope find files' })
    end,

}
