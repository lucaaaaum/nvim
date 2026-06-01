return {
    "nvim-telescope/telescope.nvim",

    config = function()
        require('telescope').setup()
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>f', builtin.current_buffer_fuzzy_find, {})
        vim.keymap.set('n', '<leader>F', builtin.live_grep, {})
        vim.keymap.set('n', '<leader>p', builtin.find_files, {})
        vim.keymap.set('n', '<leader>b', builtin.buffers, {})
    end
}
