return {
    "rcarriga/nvim-notify",
    opts = {
        render = "wrapped-compact",
    },
    config = function(_, opt)
        local notify = require('notify')
        notify.setup(opt)

        vim.notify = notify

        vim.keymap.set('n', '<leader>M', function()
            require('telescope').extensions.notify.notify()
        end)
    end
}
