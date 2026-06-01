return {
    "akinsho/toggleterm.nvim",
    opts = {},
    config = function(_, opts)
        require("toggleterm").setup(opts)

        local Terminal = require("toggleterm.terminal").Terminal;

        local lazygit = Terminal:new({
            cmd = "lazygit",
            hidden = true,
            direction = "float",
            dir = "git_dir",
            border = "shadow",
            on_open = function(_)
                vim.keymap.set('n', "q", "<cmd>close<CR>", { noremap = true, silent = true })
            end
        })
        function _Lazygit_toggle()
            lazygit:toggle()
        end

        vim.keymap.set('n', '<Space>g', '<cmd>lua _Lazygit_toggle()<CR>', {
            noremap = true,
            silent = true
        })
    end
}
