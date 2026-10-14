return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    dependencies = {
        {
            "nvim-treesitter/nvim-treesitter-textobjects",
            branch = "main",
            init = function()
                vim.g.no_plugin_maps = true
            end,
        },
    },
    config = function()
        require("nvim-treesitter").setup({
            auto_install = true,
        })
        require("nvim-treesitter").install({ "markdown", "markdown_inline" })

        -- Treesitter textobjects: move module
        local move = require("nvim-treesitter-textobjects.move")
        local configs = {
            -- Next start
            ["]f"] = { query = "@function.outer", desc = "Next function start" },
            ["]c"] = { query = "@class.outer", desc = "Next class start" },
            ["]a"] = { query = "@parameter.inner", desc = "Next parameter start" },
            -- Next end
            ["]F"] = { query = "@function.outer", query_group = "textobjects", desc = "Next function end" },
            ["]C"] = { query = "@class.outer", query_group = "textobjects", desc = "Next class end" },
            ["]A"] = { query = "@parameter.inner", desc = "Next parameter end" },
            -- Previous start
            ["[f"] = { query = "@function.outer", desc = "Prev function start" },
            ["[c"] = { query = "@class.outer", desc = "Prev class start" },
            ["[a"] = { query = "@parameter.inner", desc = "Prev parameter start" },
            -- Previous end
            ["[F"] = { query = "@function.outer", query_group = "textobjects", desc = "Prev function end" },
            ["[C"] = { query = "@class.outer", query_group = "textobjects", desc = "Prev class end" },
            ["[A"] = { query = "@parameter.inner", desc = "Prev parameter end" },
        }

        -- Register keymaps for move operations
        for key, opts in pairs(configs) do
            local is_next = key:sub(1, 1) == "]"
            local is_end = key:sub(2, 2) == key:sub(2, 2):upper() and key:sub(2, 2) ~= key:sub(2, 2):lower()
            local fn_name
            if is_next and not is_end then
                fn_name = "goto_next_start"
            elseif is_next and is_end then
                fn_name = "goto_next_end"
            elseif not is_next and not is_end then
                fn_name = "goto_previous_start"
            else
                fn_name = "goto_previous_end"
            end
            vim.keymap.set({ "n", "x", "o" }, key, function()
                move[fn_name](opts.query, opts.query_group or "textobjects")
            end, { desc = opts.desc })
        end
    end,
}
