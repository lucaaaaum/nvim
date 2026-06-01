return {
    "nvim-tree/nvim-tree.lua",
    opts = {
        update_focused_file = {
            enable = true,
            update_root = false
        }
    },
    config = function(_, opts)
        require("nvim-tree").setup(opts)
        vim.keymap.set('n', '<leader>e', vim.cmd.NvimTreeToggle, {})
    end,
}
