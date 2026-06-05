return {
    "nvim-telescope/telescope.nvim",

    config = function()
        require('telescope').setup()
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>f', builtin.current_buffer_fuzzy_find, {})
        vim.keymap.set('n', '<leader>F', builtin.live_grep, {})
        vim.keymap.set('n', '<leader>p', builtin.find_files, {})
        vim.keymap.set('n', '<leader>b', builtin.buffers, {})

        local function get_visual_selection()
            local s_start = vim.fn.getpos "."
            local s_end = vim.fn.getpos "v"
            return vim.fn.getregion(s_start, s_end)
        end

        local function search_selected_text(command)
            local selected_lines = get_visual_selection()
            if (#selected_lines > 1) then
                vim.notify("Cannot grep multiple lines", vim.log.levels.WARN)
                return
            end
            local selected = table.concat(selected_lines, '\n')
            vim.notify(selected_lines)
            command({
                default_text = selected,
                initial_mode = "insert"
            })
        end

        vim.keymap.set('v', '<leader>f', function()
            search_selected_text(builtin.current_buffer_fuzzy_find)
        end)

        vim.keymap.set('v', '<leader>F', function()
            search_selected_text(builtin.live_grep)
        end)
    end
}
