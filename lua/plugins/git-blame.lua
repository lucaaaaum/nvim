return {
    "f-person/git-blame.nvim",
    event = "VeryLazy",
    opts = {
        set_extmark_options = {
            priority = 1
        }
    },
    config = function(_, opt)
        local blame = require("gitblame");
        blame.setup(opt);

        local function add_keymap(key, command)
            vim.keymap.set('n', key, command, {})
        end

        add_keymap('<Space>bc', ':GitBlameOpenCommitURL<CR>')
        add_keymap('<Space>bh', ':GitBlameCopySHA <CR>')
    end
}
